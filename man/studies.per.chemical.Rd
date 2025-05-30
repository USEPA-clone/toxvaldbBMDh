% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/studies.per.chemical.R
\name{studies.per.chemical}
\alias{studies.per.chemical}
\title{studies.per.chemical}
\usage{
studies.per.chemical(toxval.db, run_name = Sys.Date())
}
\arguments{
\item{toxval.db}{Database name}

\item{run_name}{The desired name for the output directory (Default: current date)}
}
\value{
Write a file with the filtered results:ToxValDB for BMDh filtered {toxval.db} {sys.date}.xlsx
}
\description{
Calculate some stats for DCAP
}
\details{
Gets the number of studies per chemical from the current ToxValDB export
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
\seealso{
\code{\link[readxl]{read_xlsx}}, \code{\link[writexl]{write_xlsx}}
}
