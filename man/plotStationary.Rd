% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotStationary.R
\name{plotStationary}
\alias{plotStationary}
\title{Plot stationary state probabilities}
\usage{
plotStationary(m, col = NULL, plotCI = FALSE, alpha = 0.95)
}
\arguments{
\item{m}{An object \code{moveHMM}}

\item{col}{Vector or colors for the states (one color per state).}

\item{plotCI}{Logical. Should 95\% confidence intervals be plotted? (Default: FALSE)}

\item{alpha}{Significance level of the confidence intervals if plotCI=TRUE.
Default: 0.95 (i.e. 95\% CIs).}
}
\description{
Plot stationary state probabilities
}
\examples{
# m is a moveHMM object (as returned by fitHMM), automatically loaded with the package
m <- example$m

plotStationary(m)

}
