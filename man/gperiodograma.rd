\name{gperiodograma}
\alias{gperiodograma}
\docType{data}
\title{Plotting method for specturm
%%   ~~ data name/kind ... ~~
}
\description{Plotting method for specturm calculate by periodograma function.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{gperiodograma(y)}
\arguments{
  \item{y}{a vector of the observed time-serie values
%%     
}
}
\references{Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
gperiodograma(y)
}
\keyword{smooth}
\seealso{\code{\link[descomponer]{periodograma}}}

