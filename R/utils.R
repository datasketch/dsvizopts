#'@export
sysfile <- function(..., package){
  if (is.null(package)){
    path = file.path(...)
  } else {
    path = system.file(..., package = package)
  }
  path
}

#'@export
`%||%` <- function (x, y) {
  if (rlang::is_empty(x))
    return(y)
  else if (is.null(x) || is.na(x))
    return(y)
  else if( class(x)=="character" && nchar(x)==0 )
    return(y)
  else x
}


#'@export
is.empty <- function(x){
  if(length(x) == 0) return(TRUE)
  if(length(x) == 1 && nchar(x) == 0) return(TRUE)
  !as.logical(length(x))
}

#'@export
removeNulls <- function(x){
  if (length(x) == 0 || !is.list(x))
    return(x)
  if(is.empty(x)) return(list())
  x[!unlist(lapply(x,is.null))]
}

#'@export
file_path_sans_ext <- function (x)
{
  sub("([^.]+)\\.[[:alnum:]]+$", "\\1", x)
}

#'@export
file_ext <- function (x)
{
  pos <- regexpr("\\.([[:alnum:]]+)$", x)
  ifelse(pos > -1L, substring(x, pos + 1L), "")
}


