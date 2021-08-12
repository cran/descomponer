FFF=function(y,x){
  z=2*pi*x/max(x)
  n=3+2*abs(sqrt(length(x)))
  X=data.frame(X=x,X2=(x^2)/2,X3=cos(z),X4=sin(z))
  m=trunc((n-5)/2)
  for(i  in (1:m))
  {X5=cos(2*i*z)
  X6=sin(2*i*z)
  X=cbind(X,X5,X6)}
  list(fitted=lm(y~as.matrix(X))$fitted,X=X,residuals=lm(y~as.matrix(X))$residuals)}