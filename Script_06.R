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

