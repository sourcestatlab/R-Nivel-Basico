###-----------------------------------------------###
###----------- Curso R Nivel Básico --------------###
###-- Estructuras de Datos en R ------------------###
###-- Source Stat Lab Ec -------------------------###
###-- Mayo, 2015 ---------------------------------###
###-----------------------------------------------###

## Estructuras de Datos
# R no tiene estructuras 0d (tipo escalar).
# El texto luego de # es un comentario (no es interpretado por R)
# Para crear un objeto se utiliza el operador de asignación  <- 

x <- 5
x

y <- "SSL"
y

## Vectores
## 1. Vectores atómicos
vec <- c(1, 2)
vec

## Elementos de un vector atómico
# La i-ésima componente de un vector se obtiene mediante vec[i]

vec <- c(6, 1, 3, 6, 10, 5)
vec
vec[5]

# Para seleccionar varios elementos utilizamos la función c().
vec <- c(6, 1, 3, 6, 10, 5)
vec
# elementos de la posición 2, 4, 6
vec[c(2, 4, 6)]

# Eliminamos elementos antecediendo el signo -

vec[-c(2)]
vec[-c(1, 6)]

# TRUE, FALSE también permiten obtener ciertos elementos:
vec <- c(6, 1, 3, 6, 10, 5)
vec
# elementos de la posición 2, 4, 6
vec[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)]

## Tipos de vectores atómicos
# Vector double
dbl_vec <- c(1, 2, -1, 8, 15)
dbl_vec
# Vector entero
int_vec <- c(3L, 7L, 1L, 14L, 21L) # sufijo L para vector entero
int_vec
# Vector lógico
log_vec <- c(FALSE, TRUE, F, T, TRUE, F) # TRUE y FALSE (T, F) para vector lógico
log_vec
# Vector caracter
chr_vec <- c("Source", "Stat", "Lab", "Ec")
chr_vec

## Tipos y Tests
# Ejemplo de un vector double

dbl_vec <- c(1, 2, -1)
dbl_vec

typeof(dbl_vec)
is.double(dbl_vec)
is.atomic(dbl_vec)

# Ejemplo de un vector integer
int_vec <- c(3L, 7L, 1L)
int_vec

typeof(int_vec)
is.integer(int_vec)
is.atomic(int_vec)


## Función is.numeric().
# Retorna TRUE para vectores double e integer:
        
dbl_vec <- c(1, 2, -1.2)
dbl_vec
is.numeric(dbl_vec)

int_vec <- c(3L, 7L, 1L)
int_vec
is.numeric(int_vec)

## Coerción
# Los elementos de un vector son del mismo tipo
# Si combinamos tipos diferentes, serán coercionados al tipo más flexible dado por la jerarquia
# character <= double <= integer <= logical

vec <- c("ssl", 12, TRUE, FALSE)
vec
typeof(vec)

vec1 <- c(0.5, 2, TRUE, FALSE)
vec1
typeof(vec1)

# Las funciones +, abs, log, etc coercionan a double o integer.

# Coerción función abs
vec <- c(3, 0.5, -6)
vec1 <- abs(vec)
typeof(vec1)

# Coerción función +
vec1 <- c(1L, 3L, -6L)
vec2 <- c(2L, -5L, 9L)
vec3 <- vec1 + vec2
typeof(vec3)

# Las funciones &, |, any, all, etc coercionan a logical.
# Coerción función all
vec <- c(TRUE, FALSE, FALSE, TRUE)
(vec1 <- all(vec)) # TRUE si todos sus elementos son TRUE
typeof(vec1)

# Coerción función | 
vec1 <- c(FALSE, TRUE, TRUE, FALSE)
vec2 <- c(TRUE, TRUE, FALSE, FALSE)
(vec3 <- vec1 | vec2)
typeof(vec3)

## Coerción - Funciones "as"
# Para coercionar un vector a un determinado tipo, se utilizan las funciones "as"

# coerción directa: double a character
vec <- c(1.7, 5, 8.2, 15.1)
vec1 <- as.character(vec)
vec1
typeof(vec1)

# coerción directa: logical a character
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE) 
vec1 <- as.character(vec)
vec1

# coerción directa: logical a double
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE) 
vec1 <- as.double(vec)
vec1
# TRUE -> 1
# FALSE -> 0

