script_template <-
'# DESCRIPTION

# Source:

# Author:
# Version:

# Libraries
library(tidyverse)

# Parameters
  # Input file
file_raw <- here::here("")
  # Output file
file_out <- here::here("")

#===============================================================================

# Code

'

makefile_template <-
'# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
data =

# EDA studies
eda =

# Reports
reports =

# All targets
all : $(data) $(eda) $(reports)

# Data dependencies

# EDA study and report dependencies

# Pattern rules
%.rds : %.R
Rscript $<
  %.md : %.Rmd
Rscript -e \'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))\'
'

folders <-
  c(
    `Raw data` = "data-raw",
    `Processed data` = "data",
    `Scripts` = "scripts",
    `Docs` = "docs",
    `EDA` = "eda",
    `Reports` = "reports"
  )


#' Create DCL project template
#'
#' Creates a project template with folders, Makefile, and a script template.
#'
#' @param path
#' @param ...
#'
#' @export
make_project <- function(path, ...) {
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  for (i in 1:length(folders)) {
    dir.create(path = file.path(path, folders[[i]]), showWarnings = FALSE)
    file.create(path = file.path(path, folders[[i]], "README.md"))
    writeLines(
      text = paste("#", names(folders)[[i]]),
      con = file.path(path, folders[[i]], "README.md")
    )
  }

  file.create(
    path = file.path(path, "scripts", "template.R"),
    showWarnings = FALSE
  )
  writeLines(
    text = script_template,
    con = file.path(path, "scripts", "template.R")
  )

  file.create(path = file.path(path, "Makefile"), showWarnings = FALSE)
  writeLines(text = makefile_template, con = file.path(path, "Makefile"))
}
