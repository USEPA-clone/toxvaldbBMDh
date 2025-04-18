% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/property.counter.R
\name{property.counter}
\alias{property.counter}
\title{property.counter}
\usage{
property.counter(toxval.db = "res_toxval_v95", sys.date = Sys.Date())
}
\arguments{
\item{toxval.db}{Database version}

\item{sys.date}{The date of the database export}

\item{user}{The username for the MySQL database. The database instance is #' hard-coded in the function setDBConn().}

\item{password}{The user's MySQL database password.}
}
\value{
Write a file with the results: ToxValDB for BMDh {toxval.db} {Sys.Date()}.xlsx
}
\description{
Count proerties of records
}
\details{
DETAILS
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
\seealso{
\code{\link[openxlsx]{read.xlsx}}, \code{\link[openxlsx]{write.xlsx}}, \code{\link[openxlsx]{createStyle}}
}
