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

area <- function(a, b) {
        a * b / 2
}

area(a=5,b=2)
area(b=2,a=5)


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
x

## Sentencias ELSE
# Ejercicio 5
x <- 4 # Ingrese un valor
if(x>=0){
      print("Número Positivo")
}else{
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
} else {
        if(a<b){ 
                print("Ganó B!")
        } else { 
                print("Empate.")
        }
}

## Sentencias FOR
# Ejercicio 8
for(i in 1:4) {
      print(i)
}

# Equivalente
i <- 1
print(i)
i <- 2
print(i)
i <- 3
print(i)
i <- 4
print(i)

# Ejercicio 9
m <- matrix(rpois(12, 8), 4, 3) # Una matriz de 4x3
m
s <- numeric(4) # Un vector de longitud 4, con sus valores = 0
# Loop:
for (i in 1:4){
        s[i] <- sum(m[i,])
}
s


# Ejercicio 10
x <- c("a", "b", "c", "d")

for(i in 1:4) {
      print(x[i])
}

for(i in seq_along(x)) {
      print(x[i])
}

for(letter in x) {
      print(letter)
}

for(i in 1:4) print(x[i])


# Ejercicio 11
s <- numeric(1)
m <- matrix(rpois(4, 8), 2, 2) # Una matriz de 2x2
m
for (i in 1:nrow(m)) {
      for (j in 1:ncol(m)) {
            s <- s + m[i, j]
      }
}
s

# Ejercicio 12
logn <- function(x, n){
      return(log(x, base = n))
}

logn(8, 2) # Logaritmo de 8 en base 2 
logn(2, 8) # Logaritmo de 8 en base 2 
logn(x=8, n=2)
logn(n=2, x=8)


body(logn)
formals(logn)
environment(logn)

# Ejercicio 13
hipotenusa <- function(x,y){
      return(sqrt(x^2+y^2))
}

hipotenusa(3,4)
hipotenusa()

# Ejercicio 14
hipotenusa_4d <- function(w,x,y,z){
      return(sqrt(w^2+x^2+y^2+z^2))
}

hipotenusa_4d(2,3,4,5)

# Ejercicio 15
hip <- function(x=3, y=4){
      return(sqrt(x^2+y^2))
}

hip()
hip(x=6)
hip(y=8)

# Ejercicio 16
f <- function(x, y) {
      return(x^2 + y / z)
}

f(3, 6)
#z <- 2
f(3, 6)

z<-1
g <- function(x, y) {
        z<-0
        return(x + y + z)
}

g(1, 1)





# Ejercicio 17
y <- 10

f <- function(x) {
      y <- 2
      y^2 + g(x)
}

g <- function(x) { 
      x*y
}

f(3)

# Ejercicio 18
logi <- function(ini, fin, color="red") {
      x <- seq(ini, fin, by=0.1)
      y <- exp(x) / (1 + exp(x))
      plot(y ~ x, type='l', col=color, main="Curva Logística", xlab="Eje x", ylab="Eje y")
}

logi(ini=-2, fin=2)
logi(ini=-6, fin=6, color = "blue")
logi(-6, 6, "blue")
# error
logi("blue",-6, 6)
logi(i=-6, f=6, co = "blue")


# Ejercicio 19
paradas <- 25
pasajeros <- 0
registro <- numeric(25)
for (i in 1:paradas) {
      pasajeros <- pasajeros + sample(0:8, size=1)
      if (pasajeros >= 44) {
            registro[i:paradas] <- 44
            cat('Bus lleno!\n')
            break
      } else {
            registro[i] <- pasajeros
            cat('Parada', i, 'hay', pasajeros, 'pasajeros\n')
      }
}

plot(registro, xlab='Parada', ylab='No. de pasajeros', main="Pasajeros", col="blue")



x <- 1

if(x<0){
        x^2+2*x+3
} else {
        if(x>=0 & x<2){
                x+3
        } else {
                x^2+4*x-7
        }
}



s <- numeric(1)
for(i in 10:100){
        s <- i^3 + 4*i^2 + s
        print(s)
}


x <- rpois(100, lambda = 5)
s <- numeric(length(x)-1)

for(i in 1:length(s)){
        s[i] <- (x[i]+x[i+1])/2
}
s













