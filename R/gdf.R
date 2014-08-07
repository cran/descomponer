gdf <- function(y) {
# Author: Francisco Parra Rodr?guez 
# http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/ 
a <- matrix(y, nrow=1)
n <- length(y)
uno <- as.numeric (1:n)
A <- matrix(rep(sqrt(1/n),n), nrow=1)
if(n%%2==0){
for(i in 3:n-1){ 
if(i%%2==0) {
A1 <- matrix(sqrt(2/n)*cos(pi*(i)*(uno-1)/n), nrow=1)
A <- rbind(A,A1)}
 else {
A2 <- matrix(sqrt(2/n)*sin(pi*(i-1)*(uno-1)/n), nrow=1)
A <- rbind(A,A2)
}} 
AN <- matrix(sqrt(1/n)*(-1)^(uno+1), nrow=1)
A <- rbind(A,AN)
A%*%t(a)
} else {
for(i in 3:n-1){ 
if(i%%2==0) {
A1 <- matrix(
sqrt(2/n)*cos(pi*(i)*(uno-1)/n), nrow=1)
A <- rbind(A,A1)}
 else {
A2 <- matrix(sqrt(2/n)*sin(pi*(i-1)*(uno-1)/n), nrow=1)
A <- rbind(A,A2)
}} 
AN <- matrix(
sqrt(2/n)*sin(pi*(n-1)*(uno-1)/n), nrow=1)
A <- rbind(A,AN)
A%*%t(a)
}
}