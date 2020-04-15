#' Orientation
#'
#' @param orientation Plot orientation
#' @param x Categoric variable
#' @param y Numeric variable
#' @param hor Horizontal label
#' @param ver Vertical label
#' @description  defines horLabel and verLabel depending orientation
#' @export
orientationXY <- function(orientation, x, y, hor, ver) {
  if (orientation == "hor") {
    x0 <- ver %||% x
    y0 <- hor %||% y
  } else {
    x0 <- hor %||% x
    y0 <- ver %||% y
  }
  c(x0, y0)
}

#' Order Category
#'
#' @param data A data.frame
#' @param col Column to order
#' @param orientation Plot orientation
#' @param label_wrap Number of letters to add a new line
#' @description Order category column
#' @export
orderCategory <- function(data, col, orientation = "ver", order, label_wrap) {
  data[[col]] <- factor(stringr::str_wrap(data[[col]], label_wrap), levels = unique(stringr::str_wrap(data[[col]], label_wrap)))
  if (!is.null(order)) {
    order <- stringr::str_wrap(order, label_wrap)
    order <- union(order, unique(data[[col]])[!is.na(unique(data[[col]]))])
    if (all(!is.na(order)) & any(is.na(data[[col]]))) order <- c(union(order, unique(data[[col]][!is.na(data[[col]])])), NA)
    order[is.na(order)] <- "NA"
    data[[col]] <- factor(data[[col]], levels = unique(data[[col]][order(match(data[[col]], order))]))
    if (orientation == "hor") {
      data[[col]] <- factor(data[[col]], levels = rev(attr(data[[col]], "levels")))
    }
  }
  data
}
