## Ejercicio en clase ##

# Cargamos la data
data(mtcars)
mtcars

# Revisamos la estructura de la data
str(mtcars)

0) Crear una variable factor usando am, donde 1=USED y 0= NEW. Calcular el número de casos y porcentaje del factor.

mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("NEW", "USED"))
str(mtcars)
table(mtcars$am)
round(100*prop.table(table(mtcars$am)), 2)

1) Promedio de las 10 primeras observaciones de la variable mpg

mean(head(mtcars$mpg, n=10))

2) Suma de los últimos 10 registros de la variable wt

sum(tail(mtcars$wt, n=10))

3) Existen dados pèrdidos en la base ? 
 
any(is.na(mtcars))

4) Extraer las ultimas 3 variables y asignarlas a un objeto de nombre Base1

Base1 <- data.frame(am=mtcars$am, gear=mtcars$gear, carb=mtcars$carb)
Base1

Base1 <- mtcars[,c(9,10,11)]
Base1

5) Extraer los registros desde la posicion 7 hasta 18 y asignar a un objeto de nombre Base2

Base2 <- mtcars[c(7:18),]
Base2

6) Usando la funcion "order", ordenar ascendentemente los valores de la variable wt.

order(mtcars$wt)
mtcars$wt[order(mtcars$wt)]

7) Generar un resumen de la data Base1 por medio de la funcion "summary".

summary(Base1)

8) Filtrar todos los registros de la base original que presentan un valor de 4 en "carb".

subset(mtcars[,c("qsec")],mtcars$carb==4)[,7]

9) Seleccionar los registros superiores a 3.5 de la variable wt.

mtcars$wt[mtcars$wt>3.5]

10) Modificar los nombres de las variables que se encuentran en la data Base1 por
"am_n", "gear_n", "carb_n".

colnames(Base1) <- c("am_n", "gear_n", "carb_n")
Base1

11) Calcular la desviacion estandar de la variable wt considerando los diferentes grupos 
dados por la varaible carb. Usar la funcion "by".

by(mtcars$wt, as.factor(mtcars$carb), min)

12) Usando "subset", obtener los registros que cumplen la condicion: gear>=5 y cyl <=4.

subset(mtcars, mtcars$gear>=5 & mtcars$cyl<=4)

13) Unir los resultados siguientes:
      - Elementos de cyl <= 5
      - Elementos de carb >= 1 
Usar la funcion "union"

union(mtcars$cyl[mtcars$cyl<=5], mtcars$carb[mtcars$carb>=1])

14) Dados los vectores a<- c(1,2,3,4,5,6,7); b<-c(2,4,6,8,10). Hallar la union, interseccion y
diferencia simetrica de los vectores anteriores.

union(a,b)
intersect(a,b)
setdiff(a,b)

15) Generar 1000 datos aleatorios normales "rnorm(1000)", identificar el número de observaciones
superiores a cero.

set.seed(12345)
table(rnorm(1000)>0)