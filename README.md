# groomr

<!-- quarto render -->

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
[![R-CMD-check.yaml](https://github.com/danielvartan/groomr/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/danielvartan/groomr/actions/workflows/check-standard.yaml)
[![Codecov test
coverage](https://codecov.io/gh/danielvartan/groomr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/danielvartan/groomr?branch=main)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green.png)](https://opensource.org/license/mit)
[![Contributor
Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)
<!-- badges: end -->

## Overview

`groomr` is an R package that helps you tidy R objects and files.

## Installation

You can install `groomr` using the
[`remotes`](https://github.com/r-lib/remotes) package:

``` r
remotes::install_github("danielvartan/groomr")
```

## Usage

Here are some functions that you can use with `groomr`:

- [`blank_line_neighbors()`](https://danielvartan.github.io/groomr/reference/blank_line_neighbors.html):
  Identify blank lines around a line.
- [`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.html):
  Make a string machine-readable.
- [`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.html):
  Make file and directory names machine-readable.
- [`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.html):
  Remove duplicate blank lines in text files.
- [`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.html):
  Replace a pattern in files.
- [`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.html):
  Split a character vector by a pattern.
- [`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.html):
  Split text files into multiple files.
- [`to_title_case_pt()`](https://danielvartan.github.io/groomr/reference/to_title_case_pt.html):
  Convert to title case considering Portuguese rules.

Click [here](https://danielvartan.github.io/groomr/) to see the full
list.

## Contributing

Contributions are welcome, including bug reports. Take a moment to
review the [Guidelines for
Contributing](https://danielvartan.github.io/groomr/CONTRIBUTING.html).

## License

[![License:
MIT](https://img.shields.io/badge/license-MIT-green.png)](https://opensource.org/license/mit)

`groomr` code is released under the [MIT
license](https://opensource.org/license/mit).

<br>

Become an `groomr` supporter!

Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please indicate the `groomr` package in your donation message.
