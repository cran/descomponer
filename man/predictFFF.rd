\name{predictFFF}
\alias{predictFFF}
\docType{data}
\title{ Prediction whit Regression in FFF
}
\description{Make a prediction for a rdf object
}
\usage{predictFFF(y,x,new)}
\arguments{
 \item{y}{a Vector of the dependent variable}
   \item{x}{a Vector of the  independent variable}  
 \item{new}{A data frame in which to look for variables with which to predict. If omitted, the fitted values are used.}  
   }  
\details{ Use predict.lm, with interval="confidence"


}
\value{\item{fit}{vector or matrix as above}

}
\references{DURBIN, J., "Tests for Serial Correlation in Regression Analysis based on the Periodogram ofLeast-Squares Residuals," Biometrika, 56, (No. 1, 1969), 1-15.

Engle, Robert F. (1974), Band Spectrum Regression,International Economic Review 15,1-11.

Harvey, A.C. (1978), Linear Regression in the Frequency Domain, International Economic Review, 19, 507-512.

Gallant; A. R.(1984), The Fourier Flexible Form. Amer. J. Agr. Econ.66(1984):204-15.

Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)

Parra, F.(2021), Econometria con Series de Fourier
 (https://econometria.files.wordpress.com/2020/12/curso-de-econometria-avanzado.pdf)
 %%  ~~ possibly secondary sources and usages ~~
}
\examples{
data("ipi")
t=seq(1:length(ipi))
Mod1=FFF(ipi,t)
plot(ipi)
lines(Mod1$fitted)
new=(length(t)+1):(length(t)+12)
Mod2=predictFFF(ipi,t,new)
}
\keyword{smooth}