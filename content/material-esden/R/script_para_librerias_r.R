# Se recomienda al menos la versión 4.1.0 de R. 
# A su vez, se necesita RStudio 2022 para trabajar.
# 
# En su defecto, se podrá trabajar con rstudio.cloud (teniendo en cuenta
# su límite de horas al mes en las cuentas gratuitas).

needed_packages <- c("tidyverse", 
                     "randomForests",
                     "e1071",
                     "tree",
                     "rpart",
                     "rattle",
                     "rpart.plot",
                     "tree",
                     "ROCR",
                     "pROC",
                     "caret",
                     "factoextra",
                     "broom")

not_installed <- needed_packages[!needed_packages %in% row.names(installed.packages())]

install.packages(not_installed)
