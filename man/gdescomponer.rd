\name{gdescomponer}
\alias{gdescomponer}
\docType{data}
\title{Plotting the trend and seasonal
%%   ~~ data name/kind ... ~~
}
\description{Plotting the trend and seasonal of time series.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{gdescomponer(y,freq,type,news,year,q)}
\arguments{
  \item{y}{a vector of the observed time-serie values    
}
\item{freq}{Number of times in each unit time interval    
}
\item{type}{lineal (1), quadratic(2)    
}
\item{news}{new data to fitted, 0 no fitted    
}
\item{year}{the year of the first observation    
}
\item{q}{the time of the first observation    
}
}
\references{Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(ipi)
gdescomponer(ipi,12,1,6,2002,1)
}
\keyword{smooth}
\seealso{\code{\link[descomponer]{descomponer}}}

