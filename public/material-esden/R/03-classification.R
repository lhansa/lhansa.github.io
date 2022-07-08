## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos de clasificación   ##
## Ejemplos                   ##

# Lectura de datos --------------------------------------------------------
library(readr)
df_framingham <- read_csv2("data/framingham.csv")

# Exploración -------------------------------------------------------------
# Hay una proporción dispar entre casos 1 y casos 0
library(ggplot2)
ggplot(df_framingham) + 
  geom_bar(aes(ten_year_chd))


# La proporción de individuos con enfermedad cardiovascular (CHD por sus siglas en inglés) es:
mean(df_framingham$ten_year_chd)

# Problemas que se plantean: 
# - Pensemos en caso extremo de 1% de casos 1. ¿Cuán bueno sería un modelo que etiquetara a todo como 0?
# - ¿Qué ocurre si aplicamos una regresión lineal?

# Regresión lineal frente a logística en dos dimensiones. 
library(dplyr)
df_framingham %>% 
  mutate(age = as.factor(age)) %>% 
  ggplot() + 
  geom_bar(aes(x = age, fill = as.factor(ten_year_chd)), position = "fill")

ggplot(df_framingham, aes(x = age, y = ten_year_chd)) + 
  geom_point(size = 0.5, alpha = 0.4) + 
  geom_smooth(method = "lm") # Recta de regresión

# ggplot(df_framingham, aes(x = age, y = ten_year_chd)) + 
#   geom_jitter(alpha = 0.4) + # Para ver por qué queda tan baja la recta
#   geom_smooth(method = "lm") 

fit_linear <- lm(ten_year_chd ~ age, data = df_framingham)
summary(fit_linear)

# El coeficiente de la edad es positivo y significativo: algo esperable. 
# Detalle en el ajuste:
# Pregunta. ¿Qué salta a la vista en el gráfico?
# Tengamos en cuenta que estamos intentando etiquetar ceros y unos o, en su defecto, probabilidades.
ggplot() + 
  geom_histogram(aes(x = fit_linear$fitted.values))  +
  geom_vline(xintercept = 0, color = "red", linetype = 2) + 
  labs(x = "Valores ajustados", y = "Frecuencia")



# Regresión logística -----------------------------------------------------
# Quitamos missing
df_framingham <- na.omit(df_framingham)

fit_logit0 <- glm(ten_year_chd ~ age, data = df_framingham, family = binomial(link = "logit"))
summary(fit_logit0)

# Cómo interpretamso el intercept? A partir de la fórmula.

# Modelo con todas las variables
# glm(ten_year_chd ~ ., data = df_framingham, family = binomial(link = "logit"))

# Modelo con todas las variables pero sintaxis más cómoda
# Truco para escribir todas las variables:  
# cat(names(df_framingham), sep = "\n + ")

fit_logit <- glm(ten_year_chd ~ 1
                 + male
                 + age
                 + high_school_ged
                 + some_college_vocational_school
                 + college
                 + current_smoker
                 + cigs_per_day
                 + bp_meds
                 + prevalent_stroke
                 + prevalent_hyp
                 + diabetes
                 + tot_chol
                 + sys_bp
                 + dia_bp
                 + bmi
                 + heart_rate
                 + glucose 
                 , data = df_framingham, family = binomial("logit"))

summary(fit_logit)

# Hay que quitar variables del modelo.

df_framingham %>% 
  select(prevalent_hyp, heart_rate) %>% 
  ggplot() + 
  geom_histogram(aes(x = heart_rate)) + 
  facet_grid(prevalent_hyp ~ ., scales = "free_y")
# Estamos introduciendo variables continuas y binarias pero que recogen la misma información


# Solo las variables binarias

library(purrr)
vars_binarias <- df_framingham %>% 
  map(~length(unique(.))) %>% 
  keep(~. == 2) %>% 
  names()