sum(vec) # número total de TRUEs 
mean(vec) # proporción de TRUEs


# coerción indirecta: character a double
vec <- c("15", "Sin Info", "25", "-")
vec1 <- as.double(vec)
vec1
#NAs introduced by coercion

# coerción indirecta: character a logical
vec <- c("FALSE", "TRUE", "Sin Info", "-", "TRUE") 
vec1 <- as.logical(vec)
vec1
#NAs introduced by coercion

# coerción indirecta: double a logical
vec <- c(1, 0, 17, 3.5, 0)
vec1 <- as.logical(vec)
vec1
# == 0 -> FALSE
# != 0 $\rightarrow$ TRUE


## Vectores anidados
# Los vectores atómicos pueden ser anidados
c(1, c(2, c(3,4)))

c(1, 2, 3, 4)


## 2. Listas
# Una lista puede contener elementos de cualquier tipo y de distinta longitud. 
lst <- list(c(1, 2), c(TRUE), c("a", "b", "c"))
lst

lst <- list(1:3, c("Source", "Stat", "Lab"), c(TRUE, FALSE), c(1.3, 4.5))
typeof(lst)
is.atomic(lst)
# probamos si lst es una lista
is.list(lst)

## Coerción
# coerción del vector lst a una lista
lst <- c("ssl", 4, 0.5)
as.list(lst)

# coerción de lista a vector (reglas de coerción)
lst <- list(1:3, c("Source", "Stat", "Lab"), c(TRUE, FALSE), c(1.3, 4.5))
unlist(lst)

## Elementos de una lista
# Para acceder al elemento i de la lista se utiliza x[i].
# Para acceder al objeto que contiene el elemento i se utiliza x[[i]].
lst <- list(c(1, 2), c(TRUE), c("a", "b", "c"))
lst
lst[1]
lst[[1]]

lst <- list(1:3, c("Source", "Stat", "Lab"), c(TRUE, FALSE), nomb_obj=c(1.3, 4.5))
lst[4]
lst[[4]]
lst$nomb_obj

## Listas vs vectores atómicos
# Una lista es un vector recursivo
lst <- list(list(c(1,-5), c("a", "b")), list("Source", "Stat"))
str(lst)

# Un vector no puede contener otro vector:
c(1, c(2, c(3,4)))  ;  c(1, 2, 3, 4)


## Atributos
# Vector atómico:
# Vector sin el atributo names
vec <- c(3, 6, -1, 0.5)
attributes(vec)

# Vector con el atributo names
vec <- c(a=3, b=6, c=-1, d=0.5)
attributes(vec)


# Lista:
# Lista sin el atributo names
lst <- list(1:3, c("Source", "Stat", "Lab"), c(TRUE, FALSE))
attributes(lst)

# Lista con el atributo names
lst <- list(nomb_obj1=1:3, nomb_obj2=c("Source", "Stat", "Lab"), nomb_obj3=c(TRUE,FALSE))
attributes(lst)


## Funcion is.vector()
# is.vector(x) retorna TRUE si x es un vector con un solo atributo (names).

# Vector con el atributo names
vec <- c(a=3, b=6, c=-1, d=0.5)
is.vector(vec)

# Lista con el atributo names
lst <- list(nomb_obj1=1:3, nomb_obj2=c("Source", "Stat", "Lab"), nomb_obj3=c(TRUE,FALSE))
is.vector(lst)


## Matrices
# Una matriz es un vector con el atributo dim (dimensión).
# El atributo dim es un vector de longitud 2: c(nrow, ncol).
mtx <- matrix (1:12,nrow=3, ncol=4, byrow=FALSE)
# se construye por columnas por default (byrow=FALSE)
mtx
attributes(mtx)

# dim() se usa para añadir el atributo dim a un vector o
mtx <- 1:12
mtx
dim(mtx) <- c(3,4)
mtx

# para hallar la dimensión de una matriz.
mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE)
dim(mtx)

