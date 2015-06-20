###-----------------------------------------------###
###----------- Curso R Nivel Básico --------------###
###-- Lectura y Escritura de datos en R ----------###
###-- Source Stat Lab Ec -------------------------###
###-- Mayo, 2015 ---------------------------------###
###-----------------------------------------------###

##--------- 1. working directory wd
# setear wd
wd0 <- "C:/Users/Toshiba/Desktop/readr_files_05"
setwd(dir = wd0)
getwd()
list.files()

wd1 <- "C:/Users/Toshiba/Desktop/readr_files_05/read_data" 
setwd(dir = wd1)
getwd()
list.files()


# obtencion de wd
getwd()

# archivos en wd
list.files()
list.files(pattern = ".txt")

wd1 <- "C:/Users/Toshiba/Desktop/readr_files_05/read_data"
setwd(dir = wd1)
list.files()
list.files(pattern = ".txt")

files <- list.files()
files
grep(files, pattern = ".txt")
files[grep(files,pattern = ".txt")]

# crear nuevos directorios
setwd(dir = wd0)
file.exists("ssl")
dir.create("ssl")

##--------- 2. read files
setwd(wd1)
list.files()
# read.table function
# archivo formato txt
data_txt1 <- read.table(file = "data_read.txt",sep = "\t", dec = ",", header = TRUE)
str(data_txt1)
View(data_txt1)
attributes(data_txt1)

names(data_txt1)
class(data_txt1)
dim(data_txt1)
ncol(data_txt1)
nrow(data_txt1)

summary(data_txt1)

# Variables categóricas como character
data_txt2 <- read.table(file = "data_read.txt",sep = "\t", dec = ",",
                        header = TRUE, stringsAsFactors = FALSE)
str(data_txt2)


# archivo formato csv
data_csv <- read.table(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv)
View(data_csv)

names(data_csv)
class(data_csv)
dim(data_csv)
ncol(data_csv)
nrow(data_csv)

summary(data_csv)

# sep = ",", dec = ".", header=TRUE
data_csv1 <- read.csv(file = "data_read.csv")
str(data_csv1)

data_csv2 <- read.csv2(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
str(data_csv2)


# archivo formato xlsx
install.packages("readxl", dependencies = TRUE)
library(readxl)
ls("package:readxl")
# lista de las hojas del libro "data_read.xlsx"
excel_sheets(path = file.path(wd1, "data_read.xlsx"))

data_xlsx <- read_excel("data_read.xlsx",sheet = "datos",col_names = TRUE, na=c(""))
str(data_xlsx)
View(data_xlsx)


# archivos spss formato .sav
install.packages("foreign", dependencies = TRUE)
library(foreign)
ls("package:foreign")
data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                      to.data.frame = TRUE)
str(data_sav1)


install.packages("haven", dependencies = TRUE)
# spss: read_spss(), sas: read_sas(), stata: read_dta()
library(haven)
ls("package:haven")
data_sav2 <- read_spss("data_read.sav")
str(data_sav2)

##--------- Comparación foreign y haven:
# foreign
system.time(data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                                   to.data.frame = TRUE))
# haven
system.time(data_sav2 <- read_spss("data_read.sav"))

##--------- Accediendo a datos desde la web
## Descargar archivos desde Dropbox
install.packages("repmis", dependencies = TRUE)
library(repmis)
ls("package:repmis")
data_dbx <- source_DropboxData(file = "data_read.txt", key="mk3y6070r51f9su", sep="\t",
                               header = TRUE)
str(data_dbx)


## Descargar archivos desde tablas html
library(RCurl)
library(XML)
install.packages("RCurl", dependencies = TRUE)
install.packages("XML", dependencies = TRUE)
# http://www.sbs.gob.ec/practg/sbs_index?vp_art_id=&vp_tip=6&vp_buscr=/practg/pk_cons_bdd.p_bal_entdd_finnc
cod_inst<-1011
cod_mes<-12
cod_anio<-2014
paste("Curso", "R", "Basico", 1, sep="")
base_url <- paste('http://www.sbs.gob.ec/practg/pk_cons_bdd.p_bal_entdd_finnc?vp_cod_tip_instt=3&vp_cod_instt=',
                  cod_inst,'&vp_anio=', cod_anio, '&vp_mes=', cod_mes, '&vp_cod_tip_catlg=14')
table_url <- readHTMLTable(base_url)
str(table_url)
data_sbs <- table_url[[3]]
str(data_sbs)
View(data_sbs)
    


##--------- 3. Manipulacion Informacion
# lea el archivo en formato txt data.txt
# asigne el archivo de datos a la variable data_txt
setwd(wd1)
list.files()