vars_binarias
fit_logit <- glm(ten_year_chd ~ 
                   1
                 + male
                 # + age
                 + high_school_ged
                 + some_college_vocational_school
                 # + college
                 + current_smoker
                 # + cigs_per_day
                 + bp_meds
                 + prevalent_stroke
                 + prevalent_hyp
                 + diabetes
                 # + tot_chol
                 # + sys_bp
                 # + dia_bp
                 # + bmi
                 # + heart_rate
                 # + glucose ,
                 ,data = df_framingham, family = binomial("logit"))

summary(fit_logit)


# Ajuste --------------------------------------------------------------

library(caret)
# predict_logit <- predict(fit_logit, newdata = df_framingham, type = "response")
confusionMatrix(as.factor(as.numeric(fit_logit$fitted.values > 0.5)), 
                as.factor(df_framingham$ten_year_chd), 
                positive = "1")

confusionMatrix(as.factor(as.numeric(fit_logit$fitted.values > mean(df_framingham$ten_year_chd))), 
                as.factor(df_framingham$ten_year_chd), 
                positive = "1")


library(ROCR)
auc_aux <- performance(prediction(fit_logit$fitted.values, 
                       df_framingham$ten_year_chd), 
            measure = "auc")

as.numeric(auc_aux@y.values)

plot(
  performance(prediction(fit_logit$fitted.values, 
                         df_framingham$ten_year_chd), 
              measure="tpr", x.measure="fpr")
)

# ¿Cómo sabemos si es bueno y estable este resultado?


# Train y test ------------------------------------------------------------

train_size <- floor(0.7 * nrow(df_framingham))
set.seed(31818)
filas_para_train <- sample(seq_len(nrow(df_framingham)), train_size) 

df_framingham_train <- df_framingham[filas_para_train, ] 
df_framingham_test <- df_framingham[-filas_para_train, ] 

fit_logit_split <- glm(ten_year_chd ~ 
                   1
                 + male
                 + high_school_ged
                 + some_college_vocational_school
                 + current_smoker
                 + bp_meds
                 + prevalent_stroke
                 + prevalent_hyp
                 + diabetes
                 ,data = df_framingham_train, family = binomial("logit"))

summary(fit_logit_split)

predicciones_train <- predict(fit_logit_split, newdata = df_framingham_train, type = "response")
predicciones_test <- predict(fit_logit_split, newdata = df_framingham_test, type = "response")

confusionMatrix(as.factor(as.numeric(predicciones_train > mean(df_framingham_train$ten_year_chd))), 
                as.factor(df_framingham_train$ten_year_chd), 
                positive = "1")

confusionMatrix(as.factor(as.numeric(predicciones_test > mean(df_framingham_train$ten_year_chd))), # mantenemos la media de train 
                as.factor(df_framingham_test$ten_year_chd), 
                positive = "1")

# El modelo parece sobre ajustado

# Problemas:
# - No hemos garantizado que la proporción de ceros y unos se mantenga constante


# Sobremuestreo -----------------------------------------------------------

filas_con_unos <- which(df_framingham$ten_year_chd == 1)

diferencia_de_ceros_y_unos <- sum(df_framingham$ten_year_chd == 0) - sum(df_framingham$ten_year_chd == 1)

set.seed(31818)
registros_extra_con_unos <- sample(filas_con_unos, size = diferencia_de_ceros_y_unos, replace = TRUE)

library(dplyr)
df_framingham_sobremuestreo <- df_framingham %>% 
  mutate(set = "original") %>% 
  bind_rows(df_framingham %>% 
              slice(registros_extra_con_unos) %>% 
              mutate(set = "sobremuestreo"))

# Hemos igualado la proporción de ceros y unos
mean(df_framingham_sobremuestreo$ten_year_chd)

# Ahora dividimos train y test

train_size <- floor(0.7 * nrow(df_framingham_sobremuestreo))
set.seed(31818)
filas_para_train <- sample(seq_len(nrow(df_framingham_sobremuestreo)), train_size) 

df_framingham_sobre_train <- df_framingham_sobremuestreo[filas_para_train, ] 
df_framingham_sobre_test <- df_framingham_sobremuestreo[-filas_para_train, ] 