## Elementos de una matriz
(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[1,2] # componente 1, 2 
mtx[,3]  # columna 3
mtx[1,]  # fila 1

(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[,c(2,4)] # columnas 2 y 4
mtx[c(1,3),]  # filas 1 y 3

(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[,c(FALSE, TRUE, TRUE, FALSE)] # columnas 2 y 4
mtx[c(TRUE, FALSE, TRUE),]  # filas 1 y 3


## Factores
# Es la estructura de datos utilizada para almacenar variables categóricas.
# Creación de un factor si se dispone de un vector integer
vec <- c(1, 2, 2, 1, 2, 1, 2)
vec
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
fac

# Creación de un factor si se dispone de un vector character
vec <- c("Femenino","Masculino","Masculino","Femenino","Masculino",
         "Femenino","Masculino")
vec

fac <- factor(vec, levels= c("Femenino", "Masculino"), labels=c("FEM", "MASC"))
fac
# por defecto labels = levels, si no se setea el valor labels= se toma el valor por default
fac <- factor(vec, levels= c("Femenino", "Masculino"))
fac

# Para obtener los atributos de un factor utilizamos attributes().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
attributes(fac)

# Para considerar el vector entero utilizamos unclass().
# eliminación del atributo class
unclass(fac)

# Para realizar conteos por categoría, se utiliza la función table().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
# frecuencias
table(fac)
# porcentaje
prop.table(table(fac))

## Data Frame
# Es una lista en la cual todos los elementos tienen la misma longitud.
# A diferencia de las matrices, pueden almacenar vectores atómicos de cualquier tipo.
# Presenta varios atributos adicionales class, rownames, names.
# Es la estructura de datos más utilizada para almacenar data tabulada.

dbl_vec <- c(1, 2, 3)
dbl_vec
chr_vec <- c("R", "S", "T")
chr_vec
log_vec <- c(TRUE, FALSE, TRUE)
log_vec

# Creación de un data frame
df <- data.frame(dbl_vec, chr_vec, log_vec)
df
# Tipo de un data frame
typeof(df)

# Atributos de un data frame
attributes(df)
# Nombres de columnas
names(df) # colnames(df)
# Clase de un data frame
class(df)
# Nombres de filas
rownames(df)
# Dimensión
dim(df)
# Número de columnas
nrow(df)
# Número de filas
ncol(df)

## Elementos de un data frame
nomb <- c("John", "Paul", "George", "Ringo")
nac <- c(1940, 1941, 1943, 1940)
instr <- c("guitar", "bass", "guitar", "drums")

df <- data.frame(nomb, nac, instr)
print(df)
df[2, c(2,3)]
df[2, 2] # componente 2, 2
df[3,] # fila 3
df[,2] # columna 2
df[,"nac"] # columna 2
df[c(1, 2),] # filas 1, 2
df[,c(1, 2)] # columnas 1, 2
df[,c("nomb", "nac")] # columnas 1, 2
df[,c(TRUE, FALSE, TRUE)] # columnas 1, 3
df[c(TRUE, TRUE, FALSE, TRUE),] # filass 1, 2, 4

## R Data Frame
# data frame: mtcars.
# Se carga la data mtcars
data(mtcars)
# visualizar data frame
View(mtcars)
# Visualizar las n primeras filas
head(mtcars, n = 2)
# Visualizar las n últimas filas
tail(mtcars, n = 2)


# Atributos de un data frame
attributes(mtcars)
# Nombres de columnas
names(mtcars) # colnames(mtcars)
# Clase
class(mtcars)
# Nombres de filas
rownames(mtcars)
# Dimensión
dim(mtcars)
# Número columnas
nrow(mtcars)
# Número filas
ncol(mtcars)


## Función structure
# La función str() (structure) presenta una descripción compacta de la estructura de datos. 
str(mtcars)

## Missing Values
# NA: Not Available. Dato pérdido.
# NaN: Not a Number. Resultado de una indeterminación 0/0, Inf/Inf, Inf*0.
x <- c(Inf*0, 3.2, NA, 5, NA)
x

y <- c(-1, 0/0, NA, 5, -6)
y

## Missing Values
# is.na(x) retorna TRUE para elementos NA de un vector atómico o lista.
x <- c(Inf*0, 3.2, NA, 5, NA)
is.na(x)

# is.nan(x) retorna TRUE para elementos NaN de un vector atómico.
y <- c(-1, 0/0, NA, 5, Inf*0)
is.nan(y)