% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pod.per.chemical.R
\name{pod.per.chemical}
\alias{pod.per.chemical}
\title{pod.per.chemical}
\usage{
pod.per.chemical(toxval.db = "res_toxval_v95", sys.date = Sys.Date())
}
\arguments{
\item{toxval.db}{The version of ToxValDB to use}

\item{sys.date}{Date of the most recent data export #' Make the rule #' filter LOELs when NOELs are present for the same study #' filter out redundant values for the same study group #' Perform the allometric scaling}

\item{t2}{PARAM_DESCRIPTION}

\item{scale.mat}{PARAM_DESCRIPTION}
}
\value{
Writes output to file
}
\description{
Explore different methods for calculating PODs
}
\details{
Explore different methods for calculating PODs
This uses the same input as the function bmdh.perstudy / bmdh.per.chemical
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
