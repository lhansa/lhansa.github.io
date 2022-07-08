## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos de clasificación   ##
## Ejercicio práctico         ##

## Lectura
library(readr)
library(janitor)
df_churn <- read_csv("data/telecom_churn.csv") %>% 
  clean_names()

## Tratamiento
# Variables numéricas.

library(dplyr)
df_churn <- df_churn %>% 
  mutate(churn = as.numeric(churn), # logical to 0 and 1
         international_plan = as.numeric(international_plan == "Yes"), 
         voice_mail_plan = as.numeric(voice_mail_plan == "Yes"))


df_churn %>% 
  count(state, sort = TRUE) %>% 
  slice_head(n = 5)

# Trabajaremos solo con West Virginia (`"WV"`) para evitar el componente geográfico.

df_churn_wv <- df_churn %>% 
  filter(state == "WV")


# Ejercicio - Regresión logística------------------------------------------------------------
# Ajusta un modelo de regresión logística. 
# Hay variables que dependen unas de otras, 
# por lo que no es buena idea introducir todas
# a la vez en el modelo. Una decisión que 
# habrá que tomar es si trabajamos con 
# variables sobre número de llamadas, 
# sobre minutos hablados o sobre coste.
# + Evalúa los resultados. 
# + Interpreta los resultados.



# cat(names(df_churn_wv), sep = "\n + ")
# fit_logit <- glm(...)


# Ejercicio - SVM ------------------------------------------------------------
# + Evalúa los resultados. 
# + Compara con la regresión logística anterior.



