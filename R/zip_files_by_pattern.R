#' Zip files by pattern
#'
#' @description
#'
#' `zip_files_by_pattern()` compresses files by grouping them according to
#' specified patterns and splitting them into chunks if needed.
#'
#' @details
#'
#' This function uses the [`zip`][zip::zip] package for cross-platform
#' compatibility and efficient file compression.
#'
#' @param files A [`character`][base::character()] vector specifying the paths
#'   to the files to be compressed. Only relative paths are supported.
#'   See [`zip()`][zip::zip()] for more details.
#' @param pattern (optional) A [`character`][base::character()] vector
#'   specifying one or more patterns to group files for zipping. Files
#'   matching each pattern will be aggregated into a single zip file, named
#'   using the pattern and `suffix`. If `NULL`, each file will be zipped
#'   individually (default: `NULL`).
#' @param prefix (optional) A string specifying a prefix to be added to the
#'   zip file names (default: `NULL`).
#' @param suffix (optional) A string specifying a suffix to be added to the
#'   zip file names (default: `NULL`).
#' @param max_size (optional) An integer or [`fs_bytes`][fs::fs_bytes()] value
#'   specifying the maximum size of the zip files in bytes. The function will
#'   try to split the files into chunks if the total size of the files exceeds
#'   this value. If an individual file is larger than the limit, it will be
#'   placed in its own chunk. Use `Inf` to disable chunking
#'   (default: [`fs_bytes("1GB")`][fs::fs_bytes()]).
#' @param appendices (optional) A [`character`][base::character()] vector
#'   specifying additional files to be included in each zip file. Like in
#'   `files`, only relative paths are supported (default: `NULL`).
#' @param root (optional) A string specifying the root directory of the files.
#'   See [`zip()`][zip::zip()] for more details (default: `.`).
#' @param dir (optional) A string specifying the directory where the zip files
#'   must be saved (default: `root`).
#' @param ... Additional arguments passed to the [`zip`][zip::zip] function.
#'
#' @return An invisible [`character`][base::character()] vector containing the
#'   paths to the created zip files.
#'
#' @family file functions
#' @export
#'
#' @examples
#' files <- c("test_1_1.txt", "test_1_2.txt", "test_2.txt")
#' appendices <- c("appendix.txt")
#'
#' txt_dir <- tempfile("dir")
#' zip_dir <- tempfile("dir")
#' dir.create(txt_dir)
#' dir.create(zip_dir)
#'
#' for (i in files) file.create(file.path(txt_dir, i))
#' for (i in appendices) file.create(file.path(txt_dir, i))
#'
#' list.files(txt_dir)
#' #> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt" # Expected
#'
#' zip_files_by_pattern(
#'   files = files,
#'   pattern = c("test_1", "test_2"),
#'   appendices = appendices,
#'   root = txt_dir,
#'   dir = zip_dir
#' )
#'
#' list.files(zip_dir)
#' #> [1] "test_1.zip" "test_2.zip" # Expected
#'
#' unzip_dir <- tempfile("dir")
#' dir.create(unzip_dir)
#'
#' library(zip)
#'
#' for (i in file.path(zip_dir, list.files(zip_dir))) {
#'   unzip(i, exdir = unzip_dir)
#' }
#'
#' list.files(unzip_dir)
#' #> [1] "appendix.txt" "test_1_1.txt" "test_1_2.txt" "test_2.txt" # Expected
zip_files_by_pattern <- function(
  files,
  pattern = NULL,
  prefix = NULL,
  suffix = NULL,
  max_size = fs::fs_bytes("1GB"),
  appendices = NULL,
  root = ".",
  dir = root,
  ...
) {
  checkmate::assert_character(files, any.missing = FALSE)
  checkmate::assert_directory_exists(root, access = "r")
  checkmate::assert_file_exists(fs::path(root, files), access = "r")
  checkmate::assert_character(pattern, null.ok = TRUE)
  checkmate::assert_string(prefix, null.ok = TRUE)
  checkmate::assert_string(suffix, null.ok = TRUE)
  checkmate::assert_number(max_size, lower = fs::fs_bytes("1MB"))
  checkmate::assert_character(appendices, any.missing = FALSE, null.ok = TRUE)
  checkmate::assert_directory_exists(dir, access = "w")

  if (any(fs::is_absolute_path(files))) {
    cli::cli_abort(
      paste0(
        "All elements of {.strong {cli::col_red('files')}} must be relative ",
        "paths. Please use the {.strong {cli::col_blue('root')}} argument to ",
        "specify the root directory."
      )
    )
  }

  if (any(stringr::str_detect(files, "\\.zip$"))) {
    cli::cli_abort("Rezipping files is not allowed.")
  }

  forbidden_args <- c("zipfile")

  if (c(forbidden_args %in% names(list(...)))) {
    cli::cli_abort(
      paste0(
        "{cli::qty(length(forbidden_args))} ",
        "The argument{?s} ",
        "{.strong {cli::col_red(forbidden_args)}} ",
        "{?is/are} not allowed in the function call."
      )
    )
  }

  if (!is.null(appendices)) {
    for (i in appendices) {
      checkmate::assert_file_exists(fs::path(root, i), access = "r")
    }
  }

  files <- files |> unique() |> sort()
  pattern <- pattern |> unique() |> sort()

  if (is.null(pattern)) {
    zip_each_file_separately(
      files = files,
      appendices = appendices,
      root = root,
      dir = dir,
      ...
    )
  } else {
    zip_files_by_pattern_(
      files = files,
      pattern = pattern,
      prefix = prefix,
      suffix = suffix,
      max_size = max_size,
      appendices = appendices,
      root = root,
      dir = dir,
      ...
    )
  }
}

