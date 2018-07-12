\name{descomponer}
\alias{descomponer}
\docType{data}
\title{ Time series decomposition
%%   ~~ data name/kind ... ~~
}
\description{Decompose a time series into seasonal, trend and irregular components using the transform amplitude-frequency domain to time series.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{descomponer(y,frequency,type)}
\arguments{
  \item{y}{a Vector of the observed time-serie values}
   \item{frequency}{Number of times in each unit time interval}
   \item{type}{lineal (1), quadratic(2)}
      }
\details{
One could use a value of 7 for frequency when the data are sampled daily, and the natural time period is a week, or 4 and 12 when the data are sampled quarterly and monthly and the natural time period is a year.

Transforms the time series in amplitude-frequency domain, by a band spectrum regresion (Parra, F. ,2013) of the serie y_t and a OLS lineal trend, in which regression is carried out in the low and the sesaonal amplitude-frequency_t .The low frequency are the periodicity a n/2*frequency or (n-1)/2*frequency , if n is odd. The seasonal frequency are the periodicity: 2n/2*frequency,3n/2*frequency,4n/2*frequency,.. .

Use the "sort.data.frame" function, Kevin Wright 
(http://tolstoy.newcastle.edu.au/R/help/04/07/1076.html). 

Slow computer in time series higher 1000 data.

The output is a data.frame object.
%%  ~~ If necessary, more details than the __description__ above ~~
}
\value{\item{y}{The Vector of the observed time-serievalues}
\item{TDST}{The trend and seasonal time serie of y}
\item{TD}{The trend time serie of y}
\item{ST}{The seasonal time serie of y}
\item{IR}{The remainder time serie of y}
\item{regresoresTD}{The regressors matrix use to the trend estimated}
\item{regresoresST}{The regressors matrix use to the seasonal estimated}
\item{coeficientesTD}{The coefficient vector use to the trend estimated}
\item{coeficientesSD}{The coefficient vector use to the seasonal estimated}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{Harvey, A.C. (1978), Linear Regression in the Frequency Domain, International Economic Review, 19, 507-512.

Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(ipi)
datos <- descomponer(ipi,12,2)
plot(ts(datos$datos,frequency=12))
}
\keyword{smooth}

