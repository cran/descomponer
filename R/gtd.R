gtd <- function (y) {
S <- td(y)
plot(ts(S), plot.type="single", lty=1:3,main = "Test Periodograma", 
ylab = "densidad acumulada",
xlab="frecuencia")
}