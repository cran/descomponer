\name{estimardf}
\alias{estimardf}
\docType{data}
\title{ Prediction whit Regression in domain frequency
}
\description{Make a prediction for a rdf object
}
\usage{estimardf(a,b)}
\arguments{
  \item{a}{a model rdf }
   \item{b}{An optional data frame in which to look for variables with which to predict. If omitted, the fitted values are used.}  
   }
\details{ Use predict.lm, with interval="prediction"



Slow computer in time series higher 1000 data.


}
\value{\item{fit}{vector or matrix as above}

}
\references{DURBIN, J., "Tests for Serial Correlation in Regression Analysis based on the Periodogram ofLeast-Squares Residuals," Biometrika, 56, (No. 1, 1969), 1-15.

Engle, Robert F. (1974), Band Spectrum Regression,International Economic Review 15,1-11.

Harvey, A.C. (1978), Linear Regression in the Frequency Domain, International Economic Review, 19, 507-512.

Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(PIB)
data(celec)
mod1=rdf(celec,PIB)
newdata=c(20000)
estimardf(mod1,newdata)
}
\keyword{smooth}