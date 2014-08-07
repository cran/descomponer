\name{gdf}
\alias{gdf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Get Frequency Data
%%  ~~function to do ... ~~
}
\description{Transforms the data from the amplitude-time domain  the amplitude-frequency domain pre-multiplied by the orthogonal matrix ,W, whose elements are defined in Harvey A.C. (1978).
%% 
}
\usage{
gdf(y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{a vector of the observed time-series values
%%     
}
}
\value{a vector of the estimated coefficients fourier
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{Harvey, A.C. (1978), Linear Regression in the Frequency Domain, International Economic Review, 19, 507-512.

Parra, F. (2014), Amplitude time-frequency regression, (http://econometria.wordpress.com/2013/08/21/estimation-of-time-varying-regression-coefficients/)
%% ~put references to the literature/web site here ~
}
\author{Francisco Parra 
%%  ~~who you are~~
}
\examples{
n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
gdf(y)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
}
\keyword{smooth}
\seealso{\code{\link[descomponer]{gdt}}}