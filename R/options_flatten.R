

is_flat_list <- function(x) all(purrr::map_lgl(x, ~!is.list(.)))

options_flatten <- function(x){
  # Think about introducing list_flatten
  #purrr::list_flatten(x, name_spec = "{inner}",name_repair = "universal")
  if(is.null(x)) return()
  if(length(x) == 0) return(list())
  if(length(unlist(x)) == 0) return(list())
  flat_x <- flatten_list(x)
  flat_names <- names(flat_x)
  new_flat_names <- sub('^.*\\.([[:alnum:]_]+)$', '\\1', flat_names)
  idx_last_occur <- get_idx_last_occurrence(new_flat_names)
  names(flat_x) <- new_flat_names
  flat_x <- flat_x[idx_last_occur]
  flat_x



}

flatten_list <- function(lst) {
  # https://stackoverflow.com/questions/42739419/r-convert-nested-list-into-a-one-level-list
  #lapply(rapply(x, enquote, how="unlist"), eval)
  do.call(c, lapply(lst, function(x) if(is.list(x)) flatten_list(x) else list(x)))
}



get_idx_last_occurrence <- function(x){
  # https://stackoverflow.com/questions/27801589/find-the-indices-of-last-occurrence-of-the-unique-elements-in-a-vector
  length(x)-match(unique(x),rev(x))+1
}