data_txt <- read.table(file = "data.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
View(data_txt)

# Muestre los nombres, clase, dimension, numero de col, numero de filas de data_txt 
data_txt <- datos
names(data_txt)
class(data_txt)
dim(data_txt)
dim(data_txt)[1]
dim(data_txt)[2]
ncol(data_txt)
nrow(data_txt)

summary(data_txt)
# Ingresando a los elementos de la data

#---------------------------- Variable numerica ---------------------
edad <- data_txt[,2]
edad <- data_txt[,"Edad"]
str(edad)
View(edad)
typeof(edad)
length(edad)
attributes(edad)
class(edad)

is.atomic(edad)
is.integer(edad)
is.double(edad)
is.numeric(edad)
is.list(edad)

# obtener los elementos 5, 8, 10 de edad y asignar a edad1
edad1 <- edad[c(5,8,10)]
length(edad1)
edad1

# obtener los 50 primeros elementos de edad y asignar a edad1
edad1 <- edad[1:50]
length(edad1)
# eliminar el primer elemento de edad y asignar a edad1
edad1
edad1 <- edad1[-1]
edad1 <- edad1[-c(5,10,11)]
edad1
length(edad)
length(edad1)
# eliminar los elementos 1, 25, 51 de edad y asignar a edad1
edad1 <- edad[-c(1,25,51)]
length(edad)
length(edad1)
# eliminar los primeros 1000 elementos de edad y asignar a edad1
edad1 <- edad[-(1:1000)]
length(edad)
length(edad1)

# eliminar los elementos iguales a 24 de edad y asignar a edad1
edad==24
edad1 <- edad[edad==24]
# edad1 es constante?
min(edad1)==max(edad1)
length(edad1)

length(edad[edad!=24])
length(edad[!edad==24])
edad1 <- edad[edad!=24]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

quantile(edad, probs = seq(0.01,0.99,by=0.01))

# Seleccionar los valores inferiores a 65 años asignar a edad1
edad<=65
edad1 <- edad[edad<=65]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

# recodificando valores
# si la edad es superior a 65 setear 65 por defecto
edad>65
edad1 <- edad
edad1[edad1>65] <- 65
max(edad1)
max(edad)
View(edad1)

quantile(edad1, probs = seq(0.80, 0.99, by=0.01))
quantile(edad, probs = seq(0.80, 0.99, by=0.01))

# si la edad es inferior a 18 setear 18 por defecto
edad1 <- edad
edad1[edad1<18] <- 18
min(edad1)
min(edad)
View(edad1)

######### Graficos PIB ############
var <- rpois(n = 10, lambda = 5)
var1 <- rpois(n = 10, lambda = 7)
var
plot(var, type='b', col="blue", ylim=c(0,15))
par(new=TRUE)
plot(var1, type='b', col="red", ylim=c(0,15))
text(var+0.5)



# si la edad es inferior a 18 y mayor a 65 setear "fuera de rango" por defecto
edad1 <- edad
edad1<18 | edad > 65
edad1[edad1<18 | edad > 65] <- "fuera de rango"
str(edad1)
min(edad1)
max(edad1)
# obtener la media?
mean(edad1)
edad2 <- as.numeric(edad1)
#edad2 <- as.double(edad1)
#edad2 <- as.integer(edad1)
mean(edad2)
mean(edad2, na.rm=TRUE)


## datos perdidos
perd <- is.na(edad)
typeof(perd)
str(perd)
# todos los datos de edad son perdidos?
all(perd)
# existe al menos un dato perdido?
any(perd)
# cuente los datos perdidos
sum(perd)
# que porcentaje de datos perdidos se tiene
mean(perd)
# cuantos datos no vacios se tiene
nrow(data_txt)-sum(perd)
dim(data_txt)[1] - sum(perd)


#---------------------------- Variable categorica ---------------------
str(data_txt)
names(data_txt)
tipviv <- data_txt[,"Vivienda"]
#tipviv <- data_txt[,3]
str(tipviv)
View(tipviv)
typeof(tipviv)
mean(tipviv)
length(tipviv)
attributes(tipviv)
class(tipviv)
levels(tipviv)

is.atomic(tipviv)
is.numeric(tipviv)
is.logical(tipviv)
is.character(tipviv)
is.list(tipviv)
is.factor(tipviv)
levels(tipviv)
table(tipviv)
summary(tipviv)

# modificar levels
tipviv1 <- tipviv
levels(tipviv1) <- c("Alquilada", "Familiar","Otros","Propia","No disponible")
table(tipviv)
table(tipviv1)

# obtener los elementos 15,58,100 de tipviv y asignar a tipviv1
tipviv1 <- tipviv[c(15,58,100)]
str(tipviv1)
length(tipviv1)
table(tipviv1)

# obtener los 1000 primeros elementos de tipviv y asignar a tipviv1
tipviv1 <- tipviv[1:1000]
length(tipviv1)
table(tipviv1)
# eliminar los primeros 5000 elementos de tipviv y asignar a tipviv1
tipviv1 <- tipviv[-(1:5000)]
length(tipviv1)
table(tipviv1)
# eliminar los elementos 1, 25, 51 de tipviv y asignar a tipviv1
tipviv1 <- tipviv[-c(1,25,51)]
length(tipviv1)
table(tipviv1)


# eliminar los elementos iguales a "Familiar" de tipviv y asignar a tipviv1
tipviv==Familiar
tipviv=="Familiar"
tipviv1 <- tipviv[tipviv=="Familiar"]
# tipviv1 es constante?
min(tipviv1)==max(tipviv1)
table(tipviv1)

tipviv!="Familiar"
tipviv1 <- tipviv[tipviv!="Familiar"]
length(tipviv1)
table(tipviv1)
str(table(tipviv1))
prop.table(table(tipviv1))


# recodificando valores
# si la tipviv es Alquilada setear Otros por defecto
prop.table(table(tipviv))
tipviv1 <- tipviv
tipviv1[tipviv1=="Alquilada"] <- "Otros"
table(tipviv1)
prop.table(table(tipviv1))


## datos perdidos
perd <- is.na(tipviv)
typeof(perd)
str(perd)
# todos los datos de tipviv son perdidos?
all(perd)
# existe al menos un dato perdido?
any(perd)
# cuente los datos perdidos
sum(perd)
# que porcentaje de datos perdidos se tiene
mean(perd)
# cuantos datos no vacios se tiene
nrow(data_txt)-sum(perd)
dim(data_txt)[1] - sum(perd)


# coercion
str(tipviv)
tipvivnum <- as.numeric(tipviv)
str(tipvivnum)
tipvivchr <- as.character(tipviv)
str(tipvivchr)

# creamos data frame
vivienda <- data.frame(tipviv, tipvivnum, tipvivchr, stringsAsFactors=FALSE)
table(tipviv)
str(vivienda)
View(vivienda)


# Ejercicios
# lea el archivo en formato csv data.csv
# asigne el archivo de datos a la variable data_csv
# Realice el analisis anterior para las variables

# Egresos_mensuales


# Calificacion





#-------------------- Graficos estadisticos ------------------------

setwd(wd1)
list.files()

data_txt <- read.table(file = "data.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
names(data_txt)

edad <- data_txt[,"Edad"]
# histograma
hist(edad)
hist(edad,breaks = 100)
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad")
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad",
     col="steelblue", border="gray1")

# Diagrama de cajas
boxplot(edad)
boxplot(edad,horizontal = TRUE)
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad")
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad",
     col="steelblue", border="gray1")


