# groomr <a href = "https://danielvartan.github.io/brandr/"><img src = "man/figures/logo.svg" align="right" width="120" /></a>

<!-- quarto render -->

<!-- badges: start -->
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R build
status](https://github.com/danielvartan/groomr/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/danielvartan/groomr/actions)
[![](https://codecov.io/gh/danielvartan/groomr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/danielvartan/groomr)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
<!-- badges: end -->

## Overview

`groomr` is an R package designed to help you tidy and organize R
objects and files efficiently. It provides a set of functions for
cleaning, renaming, splitting, and managing files and data, making your
workflows more streamlined and reproducible.

> If you find this project useful, please consider giving it a star!  
> [![GitHub repo
> stars](https://img.shields.io/github/stars/danielvartan/groomr.png)](https://github.com/danielvartan/groomr/)

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

[![](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

`groomr` code is released under the [MIT
license](https://opensource.org/license/mit).

## Contributing

[![](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

Contributions are welcome, including bug reports. Take a moment to
review the [Guidelines for
Contributing](https://danielvartan.github.io/groomr/CONTRIBUTING.html).

[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86.png)](https://github.com/sponsors/danielvartan)

You can also support the development of `groomr` by becoming a sponsor.
Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please mention `groomr` in your donation message.
