predictFFF=function(y,x,new){
  z=2*pi*x/max(x)
  nwz=2*pi*new/max(x)
  nwX=data.frame(unos=rep(1,length(new)),X=new,X2=(new^2)/2,X3=cos(nwz),X4=sin(nwz))
  n=3+2*abs(sqrt(length(x)))
  m=trunc((n-5)/2)
  for(i  in (1:m))
  {X5=cos(2*i*nwz)
  X6=sin(2*i*nwz)
  nwX=cbind(nwX,X5,X6)}
  X=data.frame(X=x,X2=(x^2)/2,X3=cos(z),X4=sin(z))
  for(i  in (1:m))
  {X5=cos(2*i*z)
  X6=sin(2*i*z)
  X=cbind(X,X5,X6)}
  mod=lm(y~as.matrix(X))
  coef=as.matrix(mod$coefficients)
  nwX=as.matrix(nwX)
  C=dim(nwX)[2]
  M=nwX[,2:C]
  datos=data.frame(X,y)
  M=data.frame(M)
  predicciones=predict(lm(y~.,data=datos),M,interval="confidence")
  list(fitted=lm(y~as.matrix(X))$fitted,residuals=lm(y~as.matrix(X))$residuals, pronosticos=predicciones,X=as.matrix(X),nwX=nwX,M=M,coef=coef)}