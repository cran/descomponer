gdescomponer <- function(y,freq,type,news,year,q) {
  # Author: Francisco Parra Rodríguez
  # http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/ 
  if (news >= 1) {
  serie <- descomponer (y,freq,type,news)
  TdsT <- c(serie$data$TDST,serie$fitted$TDST_fitted)
  Td <- c(serie$data$TD,serie$fitted$TD_fitted)
  sT <- c(serie$data$ST,serie$fitted$ST_fitted)
  TDST <- ts(TdsT,frequency=freq,start = c(year,q))
  TD <- ts(Td,frequency=freq,start = c(year,q))
  ST <- ts(sT,frequency=freq,start = c(year,q))
  par(mfrow=c(3,1))
  plot (TDST)
  plot (TD)
  plot (ST)} else {
    serie <- descomponer (y,freq,type,news)
    TdsT <- c(serie$TDST)
    Td <- c(serie$TD)
    sT <- c(serie$ST)
    TDST <- ts(TdsT,frequency=freq,start = c(year,q))
    TD <- ts(Td,frequency=freq,start = c(year,q))
    ST <- ts(sT,frequency=freq,start = c(year,q))
    par(mfrow=c(3,1))
    plot (TDST)
    plot (TD)
    plot (ST)}
  }