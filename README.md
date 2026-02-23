# groomr <a href = "https://danielvartan.github.io/groomr/"><img src = "man/figures/logo.svg" align="right" width="120" /></a>

<!-- quarto render -->

<!-- badges: start -->
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R build
status](https://github.com/danielvartan/groomr/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/danielvartan/groomr/actions)
[![](https://codecov.io/gh/danielvartan/groomr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/danielvartan/groomr)
[![GNU GPLv3
License](https://img.shields.io/badge/license-GPLv3-bd0000.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Contributor Covenant 3.0 Code of
Conduct](https://img.shields.io/badge/Contributor%20Covenant-3.0-4baaaa.svg)](https://www.contributor-covenant.org/version/3/0/code_of_conduct/)
<!-- badges: end -->

## Overview

`groomr` is an R package designed to help you tidy and organize R
objects and files. It provides functions for cleaning, renaming,
splitting, and managing files and data, making workflows more efficient
and reproducible.

> If you find this project useful, please consider giving it a star!  
> [![GitHub repo
> stars](https://img.shields.io/github/stars/danielvartan/groomr)](https://github.com/danielvartan/groomr/)

## Installation

You can install `groomr` using the
[`remotes`](https://github.com/r-lib/remotes) package:

``` r
# install.packages("remotes")
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

[![](https://img.shields.io/badge/license-GPLv3-bd0000.svg)](https://www.gnu.org/licenses/gpl-3.0)

``` text
Copyright (C) 2026 Daniel Vartanian

groomr is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.
```

## Contributing

[![](https://img.shields.io/badge/Contributor%20Covenant-3.0-4baaaa.svg)](https://www.contributor-covenant.org/version/3/0/code_of_conduct/)

Contributions are always welcome! Whether you want to report bugs,
suggest new features, or help improve the code or documentation, your
input makes a difference.

Before opening a new issue, please check the [issues
tab](https://github.com/danielvartan/groomr/issues) to see if your topic
has already been reported.
