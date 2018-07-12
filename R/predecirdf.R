predecirdf=function(a,b) {
  # a es un objeto rbs
  # b es vector de nuevos datos  
  nuevos.0=c(b)
  nuevos=c(a$datos$X[(length(nuevos.0)+1):length(a$datos$X)],nuevos.0)
  m.1=as.numeric(colnames(a$Fregresores)[-1])
  b <- matrix(nuevos, nrow=1)
  cx <- cdf(b)
  id <- seq(1,length(a$datos$Y))
  S1 <- t(cx)
  colnames(S1)=id
  X=data.frame(c=a$Fregresores[,1],subset(S1,select=c(m.1)))
  X=as.matrix(X)
  new=data.frame(Tregresores= t(MW(length(a$datos$Y)))%*%X)
  mod=lm(a$datos$Y~0+a$Tregresores)
  res=predict(mod,new,interval="prediction")
  res[(length(a$datos$Y)-length(nuevos.0)+1):length(a$datos$Y),1:3]
}