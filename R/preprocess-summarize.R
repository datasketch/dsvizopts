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
preprocessData <- function(d, drop_na = FALSE,
                           na_label = NULL, na_label_cols = NULL){
  if (drop_na){
    d <- d %>% tidyr::drop_na(na_label_cols)
  }else  if (!is.null(na_label)){
    if(is.null(na_label_cols)) stop("need na_label_cols parameter")
    d <- purrr::map(names(d), function(col){
      if(col %in% na_label_cols){
        if(is.character(d[[col]])) d[[col]][is.na(d[[col]])] <- na_label
        if(is.factor(d[[col]])){
          levs <- levels(d[[col]])
          v <- as.character(d[[col]])
          v[is.na(v)] <- na_label
          d[[col]] <- factor(v, levels = c(levs, na_label))
        }
      }
      d[[col]]
    }) %>% purrr::set_names(names(d)) %>% tibble::as_tibble()
  }
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


#' Sum, mean. median o count of initial data
#'
#' \code{function_agg} returns the operation of all the values present in its arguments.
#'
#' This is a generic function: methods can be defined for it directly or via the
#' \code{\link{across}} group generic. For this to work properly, the arguments
#' \code{...} should be unnamed, and dispatch is on the first argument.
#' @export
function_agg <- function (df, agg, to_agg, ...) {
  group_var <- rlang::enquos(...)

  if (is.null(to_agg)) {
    dd <- df %>%
      dplyr::group_by(!!!group_var) %>%
      dplyr::summarise(..count = dplyr::n())
  } else {
    dd <- df %>%
      dplyr::group_by(!!!group_var) %>%
      dplyr::summarise(dplyr::across(to_agg, ~ dsvizopts::agg(agg, .x)), ..count = dplyr::n())
  }
  dd

}

#' @export
simple_summary <- function(df, agg, to_agg, ...) {
  group_var <- rlang::enquos(...)
  dd <- df %>%
    dplyr::group_by(!!!group_var) %>%
    dplyr::summarise(dplyr::across(to_agg, ~ dsvizopts::agg(agg, .x)))
  dd
}

#' @export
percentage_data <- function (data, agg_var, by_col = NULL) {

  if (is.null(agg_var)) stop("You must have a numeric column")

  data[[agg_var]] <- as.numeric(data[[agg_var]])
  agg_var_t <- rlang::sym(agg_var)

  if (is.null(by_col)) {
    df <- data %>%
      mutate(..percentage = (!!agg_var_t/sum(!!agg_var_t, na.rm = TRUE))*100)
  } else {
    df <- data %>%
      dplyr::group_by_(by_col) %>%
      dplyr::mutate(..percentage = (!!agg_var_t/sum(!!agg_var_t, na.rm = TRUE))*100)
  }
  df
}


#' @export
collapse_data <- function (data, ...) {
  group_var <- rlang::enquos(...)
  print(group_var)
  func_paste <- function(x) paste(unique(x), collapse = '. ')
  df <- data %>%
    dplyr::group_by(!!!group_var) %>%
    dplyr::summarise_each(dplyr::funs(func_paste))
  df
}


