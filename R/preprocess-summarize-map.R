
#'
#' @export

topo_info <- function(map_name) {
  #rgdal::readOGR(geodataTopojsonPath(map_name))
  geojsonio::topojson_read(geodataTopojsonPath(map_name))
}


# Preprocess maps ---------------------------------------------------------


#'
#'@export
data_centroid <- function(geoname, basename) {
  centroides <- file.path("geodata", geoname, paste0(basename,".csv"))
  centroides <- readr::read_csv(system.file(centroides,package = "geodata")) %>% tidyr::drop_na()
  centroides
}


#'
#'@export
topo_bbox <- function(lon, lat) {
  xy <- cbind(lon, lat)
  S <- sp::SpatialPoints(xy)
  bbox <- sp::bbox(S)
  bbox
}

#'
#'@export
topo_data <- function(map_name) {
  topoData <- geodata::geodataTopojsonPath(map_name)
  topoData <- readLines(topoData) %>% paste(collapse = "\n")
  topoData
}

