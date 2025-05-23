% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/to_ascii.R
\name{to_ascii}
\alias{to_ascii}
\title{Convert a string to ASCII}
\usage{
to_ascii(x, from = "UTF-8")
}
\arguments{
\item{x}{A \code{\link[base:character]{character}} vector.}

\item{from}{A \code{\link[base:character]{character}} string indicating the encoding
of the input string, See \code{\link[base:iconv]{iconv}} to learn more.
(default: \code{"UTF-8"}).}
}
\value{
A \code{\link[base:character]{character}} vector.
}
\description{
\code{to_ascii()} converts a string to ASCII, removing any non-ASCII characters.
}
\examples{
to_ascii("São Paulo")
#> [1] "Sao Paulo" # Expected

to_ascii("Île-de-France")
#> [1] "Ile-de-France" # Expected
}
\seealso{
Other string functions: 
\code{\link{make_machine_readable}()},
\code{\link{to_title_case_pt}()}
}
\concept{string functions}
