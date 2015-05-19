###    Curso R Nivel Basico      ###
###    Source Stat Lab Ec        ###
###          Clase 01            ###

## Instalacion de librerias

# Informacion paquetes basicos
search()

# Instalacion desde el repositorio CRAN
install.packages('nombre_paquete')
install.packages('nombre_paquete', dependencies=TRUE)

# Instalacion multiples paquetes
paquetes <- c("pckg_1","pckg_2", ... , "pckg_n")
lapply(seq_along(paquetes), function(i){
      install.packages(paquetes[[i]], dependencies=TRUE)
})

# Instalacion desde repositorios externos
install.packages("nombre_paquete", repos="http://r-forge.r-project.org")
install.packages("nombre_paquete", repos="http://www.omegahat.org/R")
install.packages("nombre_paquete", repos="http://www.bioconductor.org/packages/2.10/bioc")

# Para instalar paquetes binarios
install.packages("nombre_paquete", repos="http://r-forge.r-project.org", type="source")

# Instalar desde Github
install.packages('devtools', dependencies=TRUE)
devtools::install_github("rstudio/rmarkdown")

# Diferencias entre library vs require
library('translate2R')
require('translate2R')

# Obtener la direccion de descarga de los paquetes
.libPaths()

## Actualización de librerias

# Paquetes instalados
installed.packages()

# Paquetes validos en la CRAN
available.packages()

# Informacion de plataforma, version y paquetes
sessionInfo()

# Informacion sobre paquetes
library(help='nombre_paquete')

# Funciones albergadas en un paquete
library(foreign)
ls('package:foreign')

# Parametros de las funciones
lsf.str('package:foreign')

# Citaciones de paquetes
citation("foreign")

# Actualizamos paquetes
update.packages()

# Paquetes que no tienen versionamientos
old.packages()

# Listado de autores 
lapply(dir(R.home("library")), packageDescription)

# Actualizamos R por medio del paquete installr
install.packages('installr', dependencies = TRUE)
library('installr')
updateR()
ls("package:installr")

## Instalación de R & RStudio

install.packages("installr", dependencies=TRUE)
library(installr)
install.RStudio()

# Parametros a modificarse en RStudio
getOption("width")
getOption("digits")

# Reducimos el area de impresion
options(width=45)
rnorm(10)

# Aumentamos el area de impresion
options(width=95)
rnorm(10)

# Mostramos los resultados con 2 decimales
options(digits=2)
rnorm(10)

# Mostramos los resultados con 8 decimales
options(digits=8)
rnorm(10)

## Eliminacion de librerias.
remove.packages("nombre_paquete", "directorio")

## Mantenimiento de archivos
file.create("nombre_archivo.R")
file.edit("nombre_archivo.R")
file.exists("nombre_archivo.R")
file.info("nombre_archivo.R")
file.copy("nombre_archivo.R", "nuevo_archivo.R")
file.rename("nombre_archivo.R", "nuevo_nombre.R")
file.remove("nombre_archivo.R")
