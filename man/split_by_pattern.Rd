% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split_by_pattern.R
\name{split_by_pattern}
\alias{split_by_pattern}
\title{Split a character vector by a pattern}
\usage{
split_by_pattern(
  x,
  start_pattern = "^# |^## |---",
  end_pattern = NULL,
  name_list = TRUE,
  include_start = FALSE
)
}
\arguments{
\item{x}{A \code{\link[base:character]{character}} vector.}

\item{start_pattern}{(optional) A string with the start pattern (default:
\code{"^# |^## |---"}).}

\item{end_pattern}{(optional) A string with the end pattern. Use \code{NULL} if
there isn't one (default: \code{NULL}).}

\item{name_list}{(optional) A \code{\link[base:logical]{logical}} flag
indicating if each output item should have a name (default: \code{TRUE}).}

\item{include_start}{(optional) A \code{\link[base:logical]{logical}} flag
indicating if the line flagged in the start pattern should be included
in the split (default: \code{FALSE}).}
}
\value{
A \link[base:list]{list} with the split character vector.
}
\description{
\code{split_by_pattern()} allow you to split a character vector considering a
start and end pattern.
}
\examples{
x <- c(
 "# Title 1",
 "## Subtitle 1",
 "Content 1",
 "Content 2",
 "# Title 2",
 "## Subtitle 2",
 "Content 3",
 "Content 4"
 )

 split_by_pattern(
   x,
   start_pattern = "^# |^## |---",
   end_pattern = NULL,
   name_list = TRUE,
   include_start = FALSE
 )
}
\seealso{
Other vector functions: 
\code{\link{cut_vector}()},
\code{\link{remove_caps}()}
}
\concept{vector functions}
