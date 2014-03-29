\name{summary.invGauss}
\alias{summary.invGauss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summarize the estimation result from invGauss}
\description{
 To be used on a result from \code{invGauss}. The summary function provides estimates, standard errors etc.
}
\usage{
\method{summary}{invGauss}(object, covariance = FALSE, ...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{object}{Result from running \code{invGauss}.}
	\item{covariance}{Logical, indicates whether the asymptotic variance-covariance matrix for the parameter estimates should be returned.}
	\item{...}{Other arguments (ignored).}
}
\details{
See web page \url{http://www.uib.no/smis/gjessing/projects/invgauss/} for more details.
}
\value{
	Returns a list with the most important results from \code{invGauss}, including coefficients with standard errors and Wald tests:
  \describe{
	\item{coefficients:}{Estimated coefficients, with standard errors and Wald tests}
	\item{cov.unscaled:}{The variance-covariance matrix of the estimated coefficients}
	\item{loglik:}{The maximized log-likelihood}
	\item{AIC:}{AIC value}
  }
}
\references{
Aalen OO, Borgan O, Gjessing HK. Survival and Event History Analysis: A Process Point of View. Springer-Verlag, 2008.\cr
Aalen OO and Gjessing HK. Understanding the Shape of the Hazard Rate: A Process Point of View. Statistical Science, 2001, Vol. 1, No. 1, 1-22. \cr 
Aalen OO. Phase type distributions in survival analysis. Scandinavian Journal of Statistics, 1995, Vol. 22, Issue 4, 447-463.\cr 
Web Site: \url{http://www.uib.no/smis/gjessing/projects/invgauss/}
}
\author{
Hakon K. Gjessing\cr
Professor of Biostatistics\cr
Division of Epidemiology\cr
Norwegian Institute of Public Health\cr
\email{hakon.gjessing@fhi.no}\cr
\url{http://www.uib.no/smis/gjessing}
}

%\section{Warning}{}

\note{Further information is found on the web page

}
\seealso{\code{\link{invGauss}}}

\examples{
%\dontrun{

# Simple run:
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, data = d.oropha.rec)
summary(res)

# Use covariates for c, with exponential link function
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, formula.c = ~ cond + nstage + tstage, 
data = d.oropha.rec) # MODEL 5 (TABLE 10.2) IN SPRINGER BOOK
summary(res)
%}
}

