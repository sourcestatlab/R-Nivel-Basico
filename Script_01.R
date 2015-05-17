###    Curso R Nivel Basico      ###
###    Source Stat Lab Ec        ###
###          Clase 01            ###

## Instalación de librerías

search()
install.packages('nombre_paquete')
install.packages('nombre_paquete', dependencies=TRUE)

paquetes <- c("pckg_1","pckg_2", ... , "pckg_n")
lapply(seq_along(paquetes), function(i){
      install.packages(paquetes[[i]], dependencies=TRUE)
})

install.packages("nombre_paquete", repos="http://r-forge.r-project.org")
install.packages("nombre_paquete", repos="http://www.omegahat.org/R")
install.packages("nombre_paquete", repos="http://www.bioconductor.org/packages/2.10/bioc")

install.packages("nombre_paquete", repos="http://r-forge.r-project.org", type="source")

install.packages('devtools', dependencies=TRUE)
devtools::install_github("rstudio/rmarkdown")

library('translate2R')
require('translate2R')

.libPaths()

## Actualización de librerias

installed.packages()
available.packages()

sessionInfo()

library(help='nombre_paquete')

library(foreign)
ls('package:foreign')
lsf.str('package:foreign')
citation("foreign")
update.packages()
old.packages()
lapply(dir(R.home("library")), packageDescription)

install.packages('installr', dependencies = TRUE)
library('installr')
updateR()
ls("package:installr")

## Instalación de R & RStudio

install.packages("installr", dependencies=TRUE)
library(installr)
install.RStudio()
getOption("width")
getOption("digits")

## Eliminacion de librerias.

remove.packages("nombre_paquete", "directorio")

