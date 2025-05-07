# groomr <a href = "https://danielvartan.github.io/brandr/"><img src = "man/figures/logo.svg" align="right" width="120" /></a>

<!-- quarto render -->

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://img.shields.io/badge/Repo%20Status-Active-10D810.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
Stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check.yaml](https://github.com/danielvartan/groomr/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/danielvartan/groomr/actions/workflows/check-standard.yaml)
[![Codecov test
coverage](https://codecov.io/gh/danielvartan/groomr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/danielvartan/groomr?branch=main)
[![License:
MIT](https://img.shields.io/badge/License-MIT-10D810.svg)](https://choosealicense.com/licenses/mit/)
[![Contributor
Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)
<!-- badges: end -->

## Overview

`groomr` is an R package designed to help you tidy and organize R
objects and files efficiently. It provides a set of functions for
cleaning, renaming, splitting, and managing files and data, making your
workflows more streamlined and reproducible.

## Installation

You can install `groomr` using the
[`remotes`](https://github.com/r-lib/remotes) package:

``` r
remotes::install_github("danielvartan/groomr")
```

## Usage

Here are some functions that you can use with `groomr`:

- [`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.html):
  Make a string machine-readable.
- [`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.html):
  Make file and directory names machine-readable.
- [`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.html):
  Remove blank lines duplicates in files.
- [`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.html):
  Replace a pattern in files.
- [`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.html):
  Sort files based on their size.
- [`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.html):
  Split a character vector by a pattern.
- [`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.html):
  Split a single file into `n` parts.
- [`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.html):
  Split files based on their size.
- [`to_title_case_pt()`](https://danielvartan.github.io/groomr/reference/to_title_case_pt.html):
  Convert to title case considering Portuguese rules.
- [`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.html):
  Zip files by a pattern.

Click [here](https://danielvartan.github.io/groomr/) to see the full
list.

## License

[![License:
MIT](https://img.shields.io/badge/License-MIT-10D810.svg)](https://choosealicense.com/licenses/mit/)

`groomr` code is released under the [MIT
license](https://opensource.org/license/mit).

## Contributing

[![Contributor
Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)

Contributions are welcome, including bug reports. Take a moment to
review the [Guidelines for
Contributing](https://danielvartan.github.io/groomr/CONTRIBUTING.html).

<br>

Become an `groomr` supporter!

Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please indicate the `groomr` package in your donation message.
