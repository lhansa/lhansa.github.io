## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos de regresión       ##
## Ejercicio práctico         ##

# Ejercicio 0 -------------------------------------------------------------
# Realiza una exploración del conjunto de datos Boston:
data(Boston, package = "MASS")
head(Boston)

# Puedes acceder a la descripción de variables así:
? MASS::Boston

library(ggplot2)
library(dplyr)
library(tidyr)


# Ejercicio resuelto ------------------------------------------------------
# Convertir chas a binario
Boston <- Boston %>% 
  mutate(chas = as.logical(chas))


# Ejercicio resuelto ------------------------------------------------------
# Visualiza todas las variables
df_boston_pivot <- Boston %>% 
  pivot_longer(-c(medv, chas))

ggplot(df_boston_pivot, aes(x = medv, y = value, color = chas)) +
  geom_point(alpha = .4) +
  labs(y = "", x = "Median value of homes ($1000s)") + 
  scale_color_brewer(palette = "Set2") +
  facet_wrap( ~ name, scales = "free_y", ncol = 3)

# Correlaciones
corrplot::corrplot(cor(Boston))

# Ejercicio 1 - Regresión -------------------------------------------------
# - Ajusta un modelo de regresión lineal con las variables que consideres oportunas.
# - Calcula el R2 y otras medidas de error. 
# - Haz un gráfico de los residuos frente a los valores originales.


# Ejercicio 2 - Random Forest ---------------------------------------------
# - Ajusta un random forest (tendrás que hacer varias pruebas con distintos hiper parámetros)
# - Calcula el R2 y otras medidas de error. 
# - Compara el ajuste de los random forest con la regresión lineal anterior.

library(randomForest)

library(rpart)
fit_tree <- rpart(medv ~ ., data = Boston)
fit_tree

library(rattle)
fancyRpartPlot(fit_tree, caption = NULL)
