rdf <- function (y,x) {
  # Author: Francisco Parra 
  # http://rpubs.com/PacoParra/24432
  # Leemos datos en forma matriz
  a <- matrix(y, nrow=1)
  b <- matrix(x, nrow=1)
  n <- length(a)
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
  sides <- function(x,...) {
    UseMethod("sides",x)
  }
  #' @method sides default
  #' @S3method sides default
  #' @rdname sides
  sides.default <- function(x,...) {
    stop("Only sidedness for formulas is supported currently")
  }
  #' @method sides formula
  #' @S3method sides formula
  #' @rdname sides
  sides.formula <- function(x,...) {
    isOneSided <- function(x) attr( terms(x) , "response" ) == 0
    if(isOneSided(x)) return(1)
    two <- function(x) x[[2]]
    # Recursively navigate the formula tree, keeping track of how many times it's been done
    sds <- function(f,cnt) {
      if(class(two(f))=="call") sds(two(f),cnt=cnt+1) else return(cnt)
    }
    sds(x,2)
  }
  
  sort.data.frame <- function(x, decreasing = NULL, formula, ...) {
    # Author: Kevin Wright
    # http://tolstoy.newcastle.edu.au/R/help/04/09/4300.html
    # Some ideas from Andy Liaw
    # http://tolstoy.newcastle.edu.au/R/help/04/07/1076.html
    # Use + for ascending, - for decending.
    # Sorting is left to right in the formula
    # Useage is either of the following:
    # sort.data.frame(~Block-Variety,Oats)
    # sort.data.frame(Oats,~-Variety+Block)
    
    # If dat is the formula, then switch form and dat
    if(inherits(x,"formula")){
      f=x
      dat=formula
      formula=f
    }
    if(sides(formula)!=1) {
      stop("Formula must be one-sided.")
    }
    # Make the formula into character and remove spaces
    formc <- as.character(formula[2])
    formc <- gsub(" ","",formc)
    # If the first character is not + or -, add +
    if(!is.element(substring(formc,1,1),c("+","-"))) {
      formc <- paste("+",formc,sep="")
    }
    # Extract the variables from the formula
    vars <- unlist(strsplit(formc, "[\\+\\-]"))
    vars <- vars[vars!=""] # Remove spurious "" terms
    # Build a list of arguments to pass to "order" function
    calllist <- list()
    pos=1 # Position of + or -
    for( i in seq(length(vars)) ) {
      varsign <- substring(formc,pos,pos)
      pos <- pos + 1 + nchar(vars[i])
      if( is.factor( x[,vars[i]] ) ) {
        if(varsign=="-")
          calllist[[i]] <- -rank(x[,vars[i]])
        else
          calllist[[i]] <- rank(x[,vars[i]])
      }
      else {
        if( varsign == "-" )
          calllist[[i]] <- -x[,vars[i]]
        else
          calllist[[i]] <- x[,vars[i]]
      }
    }
    x[do.call("order",calllist),,...]
  } 
  
  # calculamos el cros espectro mediante la funcion cperiodograma
  cperiodograma <- function(y,x) {
    # Author: Francisco Parra 
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
  # Ordenamos de mayor a menor las densidades absolutas del periodograma, utilizando la funcion "sort.data.frame" function, Kevin Wright. Package taRifx
  S1 <- data.frame(f1=cper$frecuencia,p=abs(cper$densidad))
  S <- S1[order(-S1$p),] 
  id <- seq(2,n)
  m1 <- cbind(S$f1*2,evens(id))
  if (n%%2==0) {m2 <- cbind(S$f1[1:(n/2-1)]*2+1,odds(id))} else 
  {m2 <- cbind(S$f1*2+1,odds(id))}
  m <- rbind(m1,m2)
  colnames(m) <- c("f1","id")
  M <- sort.data.frame (m,formula=~id)
  M <- rbind(c(1,1),M)
  # Obtenemos la funcion auxiliar (cdf) del predictor y se ordena segun el indice de las mayores densidades absolutas del co-espectro.
  cx <- cdf(b)
  id <- seq(1,n)
  S1 <- data.frame(cx,c=id)
  S2 <- merge(M,S1,by.x="id",by.y="c")
  S3 <- sort.data.frame (S2,formula=~f1)
  m <- n+2
  X1 <- S3[,3:m]
  X1 <- rbind(C=c(1,rep(0,(n-1))),S3[,3:m])
  # Se realizan las regresiones en el dominio de la frecuencia utilizando un modelo con constante, pendiente y los arm?nicos correspondientes a las frecuencias mas altas de la densidad del coespectro. Se realiza un test de durbin para el residuo y se seleccionan aquellas que son significativas. 
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
    if (n%%2==0) {D=LT-n} else {D=LT-(n-1)} 
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

