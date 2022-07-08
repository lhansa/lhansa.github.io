## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos de regresión       ##
## Ejemplo                    ##

# Lectura y tratamiento ---------------------------------------------------
library(readr)
df_consumo <- read_csv2("data/gran_consumo.csv")

summary(df_consumo)
head(df_consumo)

# Exploración -------------------------------------------------------------
library(dplyr)
library(ggplot2)
ggplot(df_consumo) + 
  geom_line(aes(x = fecha, y = ventas))
  
# Queremos hacer un modelo para explicar la serie de ventas de este cliente. 
# Para ellos disponemos de datos de inversión publicitaria y de competidores
names(df_consumo)

# Visualizamos la información de inversión de competidores. 
# Necesitamos hacer una tabla dinámica (pivotar) para
# usar ggplot cómodamente
library(tidyr)
df_competidores_pivot <- df_consumo %>% 
  select(fecha, contains("competencia")) %>% 
  pivot_longer(-fecha, names_to = "competidor", values_to = "presion")

ggplot(df_competidores_pivot) + 
  geom_line(aes(x = fecha, y = presion)) + 
  facet_wrap(~ competidor, scales = "free")

# Una matriz de correlaciones puede dar una idea agregada de las relaciones 
# entre las variables.
library(corrplot)
corrplot(cor(select(df_consumo, -fecha)))


# Para un gráfico de todas las evoluciones:
df_consumo %>% 
  pivot_longer(-fecha) %>% 
  ggplot() + 
  geom_line(aes(x = fecha, y = value)) + 
  facet_wrap(~ name, scales = "free")



# Regresión lineal simple --------------------------------------------------------
# Realicemos un modelo para la serie de ventas frente a la inversión en TV en el largo plazo.
# La inversión traducida al largo plazoe, en los modelos de marketing, se puede entender
# a veces como el efecto de la notoriedad publicitaria o incluso de la marca.
  
fit_lm1 <- lm(ventas ~ tv_ad98, data = df_consumo)
summary(fit_lm1)

# El R2 es bajo, pero con solo una variable explicativa el objetivo no puede ser
# explicar mucha variabilidad, así que no nos preocupamos.

# Una vez tenemos un modelo podemos ver los valores ajustados frente a la serie original.

df_fit1 <- df_consumo %>% 
  select(fecha, ventas) %>% 
  mutate(ajuste = fit_lm1$fitted.values)

ggplot(df_fit1) + 
  geom_line(aes(x = fecha, y = ventas), col = "darkblue", size = 1) + 
  geom_line(aes(x = fecha, y = ajuste), col = "red", linetype = 2, size = 1)


# Regresión lineal múltiple -----------------------------------------------

# En series temporales, una metodología posible es añadir variables una a una, 
# estudiando cómo mejora el ajuste y viendo si las variables son significativas. 
# Pero vamos a plantear un código con todas las variables y trabajamos desde
# ahí, porque es más interactivo si está ya todo escrito. 

# Este sería un código para trabajar con todas las columnas (salvo fecha)
# pero es poco interactivo.
# lm(ventas ~ ., data = select(df_consumo, -fecha)) 

# Con este código escribimos todas las variables.
cat(names(df_consumo), sep = "\n + ")

fit_lm <- lm(ventas ~  
     + 0 # Cuidado
   + tv_ad98
   # + p1ola1_ad40
   + p2ola1_ad40
   + p3_ola1_ad40
   + p4_ola1_ad40
   + p5_ola1_ad40
   + p1_ola2_ad40
   + p1_ola3_ad40
   + dp
   + ip
   # + iip_p1
   # + iip_p2
   # + iip_p3
   # + revistas_ad20
   + competencia1
   + competencia2
   # + competencia3
   # + competencia4
   , data = df_consumo)

summary(fit_lm)


# Ajuste ------------------------------------------------------------------

# Podemos reutilizar código para los gráficos
df_consumo %>% 
  select(fecha, ventas) %>% 
  mutate(ajuste = fit_lm$fitted.values) %>% 
  ggplot() + 
  geom_line(aes(x = fecha, y = ventas), col = "darkblue", size = 1) + 
  geom_line(aes(x = fecha, y = ajuste), col = "red", linetype = 2, size = 1)

# Cuando no ponemos intercept en el modelo, el R2 hay que calcularlo a mano:
1 - sum(fit_lm$residuals ^ 2) / sum((df_consumo$ventas - mean(df_consumo$ventas)) ^ 2)


# MAPE
mape <- mean(abs((df_consumo$ventas - fit_lm$fitted_values)) / df_consumo$ventas)
mape

# MSE
mse <- mean((df_consumo$ventas - fit_lm$fitted_values) ^ 2)
mse

# Diagnosis ---------------------------------------------------------------
# Normalidad de residuos
qqnorm(fit_lm$residuals)
shapiro.test(fit_lm$residuals)

# Random Forests ----------------------------------------------------------

data(airquality)
head(airquality) # NAs!!!
library(randomForest)
fit_ozone <- randomForest(Ozone ~ ., data = airquality, na.action = na.omit)
fit_ozone

fit_ozone <- randomForest(Ozone ~ ., 
                          data = airquality, 
                          ntree = 200, 
                          mtry = 4, 
                          nodesize = 10, 
                          na.action = na.omit)
fit_ozone

# Cuando no ponemos intercept en el modelo, el R2 hay que calcularlo a mano:

fit_ozone$rsq

airquality_sin_na <- na.omit(airquality)

rf_residuals <- airquality_sin_na$Ozone - fit_ozone$predicted
1 - sum(rf_residuals ^ 2) / sum((airquality_sin_na$Ozone - mean(airquality_sin_na$Ozone)) ^ 2)

# MAPE
mape <- mean(abs((airquality_sin_na$Ozone - fit_ozone$predicted)) / airquality_sin_na$Ozone)
mape

# MSE
mse <- mean((airquality_sin_na$Ozone - fit_ozone$predicted) ^ 2)
mse


library(ggRandomForests)
plot(gg_vimp(fit_ozone))

        