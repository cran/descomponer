\name{rdf}
\alias{rdf}
\docType{data}
\title{ Regression in domain frequency
%%   ~~ data name/kind ... ~~
}
\description{Make a Band Spectrum Regression using the comun frequencies in cross-spectrum  .
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{rdf(y,x)}
\arguments{
  \item{y}{a Vector of the dependent variable}
   \item{x}{a Vector of the  independent variable}  
   }
\details{
Transforms the time series in amplitude-frequency domain, order the fourier coefficient by the comun frequencies in cross-spectrum, make a band spectrum regresion (Parra, F. ,2013) of the serie y_t and x_t for every set of fourier coefficients, and select the model to pass the Durbin test in the significance chosen.

If not find significance for Band Spectrum Regression, make a OLS.

 
The generalized cross validation (gcv), is caluculated by: 
gcv=n*sse/((n-k)^2)

where "sse" is the residual sums of squares, "n" the observation, and k the coefficients used in the band spectrum regression.


Slow computer in time series higher 1000 data.

The output is a data.frame object.
%%  ~~ If necessary, more details than the __description__ above ~~
}
\value{\item{datos$Y}{The Y time-serie}
\item{datos$X}{The X time-serie}
\item{datos$F}{The time - serie fitted}
\item{datos$reg}{The error time-serie }
\item{Fregresores}{The  matrix of regressors choosen in frequency domain}
\item{Tregresores}{The  matrix of regressors choosen in time domain}
\item{Nregresores}{The coefficient number of fourier chosen}
\item{sse}{Residual sums of squares}
\item{gcv}{Generalized Cross Validation}
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
rdf(celec,PIB)
}
\keyword{smooth}

