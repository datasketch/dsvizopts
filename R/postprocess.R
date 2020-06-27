# sort and slice
#'@export
postprocess <- function(d, col, sort, slice_n = NULL) {
  if (sort == "asc") {
    d <- d[order(d[col]),]
  }
  if (sort == "desc") {
    d <- d[order(-d[col]),]
  }
  if (!is.null(slice_n)) {
    d <- d %>%
      dplyr::slice(1:slice_n)
  }
  d
}
