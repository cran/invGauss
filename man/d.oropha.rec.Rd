\name{d.oropha.rec}
\docType{data}
\alias{d.oropha.rec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Carcinoma of the oropharynx}
\description{
An example from clinical medicine given by Kalbfleisch and Prentice (2002), a clinical trial on 195 patients with carcinoma of the oropharynx carried out by the Radiation Therapy Oncology Group in the United States. The patients were randomized into two treatment groups (\dQuote{standard} and \dQuote{test} treatment), and survival times were measured in days (rather, years in this recoded data set) from diagnosis. 
}
\usage{data(d.oropha.rec)}
\format{
A number of covariates were recorded for each patient at the entry to the study:\cr
\describe{
	\item{sex}{(1 = male, 2 = female)}
	\item{treatment group}{(1 = standard, 2 = test)}
	\item{grade}{(1 = well differentiated, 2 = moderately differentiated, 3 = poorly differentiated)}
	\item{age in years at diagnosis}{}
	\item{condition}{(1 = no disability, 2 = restricted work, 3 = requires assistance with self-care, 4 = confined to bed)}
	\item{T-stage}{(an index of size and infiltration of tumor ranging from 1 to 4, with 1 indicating a small tumor and 4 a massive invasive tumor)}
	\item{N-stage}{(an index of lymph node metastasis ranging from 0 to 3, with 0 indicating no evidence of metastases and 3 indicating multiple positive nodes or fixed positive nodes)}
	}
}
%\details{
%See web page \url{http://www.uib.no/smis/gjessing/projects/invgauss/} for %more details.
%}
%\source{
%	xxx
%}
\references{
Aalen OO, Borgan O, Gjessing HK. Survival and Event History Analysis: A Process Point of View. Springer-Verlag, 2008.\cr
Web page for \code{invGauss}: \url{http://www.uib.no/smis/gjessing/projects/invgauss/}
}
\keyword{datasets}
