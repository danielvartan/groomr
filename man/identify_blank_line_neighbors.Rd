% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/identify_blank_line_neighbors.R
\name{identify_blank_line_neighbors}
\alias{identify_blank_line_neighbors}
\title{Identify blank lines around a line}
\usage{
identify_blank_line_neighbors(
  x,
  pattern = NULL,
  index = NULL,
  top = TRUE,
  bottom = TRUE
)
}
\arguments{
\item{x}{A \code{\link[base:character]{character}} vector.}

\item{pattern}{A string indicating the pattern to look for. If there's more
than one match, the first one will be used (default: \code{NULL}).}

\item{index}{An integer number indicating the line to look for (default:
\code{NULL}). If this parameter is provided, the \code{pattern} parameter will be
ignored.}

\item{top}{A \code{\link[base:logical]{logical}} flag indicating if the function
should look for blank lines at the top of the line (default: \code{TRUE}).}

\item{bottom}{A \code{\link[base:logical]{logical}} flag indicating if the
function should look for blank lines at the bottom of the line (default:
\code{TRUE}).}
}
\value{
An \code{\link[=as.integer]{integer}} vector with the indexes of the blank
lines.
}
\description{
\code{identify_blank_line_neighbors()} identify and returns the indexes of blank
lines around a specific line matching a pattern.
}
\examples{
library(readr)

file <- tempfile()

c("", "line 1", "", "", "line 2", "") |> write_lines(file)

x <- read_lines(file)

identify_blank_line_neighbors(x, pattern = "^line 2$")
#> [1] 4 6 # Expected
}
\seealso{
Other file functions: 
\code{\link{normalize_hashtags}()},
\code{\link{normalize_names}()},
\code{\link{peek_csv_file}()},
\code{\link{remove_blank_line_dups}()},
\code{\link{replace_in_file}()},
\code{\link{sort_files_by_size}()},
\code{\link{split_file}()},
\code{\link{split_files_by_size}()},
\code{\link{zip_files_by_pattern}()}
}
\concept{file functions}
