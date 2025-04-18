% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bmdh.per.study.R
\name{bmdh.per.study}
\alias{bmdh.per.study}
\title{bmdh.per.study}
\usage{
bmdh.per.study(toxval.db, run_name = Sys.Date())
}
\arguments{
\item{toxval.db}{Database name}

\item{run_name}{The desired name for the output directory (Default: current date)}
}
\value{
Write a file with the results: toxval_PODs_for_BMDh {toxval.db} {sys.date}.xlsx
}
\description{
Calculate the BMDh values per study
}
\details{
Calculates one BMDh value per study using the Aurisano algorithm.
Because EPA has not fully developed the mapping from critical effects in ToxValDB
to standardized effects, teh values from Aurisano are used where records match.
Aurisano used ToxValDB 9.1, whereas 9.5 is used here. There is also code here to do the other
required mappings, and thos may need to be updated.For records in both the old and new
databases, an on-the-fly plot is produced to show the corresponded between study-level
BMDh values.
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
\seealso{
\code{\link[openxlsx]{read.xlsx}}, \code{\link[openxlsx]{createStyle}}, \code{\link[openxlsx]{write.xlsx}}
 \code{\link[graphics]{plot.default}}
}
