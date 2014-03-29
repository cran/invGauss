\name{invGauss}
\alias{invGauss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Threshold regression that fits the (randomized drift) inverse Gaussian distribution to survival data.}
\description{
\code{invGauss} fits the (randomized drift) inverse Gaussian distribution to survival data. The model is described in Aalen OO, Borgan O, Gjessing HK. Survival and Event History Analysis. A Process Point of View. Springer, 2008. It is based on describing time to event as the barrier hitting time of a Wiener process, where drift towards the barrier has been randomized with a Gaussian distribution. The model allows covariates to influence starting values of the Wiener process and/or average drift towards a barrier, with a user-defined choice of link functions. 
}
\usage{
invGauss(formula.mu, formula.c = ~1, link.mu = identity, 
	link.c = exp, data, mu = TRUE, tau = TRUE, verbose = FALSE, 
	protect = FALSE, opti.method = "BFGS", use.gradient = TRUE, 
	link.mu.deriv = function(x) 1, link.c.deriv = exp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{formula.mu}{Standard survival formula, like \code{formula.mu = Surv(time, status) ~ covar1 + covar2}.}
	\item{formula.c}{Formula without the left hand side, like \code{formula.c = ~ covar1 + covar2}.}
	\item{link.mu}{Link function used with \code{formula.mu}. Default is \code{identity}. Note that it should be the function itself, not the name of the function.}
	\item{link.c}{Link function used with \code{formula.c} Default is \code{exp}. Note that it should be the function itself, not the name of the function.}
	\item{data}{Data frame to be used.}
	\item{mu}{If you need to supply your own initial value for \code{mu}. If \code{mu} is numeric, \code{invGauss} will use it as the initial value, otherwise (if \code{mu = TRUE}) it will provide a rough estimate for an initial value.}
	\item{tau}{Like \code{mu} above.}
	\item{verbose}{If TRUE, \code{invGauss} prints some information along the way.}
	\item{protect}{Somewhat experimental. If TRUE, possible negative values in the likelihood are "eliminated" to avoid crashes. Probably most useful when link is identity.}
	\item{opti.method}{\code{invGauss} uses the \code{optimx} package to provide a selection of optimization tools. Default is "BFGS", which calls the \code{optim} function with \code{method = "BFGS"}. The standard \code{optim} default of "Nelder-Mead" seems at times unreliable when used in \code{invGauss}. See the \code{optimx} package documentation for other options.}
	\item{use.gradient}{By default, \code{invGauss} uses analytical gradients in the optimization.}
	\item{link.mu.deriv}{If the user modifies \code{link.mu} and \code{use.gradient = TRUE}, the derivative of the link function must also be supplied. See Details.}
	\item{link.c.deriv}{If the user modifies \code{link.c} and \code{use.gradient = TRUE}, the derivative of the link function must also be supplied. See Details.}
}
\details{
	\code{invGauss} uses by default analytical gradients in the optimization, although this does not appear to make much difference. When \code{use.gradient = TRUE}, if the user changes one of the link functions, the corresponding derivative must also be supplied. For instance, if \code{link.mu} is set to \code{exp}, so should \code{link.mu.deriv}. Similarly, if, for instance, \code{link.c} is changed to \code{identity}, then \code{link.c.deriv} should be \code{function(x) 1}.\cr
See web page \url{http://www.uib.no/smis/gjessing/projects/invgauss/} for more details.
}
\value{
  An object of class \code{invGauss} is returned. This is a list, where the most important elements are:
  \describe{
	\item{coefficients:}{Estimated coefficients}
	\item{cov.unscaled:}{The variance-covariance matrix of the estimated coefficients}
	\item{loglik:}{The maximized log-likelihood}
	\item{AIC:}{AIC value}
  }
  The \code{summary} function provides more details about the result, in particular coefficient values with standard errors, Z statistic, and Wald tests.\cr
(There is also an undocumented \code{invGauss:::predict.invGauss} function, but use it at your own risk...)
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

\section{Warning}{For some datasets, \code{invGauss} may have a hard time converging. This may be due to either inappropriate parameter starting values or a hazard shape that is incompatible with the hitting time distribution. Running a simpler model or setting the starting values manually may help. Sometimes, the exact choice of zero on the time scale may be important since some of the model hazards increase steeply immediately after zero. Adding or subtracting a small value from all event/censoring times may help. The new default optimization method "BFGS" seems to do a better job than "Nelder-Mead".}

\note{Further information is found on the web page.}
\seealso{\code{\link{summary.invGauss}}}

\examples{
%\dontrun{

# Simple run:
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, data = d.oropha.rec)
summary(res)

# Use covariates for c, with exponential link function
data(d.oropha.rec)
res <- invGauss(formula.mu = Surv(time, status) ~ 1, formula.c = ~ cond + nstage + tstage, 
data = d.oropha.rec) # MODEL 5 (TABLE 10.2, page 412) IN SPRINGER BOOK
summary(res)
%}

}
