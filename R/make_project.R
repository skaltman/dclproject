
#' Create DCL project template
#'
#' Creates a project template with folders (data-raw, scripts, data, eda, and reports)
#' and a Makefile template.
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

  file.copy(
    from = system.file("resources/Makefile", package = "dclproject"),
    to = file.path(path)
  )
}
