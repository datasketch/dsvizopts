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

#' @export
format_prep <- function(data, dic, formats) {

  if (is.null(data)) return()

  var_nums <- grep("Num", dic$hdType)

  if (!identical(var_nums, integer())) {
    var_nums <- dic$id[var_nums]

    l_nums <- purrr::map(var_nums, function(f_nums){
      data[[paste0(f_nums, "_label")]] <<- makeup::makeup_num(as.numeric(data[[f_nums]]), sample = formats$sample_num)
    })}

  var_nums <- grep("Glt|Gln", dic$hdType)

  if (!identical(var_nums, integer())) {
    var_nums <- dic$id[var_nums]

    l_nums <- purrr::map(var_nums, function(f_nums){
      data[[paste0(f_nums, "_label")]] <<- as.numeric(data[[f_nums]])
    })}

  var_cats <- grep("^Cat$|Gnm|Gcd", dic$hdType)
  if (!identical(var_cats, integer())) {
    var_cats <- dic$id[var_cats]
    l_nums <- purrr::map(var_cats, function(f_cats){
      data[[paste0(f_cats, "_label")]] <<- makeup::makeup_chr(as.character(data[[f_cats]]), sample = formats$sample_cat)
    })}

  var_cats_extra <- grep("Cat..", dic$hdType)

  if (!identical(var_cats_extra, integer())) {
    var_cats_extra <- dic$id[var_cats_extra]

    l_nums <- purrr::map(var_cats_extra, function(f_cats..){
      data[[paste0(f_cats.., "_label")]] <<- makeup::makeup_chr(as.character(data[[f_cats..]]), sample = NULL)
    })}


  data

}
