\name{periodograma}
\alias{periodograma}
\docType{data}
\title{Periodogram
%%   ~~ data name/kind ... ~~
}
\description{Calculates and displays the spectrum of the time serie
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{periodograma(y)}
\arguments{
  \item{y}{a vector of the observed time-serie values    
}
}
\value{\item{frecuencia}{  Vector of frequencies at which the spectral density is estimated. The units are the reciprocal of cycles per unit time.}

\item{omega}{Is calculated by pi*frecuencia/(n/2) }

\item{periodos}{n/frecuencia}

\item{densidad}{Vector of estimates of the spectral density at frequencies corresponding to frecuencia.}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
periodograma(y)
}
\keyword{smooth}
\seealso{\code{\link[descomponer]{gperiodograma}}}
