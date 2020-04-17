# sort and slice
#'@export
postprocess <- function(d, col, sort, slice_n = NULL) {
  if (sort == "asc") {
    d <- d %>%
      dplyr::arrange_(col)
  }
  if (sort == "desc") {
    col <- paste0('desc(', col, ')')
    d <- d %>%
      dplyr::arrange_(.dots = col)
  }
  if (!is.null(slice_n)) {
    d <- d %>%
      dplyr::slice(1:slice_n)
  }
  d
}
