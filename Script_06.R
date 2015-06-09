###############################
###   Script - Funciones   ###
###   Source Stat Lab Ec   ###
##############################

## Juego Casino
casino <- function(){
      symbol <- c("Diamante", "0", "7", "$")
      sample(symbol, size=3, replace=TRUE, prob=c(0.25, 0.25, 0.25, 0.25))
}
## Activamos el juego
casino()


## Sentencias IF
# Ejercicio 1
num <- -2
if (num<0){ 
      num<-num*-1
}
num

# Ejercicio 2
num <- 4
if (num<0){ 
      num<-num*-1
}
num

# Ejercicio 3
num <- -2
if (num<0){
      print("El número ingresado es negativo.") 
      print("No hay de que preocuparse. Ya lo reparamos.") 
      num <- num*-1
      print("Ahora el número es positivo.")
}
num

# Ejercicio 4
# Que valor de x retorna ?
x <- 1 
if (x==1){
      x <- 2 
      if (x==1){
            x <- 3
      }
}


## Sentencias ELSE
# Ejercicio 5
x <- 4 # Ingrese un valor
if(x>=0){
      print("Número Positivo")
} else {
      print("Número negativo")
}


# Ejercicio 6 (Valor absoluto)
x <- -12 # Ingrese un valor
if(x>=0){
      res <- sqrt(x)
} else {
      res <- sqrt(-x)
}
res


# Ejercicio 7
a <- rnorm(1, mean=1, sd=3)
b <- rnorm(1, mean=1, sd=3)
if(a>b){ 
      print("Ganó A!")
} else if(a<b){ 
      print("Ganó B!")
} else { 
      print("Empate.")
}


## Sentencias FOR
# Ejercicio 8
for(i in 1:10) {
      print(i)
}


# Ejercicio 9




## Sentencia WHILE


## Sentencia BREAK