fit_logit_split_sobre <- glm(ten_year_chd ~ 
                         1
                       + male
                       + high_school_ged
                       + some_college_vocational_school
                       + current_smoker
                       + bp_meds
                       + prevalent_stroke
                       + prevalent_hyp
                       + diabetes
                       ,data = df_framingham_sobre_train, 
                       family = binomial("logit"))

summary(fit_logit_split_sobre)

predicciones_train <- predict(fit_logit_split_sobre, newdata = df_framingham_sobre_train, type = "response")
predicciones_test <- predict(fit_logit_split_sobre, newdata = df_framingham_sobre_test, type = "response")

confusionMatrix(as.factor(as.numeric(predicciones_train > mean(df_framingham_sobre_train$ten_year_chd))), 
                as.factor(df_framingham_sobre_train$ten_year_chd), 
                positive = "1")

confusionMatrix(as.factor(as.numeric(predicciones_test > mean(df_framingham_sobre_train$ten_year_chd))), # mantenemos la media de train 
                as.factor(df_framingham_sobre_test$ten_year_chd), 
                positive = "1")

# Un paso más sería usar test con la proporción original, apoyándonos en la columna extra set.


# Interpretación de resultados --------------------------------------------

# Odds ratio
oddsratio <- exp(fit_logit_split_sobre$coefficients)

tibble(variable = names(oddsratio), 
       odds_ratio = oddsratio) %>% 
  
  ggplot() + 
  geom_col(aes(x = reorder(variable, odds_ratio), y = odds_ratio, fill = odds_ratio >= 1)) + 
  labs(x = "Variable", y = "Odds ratio") + 
  coord_flip()


# SVM ---------------------------------------------------------------------

# En SVM no tendremos información sobre cuán significativas son las variables
library(e1071)

df_framingham_sobre_train <- df_framingham_sobre_train %>% 
  mutate(ten_year_chd = as.factor(ten_year_chd))

fit_svm <- svm(
  ten_year_chd ~ 
    1
  + male
  + age
  # + high_school_ged
  # + some_college_vocational_school
  # + college
  # + current_smoker
  + cigs_per_day
  # + bp_meds
  # + prevalent_stroke
  # + prevalent_hyp
  # + diabetes
  + tot_chol
  + sys_bp
  + dia_bp
  + bmi
  + heart_rate
  + glucose
  ,data = df_framingham_sobre_train, 
  type = "C-classification",
  kernel = "radial", 
  cost = 10,
  gamma = 0.1
)

summary(fit_svm)

predicciones_train <- predict(fit_svm, newdata = df_framingham_sobre_train, type = "response")
predicciones_test <- predict(fit_svm, newdata = df_framingham_sobre_test, type = "response")

confusionMatrix(predicciones_train, 
                as.factor(df_framingham_sobre_train$ten_year_chd), 
                positive = "1")

confusionMatrix(predicciones_test,
                as.factor(df_framingham_sobre_test$ten_year_chd), 
                positive = "1")


# Tuning parameteres ------------------------------------------------------
ajusta_svm <- function(coste, gamma){
  fit_svm <- svm(
    ten_year_chd ~ 
      + age
    + glucose
    ,data = df_framingham_sobre_train, 
    type = "C-classification",
    kernel = "radial", 
    cost = coste,
    gamma = gamma
  )
  
  return(fit_svm)
}

posibles_costes <- c(1, 10, 100)
gammas <- c(0.1, 1, 10)

library(purrr)
mallado <- cross_df(list(coste = posibles_costes, gamma = gammas))

numero_modelos <- nrow(mallado)
vector_accuracies <- numeric(numero_modelos)

for(i in seq_len(numero_modelos)){
  fit_auxiliar <- ajusta_svm(mallado$coste[i], mallado$gamma[i])
  predicciones_test <- predict(fit_auxiliar, newdata = df_framingham_sobre_test, type = "response")
  
  matriz_i <- confusionMatrix(predicciones_test,
                  as.factor(df_framingham_sobre_test$ten_year_chd), 
                  positive = "1")
  
  vector_accuracies[i] <- matriz_i$overall["Accuracy"]
}


which.max(vector_accuracies)