# Diagrama de dispersion
edad <- data_txt[,"Edad"]
Score <- data_txt[,"Score"]
plot(edad, Score)
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad")
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=20)
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=18, col="steelblue")

# Diagrama de barras
tipviv <- data_txt[,"Vivienda"]
barplot(table(tipviv))
barplot(table(tipviv),horiz = TRUE)
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras")
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras",
        col="steelblue", border="gray1")


# multiples graficos
par(mfrow=c(2,2))
hist(edad,breaks = 50, xlab = "Edad", ylab="Frecuencia", main="Histograma de Edad",
     col="steelblue", border="gray60")
boxplot(edad, xlab = "", ylab="Edad", main="Diag cajas de Edad",
        col="steelblue", border="gray60")
plot(edad, Score, xlab = "Edad", ylab="Score", main="Score vs Edad",
     pch=18, col="steelblue")
barplot(table(tipviv), xlab = "Vivienda", ylab="Frecuencia", main="Diagrama de barras",
        col="steelblue", border="gray50")



# Ejercicio
# Realice los graficos anteriors para las variables
# Antiguedad, Cuota_mensual, Estado_civil, eliga los colores y titulos a conveniencia


list.files()
datos <- read.table("./read_data/data.txt", header = TRUE, sep="\t")
str(datos)

with(datos, hist(Antiguedad, col="blue1", breaks=5))
hist(datos$Antiguedad)

with(datos, table(Estado_civil))
with(datos, barplot(table(Estado_civil)))













