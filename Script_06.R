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

# Ejercicio 2
num <- 4
if (num<0){ 
      num<-num*-1
}

# Ejercicio 3
num <- -2
if (num<0){
      print("El número ingresado es negativo.") 
      print("No hay que preocuparse. Ya lo reparamos.") 
      num <- num*-1
      print("Ahora el número es positivo.")
}

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


## Sentencias FOR


## Sentencia WHILE


## Sentencia BREAK