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
GPLv3](https://img.shields.io/badge/license-GPLv3-bd0000.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
<!-- badges: end -->

## Overview

`groomr` is an R package designed to help you tidy and organize R
objects and files efficiently. It provides a set of functions for
cleaning, renaming, splitting, and managing files and data, making your
workflows more streamlined and reproducible.

> If you find this project useful, please consider giving it a star!  
> [![GitHub repo
> stars](https://img.shields.io/github/stars/danielvartan/groomr)](https://github.com/danielvartan/groomr/)

## Installation

You can install `groomr` using the
[`remotes`](https://github.com/r-lib/remotes) package:

``` r
remotes::install_github("danielvartan/groomr")
```

## Usage

Here are some functions that you can use with `groomr`:

- [`make_machine_readable()`](https://danielvartan.github.io/groomr/reference/make_machine_readable.html):
  Make a string machine-readable
- [`normalize_names()`](https://danielvartan.github.io/groomr/reference/normalize_names.html):
  Make file and directory names machine-readable
- [`remove_blank_line_dups()`](https://danielvartan.github.io/groomr/reference/remove_blank_line_dups.html):
  Remove blank lines duplicates in files
- [`replace_in_file()`](https://danielvartan.github.io/groomr/reference/replace_in_file.html):
  Replace a pattern in files
- [`sort_files_by_size()`](https://danielvartan.github.io/groomr/reference/sort_files_by_size.html):
  Sort files based on their size
- [`split_by_pattern()`](https://danielvartan.github.io/groomr/reference/split_by_pattern.html):
  Split a character vector by a pattern
- [`split_file()`](https://danielvartan.github.io/groomr/reference/split_file.html):
  Split a single file into `n` parts.
- [`split_files_by_size()`](https://danielvartan.github.io/groomr/reference/split_files_by_size.html):
  Split files based on their size
- [`to_title_case_pt()`](https://danielvartan.github.io/groomr/reference/to_title_case_pt.html):
  Convert to title case considering Portuguese rules.
- [`zip_files_by_pattern()`](https://danielvartan.github.io/groomr/reference/zip_files_by_pattern.html):
  Zip files by a pattern

Click [here](https://danielvartan.github.io/groomr/) to see the full
list.

## License

[![](https://img.shields.io/badge/license-GPLv3-bd0000.svg)](https://www.gnu.org/licenses/gpl-3.0)

`groomr` code is released under the [GNU General Public License Version
3](https://www.gnu.org/licenses/gpl-3.0).

``` text
Copyright (C) 2025 Daniel Vartanian

The code in this repository is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.
```

## Contributing

[![](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

Contributions are welcome, including bug reports. Take a moment to
review the [Guidelines for
Contributing](https://danielvartan.github.io/groomr/CONTRIBUTING.html).

[![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/danielvartan)

You can also support the development of `groomr` by becoming a sponsor.
Click [here](https://github.com/sponsors/danielvartan) to make a
donation. Please mention `groomr` in your donation message.
