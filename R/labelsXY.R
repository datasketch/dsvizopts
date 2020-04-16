#' Orientation
#'
#' Returns horLabel and verLabel in a vector depending orientation
#'
#' @param hor_title Horizontal title
#' @param ver_title Vertical title
#' @param nms Column names
#' @param orientation Plot orientation
#' @return vector for x,y axis titles
#' @export
labelsXY <- function(hor_title, ver_title, nms, orientation){
  labelsXY <- hor_title %||% nms[1]
  labelsXY[2] <- ver_title %||% nms[2]
  if(orientation == "hor") labelsXY <- rev(labelsXY)
  labelsXY
}



