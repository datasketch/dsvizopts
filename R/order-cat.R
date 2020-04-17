
# order category column
#'@export
order_category <- function(data, col, order, label_wrap) {
  if (!is.null(order)) {
    order <- union(order, unique(data[[col]])[!is.na(unique(data[[col]]))])
    if (all(!is.na(order)) & any(is.na(data[[col]]))) order <- c(union(order, unique(data[[col]][!is.na(data[[col]])])), NA)
    order[is.na(order)] <- "NA"
    data <- data[order(match(data[[col]], order)), ]
  }
  if (is.null(label_wrap)) {
    data <- data
  } else {
    data[[col]] <- gsub("\\\n", "<br/>", str_wrap(data[[col]], label_wrap))
  }
  data
}
