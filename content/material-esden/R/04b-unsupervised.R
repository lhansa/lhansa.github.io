## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos no supervisados    ##
## Ejercicio práctico         ##

# Lectura y tratamiento ---------------------------------------------------

# library(rvest)
# 
# url <- "http://online.wsj.com/public/resources/documents/info-Degrees_that_Pay_you_Back-sort.html?mod=article_inline"
# wsj <- read_html(url)
# 
# df_url_degrees <- wsj %>% 
#   html_elements("table") %>% 
#   html_table(header = TRUE) %>% 
#   pluck(7) 

library(readr)
df_url_degrees <- read_csv("data/degrees.csv")

library(janitor)
library(dplyr)
library(stringr)

df_url_degrees <- df_url_degrees %>% 
  clean_names() %>% 
  rename(percent_change = percent_change_from_starting_to_mid_career_salary) %>% 
  mutate(across(-c(undergraduate_major, percent_change), 
                ~ as.numeric(str_remove_all(., "\\$|\\,"))), 
         percent_change = percent_change / 100)

df_cluster_data <- df_url_degrees %>% 
  select(starting_median_salary, mid_career_median_salary, mid_career_10th_percentile_salary, mid_career_90th_percentile_salary) %>% 
  scale() # Otra forma de escalar


# Método del codo ---------------------------------------------------------
library(factoextra)
fviz_nbclust(df_cluster_data, FUNcluster = kmeans, method = "wss")


# Ejercicio 1 ---------------------------------------------------------------
# - Plantea el método del codo con la metodología vista en el ejemplo con iris.
# - Compara resultados. 


# Ejercicio 2 -------------------------------------------------------------
# - Realiza una clusterización con kmeans 


# Ejercicio 3 -------------------------------------------------------------
# - Realiza una clusterización con Clara


# Ejercicio 4 -------------------------------------------------------------
# - Explora los resultados de ambos modelos. 
# - Contrasta diferencias entre los resultados de uno y otro.






