rdf <- function (y,x) {
  # Author: Francisco Parra Rodriguez
  # http://rpubs.com/PacoParra/24432
  # Leemos datos en forma matriz
  a <- matrix(y, nrow=1)
  b <- matrix(x, nrow=1)
  n <- length(a)
  # calculamos el cros espectro mediante la funcion cperiodograma
  cperiodograma <- function(y,x) {
    # Author: Francisco Parra Rodriguez
    # http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/ 
    cfx <- gdf(y)
    n <- length(y)
    cfy <- gdf(x)
    if (n%%2==0) {
      m1x <- c(0)
      m2x <- c()
      for(i in 1:n){
        if(i%%2==0) m1x <-c(m1x,cfx[i]) else m2x <-c(m2x,cfx[i])}
      m2x <- c(m2x,0)
      m1y <- c(0)
      m2y <- c()
      for(i in 1:n){
        if(i%%2==0) m1y <-c(m1y,cfy[i]) else m2y <-c(m2y,cfy[i])}
      m2y <-c(m2y,0) 
      frecuencia <- seq(0:(n/2)) 
      frecuencia <- frecuencia-1
      omega <- pi*frecuencia/(n/2)
      periodos <- n/frecuencia
      densidad <- (m1x*m1y+m2x*m2y)/(4*pi)
      tabla <- data.frame(omega,frecuencia, periodos,densidad)
      tabla$densidad[(n/2+1)] <- 4*tabla$densidad[(n/2+1)]
      data.frame(tabla[2:(n/2+1),])}
    else {m1x <- c(0)
    m2x <- c()
    for(i in 1:(n-1)){
      if(i%%2==0) m1x <-c(m1x,cfx[i]) else m2x <-c(m2x,cfx[i])}
    m2x <-c(m2x,cfx[n])
    m1y <- c(0)
    m2y <- c()  
    for(i in 1:(n-1)){
      if(i%%2==0) m1y <-c(m1y,cfy[i]) else m2y <-c(m2y,cfy[i])}
    m2y <-c(m2y,cfy[n])
    frecuencia <- seq(0:((n-1)/2)) 
    frecuencia <- frecuencia-1
    omega <- pi*frecuencia/(n/2)
    periodos <- n/frecuencia
    densidad <- (m1x*m1y+m2x*m2y)/(4*pi)
    tabla <- data.frame(omega,frecuencia, periodos,densidad)
    data.frame(tabla[2:((n+1)/2),])}
  }
  cper <- cperiodograma(a,b)
  S1 <- data.frame(f1=cper$frecuencia,p=abs(cper$densidad))
  S <- S1[with(S1, order(-p)), ]
  id <- seq(2,n)
  fpart = function(vec) {
    ret = vec - as.integer(vec)
    ret
  }
  evens=function(vec) {
    stopifnot(class(vec)=="integer")
    ret = vec[fpart(vec/2)==0]
    ret
  }
  odds=function(vec) {
    stopifnot(class(vec)=="integer")
    ret = vec[fpart(vec/2)!=0]
    ret
  }
  m1 <- cbind(S$f1*2,evens(id))
  if (n%%2==0) {m2 <- cbind(S$f1[1:(n/2-1)]*2+1,odds(id))} else 
  {m2 <- cbind(S$f1*2+1,odds(id))}
  m <- rbind(m1,m2)
  colnames(m) <- c("f1","id")
  m <- data.frame(m)
  M=m[with(m, order(id)), ]
  M <- rbind(c(1,1),M)
  # Obtenemos la funcion auxiliar (cdf) del predictor y se ordena segun el indice de las mayores densidades absolutas del co-espectro.
  cx <- cdf(b)
  id <- seq(1,n)
  S1 <- data.frame(cx,c=id)
  S2 <- merge(M,S1,by.x="id",by.y="c")
  S3=S2[with(S2, order(f1)), ]
  m <- n+2
  X1 <- S3[,3:m]
  X1 <- rbind(C=c(1,rep(0,(n-1))),S3[,3:m])
  # Se realizan las regresiones en el dominio de la frecuencia utilizando un modelo con constante, pendiente y los armonicos correspondientes a las frecuencias mas altas de la densidad del coespectro. Se realiza un test de durbin para el residuo y se seleccionan aquellas que son significativas. 
  par <- evens(id)
  i <- 1
  D <- 1
  resultado <- cbind(i,D)
  for (i in par) {
    X <- as.matrix(X1[1:i,])
    cy <- gdf(a)
    B1 <- solve(X%*%t(X))%*%(X%*%cy)
    Y <- t(X)%*%B1 
    F <- gdt(Y)
    res <- (t(a) - F)
    T <- td(res)
    L <- as.numeric(c(T$min<T$s2,T$s2<T$max))
    LT <- sum(L)
    D <- LT-(n-1)
    resultado1 <- cbind(i,D)
    resultado <- rbind(resultado,resultado1)
    resultado}
  resultado2 <-data.frame(resultado)
  criterio <- resultado2[which(resultado2$D==0),]
  sol <- as.numeric(is.na(criterio$i[1]))
  if (sol==1) {
    X <- as.matrix(X1[1:2,])
    cy <- gdf(a)
    B1 <- solve(X%*%t(X))%*%(X%*%cy)
    Y <- t(X)%*%B1 
    F <- gdt(Y)
    res <- (t(a) - F)
    datos <- data.frame(cbind(t(a),t(b),F,res))
    colnames(datos) <- c("Y","X","F","res")
    list(datos=datos,Fregresores=t(X),Tregresores= t(MW(n))%*%t(X),Nregresores=criterio$i[1])  
  } else {
    X <- as.matrix(X1[1:criterio$i[1],])
    cy <- gdf(a)
    B1 <- solve(X%*%t(X))%*%(X%*%cy)
    Y <- t(X)%*%B1 
    F <- gdt(Y)
    res <- (t(a) - F)
    datos <- data.frame(cbind(t(a),t(b),F,res))
    colnames(datos) <- c("Y","X","F","res")
    sse=sum(res^2)
    gcv=length(res)*sse/((length(res)-dim(X)[1])^2)
    list(datos=datos,Fregresores=t(X),Tregresores= t(MW(n))%*%t(X),Nregresores=criterio$i[1],sse=sse,gcv=gcv)}
} 
