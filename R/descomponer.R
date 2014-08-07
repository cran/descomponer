descomponer <- function (y,frequency) {
# Author: Francisco Parra Rodríguez
# http://rpubs.com/PacoParra/24432
# date:"y", frequency:"frequency". 
# Use 7 for frequency when the data are sampled daily, and the natural time period is a week, 
# or 4 and 12 when the data are sampled quarterly and monthly and the natural time period is a year.
  n <- length(y)
f1 <- NULL
if(n%%2==0) {f2 <- n/(2*frequency)} else {
 f2 <- (n-1)/(2*frequency)}
per <- periodograma(y)
# modelo para obtener serie con tendencia y estacionalidad
S1 <- data.frame(f1=per$frecuencia,p=per$densidad)
S <- sort.data.frame (S1,formula=~-p)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
p <- as.numeric(S$p)
n2 <- length(p)
s <- p[1]
for (i in 2:n2) {
        s1 <- p[i] + s[(i - 1)]
        s <- c(s, s1)
        s2 <- s/s[n2]
            }
S <- data.frame (S,s2)
S <- sort.data.frame (S,formula=~-f1)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
sel <- subset(S,f1<f2)
for (i in 2:(n/f2)) {
sel1 <- subset(S,f1==round(i*f2))
sel <- rbind(sel,sel1)}
m1 <- c(sel$f1 * 2)
m2 <- c(m1+1)
c <- c(m1,m2)
n3 <- length(c)
d <- rep(1,n3)
s <- data.frame(c,d)
S <- sort.data.frame (s,formula=~c)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
i <- seq(1:n)
eq <- lm(y~i)  
z <- eq$fitted
cx <- cdf(z)
id <- seq(1,n)
S1 <- data.frame(cx,c=id)
S2 <- merge(S,S1,by.x="c",by.y="c")
S3 <- rbind(c(1,1,cx[1,]),S2) 
m <- n+2
X1 <- S3[,3:m]
X <- as.matrix(X1)
cy <- gdf(y)
B <- solve(X%*%t(X))%*%(X%*%cy)
Y <- t(X)%*%B  
TDST <- gdt(Y)
#Modelo para obtener serie con tendencia
S1 <- data.frame(f1=per$frecuencia,p=per$densidad)
S <- sort.data.frame (S1,formula=~-p)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
p <- as.numeric(S$p)
n2 <- length(p)
s <- p[1]
for (i in 2:n2) {
        s1 <- p[i] + s[(i - 1)]
        s <- c(s, s1)
        s2 <- s/s[n2]
            }
S <- data.frame (S,s2)
S <- sort.data.frame (S,formula=~-f1)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
sel <- subset(S,f1<f2)
m1 <- c(sel$f1 * 2)
m2 <- c(m1+1)
c <- c(m1,m2)
n3 <- length(c)
d <- rep(1,n3)
s <- data.frame(c,d)
S <- sort.data.frame (s,formula=~c)
#Use the "sort.data.frame" function, Kevin Wright. Package taRifx
i <- seq(1:n)
eq <- lm(y~i)  
z <- eq$fitted
cx <- cdf(z)
id <- seq(1,n)
S1 <- data.frame(cx,c=id)
S2 <- merge(S,S1,by.x="c",by.y="c")
S3 <- rbind(c(1,1,cx[1,]),S2) 
m <- n+2
X1 <- S3[,3:m]
X <- as.matrix(X1)
cy <- gdf(y)
B <- solve(X%*%t(X))%*%(X%*%cy)
Y <- t(X)%*%B  
TD <- gdt(Y)
# Series de factores estacionales y irregulares
ST <- TDST-TD
IR <- y-TDST
data.frame(y,TDST,TD,ST,IR)}
