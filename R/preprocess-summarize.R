#' Aggregation
#'
#' Aggregation functions for grouped data.frames
#'
#' @param aggregation one of sum, mean, or similar function
#' @export
agg <- function(aggregation, ...) {
  if (!is.null(aggregation) | nchar(aggregation) > 0 | !is.na(aggregation)) {
    do.call(aggregation, list(..., na.rm = TRUE))
  }
}

#' Drop NA
#' @param d A data frame
#' @param drop_na A logical value indicating if remove NA values
#' @export
preprocessData <- function(d, drop_na = FALSE, na_label = "(NA)"){
  if (drop_na){
    d <- d %>% tidyr::drop_na()
  }
  d$a[is.na(d$a)] <- na_label
  d
}

#' Summarize Data
#'
#' Summarise a data.frame with the given aggregation function
#'
#' @param df A data.frame
#' @param agg one of sum, mean, or similar function
#' @param to_agg Columns to aggregate
#' @param ... Variables to group
#' @export
summarizeData <- function(df, agg, to_agg, ...) {
  group_var <- rlang::enquos(...)
  summ_var <- rlang::enquo(to_agg)
  df %>%
    dplyr::group_by(!!! group_var) %>%
    dplyr::summarise(!! summ_var := agg(agg, !! summ_var))
}