zip_each_file_separately <- function(
  files,
  appendices = appendices,
  root = ".",
  dir = root,
  ...
) {
  checkmate::assert_character(files, any.missing = FALSE)
  checkmate::assert_directory_exists(root, access = "r")
  checkmate::assert_file_exists(fs::path(root, files), access = "r")
  checkmate::assert_character(appendices, any.missing = FALSE, null.ok = TRUE)
  checkmate::assert_directory_exists(dir, access = "w")

  if (!is.null(appendices)) {
    for (i in appendices) {
      checkmate::assert_file_exists(fs::path(root, i), access = "r")
    }
  }

  cli::cli_progress_bar(
    name = ifelse(
      length(files) == 1,
      "Zipping file",
      "Zipping files"
    ),
    total = length(files),
    type = "tasks",
    clear = FALSE
  )

  out <- character()

  for (i in files) {
    i_zipfile <- fs::path(
      dir,
      stringr::str_replace(i, "\\.[[:alnum:]]+$", ".zip")
    )

    zip::zip(
      zipfile = i_zipfile,
      files = c(i, appendices),
      root = root,
      ...
    )

    out <- c(out, i_zipfile)

    cli::cli_progress_update()
  }

  cli::cli_progress_done()

  invisible(out)
}

zip_files_by_pattern_ <- function(
  files,
  pattern = NULL,
  prefix = NULL,
  suffix = NULL,
  max_size = fs::fs_bytes("5GB"),
  appendices = appendices,
  root = ".",
  dir = root,
  ...
) {
  checkmate::assert_character(files, any.missing = FALSE)
  checkmate::assert_directory_exists(root, access = "r")
  checkmate::assert_file_exists(fs::path(root, files), access = "r")
  checkmate::assert_character(pattern, null.ok = TRUE)
  checkmate::assert_string(prefix, null.ok = TRUE)
  checkmate::assert_string(suffix, null.ok = TRUE)
  checkmate::assert_number(max_size, lower = fs::fs_bytes("10MB"))
  checkmate::assert_character(appendices, any.missing = FALSE, null.ok = TRUE)
  checkmate::assert_directory_exists(dir, access = "w")

  # R CMD Check variable bindings fix
  # nolint start
  . <- NULL
  # nolint end

  if (!is.null(appendices)) {
    for (i in appendices) {
      checkmate::assert_file_exists(fs::path(root, i), access = "r")
    }
  }

  cli::cli_alert_info(
    paste0(
      "Zipping files using ",
      "{.strong {cli::col_red(length(pattern))}}",
      "{cli::qty(length(pattern))} ",
      "pattern{?s}: ",
      "{.strong {pattern}}."
    )
  )

  out <- character()

  for (i in pattern) {
    i_files <- files |> stringr::str_subset(i)

    if (length(i_files) == 0) {
      cli::cli_alert_warning(
        paste0(
          "The pattern {.strong {cli::col_red(i)}} ",
          "did not match any file{?s}. Skipping."
        )
      )

      next
    }

    i_file_chunks <-
      i_files |>
      split_files_by_size(max_size = max_size, root = root) |>
      lapply(\(x) fs::path(root, x))

    cli::cli_alert_info(
      paste0(
        "Zipping ",
        "{.strong {length(i_files)}} file{?s} ",
        "matching the pattern {.strong {cli::col_red(i)}} ",
        "into {.strong {length(i_file_chunks)}} chunk{?s}."
      )
    )

    cli::cli_progress_bar(
      name = ifelse(
        length(files) == 1,
        "Zipping chunk",
        "Zipping chunks"
      ),
      total = length(i_file_chunks),
      type = "tasks",
      clear = FALSE
    )

    for (j in seq_along(i_file_chunks)) {
      i_zipfile_j <-
        ifelse(
          length(i_file_chunks) == 1,
          fs::path(dir, paste0(prefix, i, suffix, ".zip")),
          fs::path(dir, paste0(prefix, i, suffix, "_", j, ".zip"))
        ) |>
        normalizePath(mustWork = FALSE)

      zip::zip(
        zipfile = i_zipfile_j,
        files = c(i_file_chunks[[j]] |> basename(), appendices),
        root = root,
        ...
      )

      out <- c(out, i_zipfile_j)

      cli::cli_progress_update()
    }

    cli::cli_progress_done()
  }

  invisible(out)
}
