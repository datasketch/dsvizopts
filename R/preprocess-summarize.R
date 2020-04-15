#' Aggregation
agg <- function(aggregation, ...) {
  if (!is.null(aggregation) | nchar(aggregation) > 0 | !is.na(aggregation)) {
    do.call(aggregation, list(..., na.rm = TRUE))
  }
}

#' Drop NA
#' @param d A data frame
#' @param drop_na A logical value indicating if remove NA values
#' @export
preprocessData <- function(d, drop_na = FALSE){
  if (drop_na){
    d <- d %>% tidyr::drop_na()
  }
  d
}

#' Summarize Data
#' @param df A data.frame
#' @param agg
#' @param to_agg
#' @export
summarizeData <- function(df, agg, to_agg, ...) {
  group_var <- rlang::enquos(...)
  summ_var <- rlang::enquo(to_agg)
  df %>%
    dplyr::group_by(!!! group_var) %>%
    dplyr::summarise(!! summ_var := agg(agg, !! summ_var))
}


