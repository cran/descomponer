\name{FFF}
\alias{FFF}
\docType{data}
\title{ Regression in Fourier Flexible Form
%%   ~~ data name/kind ... ~~
}
\description{Make a Fourier Flexible Form Regression 
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{FFF(y,x)}
\arguments{
  \item{y}{a Vector of the dependent variable}
   \item{x}{a Vector of the  independent variable}  
   }
\details{
The regresion FFF use LM for fitted into the serie y_t and  the fourier coefficients expansion described in Gallant (1984).

The output is a data.frame object.
%%  ~~ If necessary, more details than the __description__ above ~~
}
\value{\item{fitted}{The time - serie fitted}
\item{X}{The X time - series fourier coefficients}
\item{residuals}{The time - serie fitted}
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
data(PIB)
data(celec)
FFF(celec,PIB)
}
\keyword{smooth}

