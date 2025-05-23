% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normalize_hashtags.R
\name{normalize_hashtags}
\alias{normalize_hashtags}
\title{Normalize hashtags inside files}
\usage{
normalize_hashtags(dir = utils::choose.dir(), tag_line = 1)
}
\arguments{
\item{dir}{(optional) a string indicating the directory of the files. This
function will look up just for files, directories will not be affected.
(default:: \code{utils::choose.dir()}).}

\item{tag_line}{(optional) a number indicating the line where the tags
are in.}
}
\value{
An invisible \code{NULL}. This function don't aim to return values.
}
\description{
\code{normalize_hashtags()} lower case and remove accents and non-alphanumeric
characters from hashtags.
}
\section{Tip}{


\if{html}{\out{<div class="sourceCode">}}\preformatted{normalize_hashtags(normalizePath(readClipboard(), "/", mustWork = FALSE))
}\if{html}{\out{</div>}}
}

\examples{
file_name <- tempfile(tmpdir = tempfile())
dir_name <- dirname(file_name)
dir.create(dir_name)
file.create(file_name)

con <- file(file_name, "r+")
data <- c("#tEs43(23)ds #45&$dAAsad-dsade", "", "Test", "")
writeLines(data, con = con)
close(con)

normalize_hashtags(dir_name, tag_line = 1)

con <- file(file_name, "r+")
readLines(con)
close(con)
}
\seealso{
Other file functions: 
\code{\link{identify_blank_line_neighbors}()},
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
