#' Normalize file names from the `extdata` folder
#'
#' @description
#'
#' `r lifecycle::badge("experimental")`
#'
#' **ATTENTION**: This function must be used only with
#' [RStudio](https://posit.co/products/open-source/rstudio/) IDE.
#'
#' `normalize_extdata()` normalize file names founded in the `./inst/extdata/`
#' folder of a R package.
#'
#' The function lowercase the names, substitute `" - "` characters for `"_"`,
#' and substitute `" "` characters for `"-"`.
#'
#' @param package (optional) a string indicating the target package (default:
#'   `basename(here::here())`).
#'
#' @family R package functions
#' @export
normalize_extdata <- function(package = basename(here::here())) {
  prettycheck:::assert_namespace(package)

  extdata <- system.file("inst/extdata", package = package)
  path <- list.dirs(extdata)

  for (i in path) {
    i <- paste0(i, "/")

    if (length(list.files(i)) == 0) {
      next
    } else {
      new_name <- tolower(list.files(i))
      new_name <- stringr::str_replace_all(new_name, " - ", "_")
      new_name <- stringr::str_replace_all(new_name, " ", "-")
      file.rename(paste0(i, list.files(i)), paste0(i, new_name))
    }
  }

  invisible(NULL)
}
