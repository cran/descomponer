\name{td}
\alias{td}
\docType{data}
\title{Cumulative periodogram test
%%   ~~ data name/kind ... ~~
}
\description{Cumulative periodogram test.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{td(y)}
\arguments{
  \item{y}{a vector of the observed time-serie values
%%     
}
 }
\details{
The output is a data.frame object.
%%  ~~ If necessary, more details than the __description__ above ~~
}
\value{\item{s2}{ Cumulative periodogram.}
\item{min}{Is calculated by  -c+(t/length(y)) }
\item{max}{Is calculated by  c+(t/length(y))}
}
\references{Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(PIB)
td(PIB)
}
\keyword{smooth}
\seealso{\code{\link[descomponer]{periodograma}}}

