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

  folders <-
    c("data-raw", "data", "scripts", "docs", "eda", "reports")

  for (folder in folders) {
    dir.create(file.path(path, folder))
  }
}
