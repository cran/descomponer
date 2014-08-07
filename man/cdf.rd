\name{cdf}
\alias{cdf}
\docType{data}
\title{Get Auxiliary Matrix
%%   ~~ data name/kind ... ~~
}
\description{Gets the auxiliary matrix to vector  in time domain, pre-multiplies the vector by the orthogonal matrix,W, and its transpose, Parra F. (2013) 
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{cdf(y)}
\arguments{
  \item{y}{a vector of the observed time-serie values
%%     
}
}
\value{a matrix of sine and cosine waves  adjusted to time-serie
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
\author{Francisco Parra 
%%  ~~who you are~~
}
\examples{
n<-100;x<-seq(0,24*pi,length=n);y<-sin(x)+rnorm(n,sd=.3)
cdf(y)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
}
\keyword{smooth}
