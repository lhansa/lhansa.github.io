## ESDEN - Máster en Big data ##
## Viernes 8 de julio de 2022 ##
## Modelización con R         ##
##                            ##
## Modelos no supervisados    ##
## Ejemplos                   ##

# Datos y EDA -------------------------------------------------------------

library(ggplot2)
head(iris) # En R el conjunto de datos iris siempre está disponible

ggplot(iris) + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, col = Species))

ggplot(iris) + 
  geom_histogram(aes(x = Sepal.Length)) + 
  facet_grid(Species ~ .)


# K-means -----------------------------------------------------------------

# Observaciones
# - Trabajaremos como si no supiéramos a qué grupo pertenece cada flor.
# - Como trabajamos con distancias entre individuos, necesitamos que 
#   las variables sean comparables.

### Estandarizar

library(dplyr)
df_iris_scaled <- iris %>% 
  mutate(across(Sepal.Length:Petal.Width, ~ (. - mean(.)) / sd(.)))

### Sintaxis y resultados
kmeans_modelo <- kmeans(df_iris_scaled %>% select(-Species), 
                        centers = 3)

# Gráfico indicando clases originales, asignadas y centros de los clusters
df_iris_scaled %>% 
  mutate(clase = as.factor(kmeans_modelo$cluster)) %>% 
  ggplot() + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, 
                 col = Species, # coloreamos con la clase original
                 shape = clase)) +  # damos forma con la clase asignada por el modelo
  geom_point(data = as.data.frame(kmeans_modelo$centers), 
             aes(x = Sepal.Length, y = Sepal.Width), size = 2, shape = 5)

# Número de clusters ------------------------------------------------------

# Método del codo
df_resultados_varios_clusters <- tibble(
  n_clusters = 2:10, 
  total_within_ss = sapply(2:10, \(i){
    kmeans(df_iris_scaled %>% select(-Species), i)$tot.withinss
  })
)

ggplot(df_resultados_varios_clusters) + 
  geom_line(aes(x = n_clusters, y = total_within_ss))
# Cuidado: sugiere 4 clusters


# Clara -------------------------------------------------------------------
library(cluster)

clara_iris <- clara(df_iris_scaled %>% select(-Species), 
                    k = 3, 
                    stand = TRUE)

set.seed(31818)
df_iris_scaled %>% 
  mutate(clase = as.factor(clara_iris$clustering)) %>% 
  ggplot() + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, col = Species, shape = clase)) + 
  geom_point(data = as.data.frame(clara_iris$medoids), 
             aes(x = Sepal.Length, y = Sepal.Width), size = 2, shape = 5)


# Hiperparámetros
clara_iris <- clara(df_iris_scaled %>% select(-Species), 
                    k = 3, 
                    stand = TRUE, 
                    samples = 100, 
                    sampsize = 50)
