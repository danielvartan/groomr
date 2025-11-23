# Load Packages -----

library(beepr)
library(cffr)
library(codemetar)
library(groomr) # https://github.com/danielvartan/groomr
library(here)
library(rutils) # https://github.com/danielvartan/rutils

# Remove empty lines from `README.md` -----

here("README.md") |> remove_blank_line_dups()

# Update Package Versions in `DESCRIPTION` -----

update_pkg_versions()

# Update `cffr` and `codemeta` -----

cff_write()
write_codemeta()

# Check If the Script Ran Successfully -----

beep(1)

Sys.sleep(3)
