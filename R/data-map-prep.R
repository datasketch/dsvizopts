
#' General function for processing geographic data
#'
#' @param data A data frame with geografical info.
#' @param ftype A string value with type of data to be plotted
#' @param agg Statistics which can be applied to all data subsets (sum, mean, median)
#' @param ptage_col A string value with the name of the categorical variable against which the percentage is calculated.
#' @param more_levels A logical indicating if the map has more than one territorial level.
#' @param group_extra_num A logical indicating
#'
#' @examples
#'
#' df <- sample_data("Gnm-Cat-Num")
#' data_map_prep(data = df, ftype = "Gnm-Cat-Num". agg = "sum")
#'
#' df <- data.frame(id = "COL", "URY", "ARG")
#' df$id <- as_Gnm(df$id)
#' data_map_prep(data = df, ftype = "Gcd". agg = "mean")
#'
#' df <- sample_data("Gnm-Gcd-Num-Cat-Cat-Num")
#' data_map_prep(data = df, ftype = "Gnm-Num", agg = "sum", more_levels = TRUE)
#'
#' @export
data_map_prep <- function (data, ftype, agg, ptage_col = NULL, more_levels = FALSE, group_extra_num = TRUE) {

  if (is.null(data)) return()

  if (grepl("Gnm", ftype) & more_levels) {
    data[[1]] <- paste0(data[[1]], " - ", data[[2]])
    data <- data[,-2]
  }

  f <- homodatum::fringe(data)
  nms <- homodatum::fringe_labels(f)
  nms[length(nms)+1] <- c("%")
  names(nms) <- c(names(nms)[-length(nms)], "..percentage")
  nms[length(nms)+1] <- c("Count")
  names(nms) <- c(names(nms)[-length(nms)], "..count")
  d <- homodatum::fringe_d(f)
  if (grepl("Gln|Glt", ftype)) {
    d <- d %>% tidyr::drop_na(a, b)
  } else {
    d <- d %>% tidyr::drop_na(a)
  }
  frtype <- f$frtype
  dic <- f$dic
  if (more_levels) dic$hdType[1] <- "Gnm"
  dic$id <- names(d)

  dic <- dic %>%
    dplyr::bind_rows(
      data.frame(id = c("..percentage", "..count", "value"),
                 label = c("Percentage", "Count", "Domain"),
                 hdType = rep("Num", 3))
    )

  ncols_d <- ncol(d)

  ftype_vec <- stringr::str_split(ftype,pattern = "-") %>% unlist()
  ftype_length <- length(ftype_vec)

  add_cols <- ncols_d != ftype_length

  dd <- d[,1:ftype_length]
  dic_p <- dic %>% dplyr::filter(id %in% names(dd))


  # type data to work
  has_num <- grepl("Num", ftype)
  var_num <- NULL
  agg_var <- "..count"
  if (has_num) {
    var_num <- dic_p %>% dplyr::filter(hdType %in% "Num") %>% .$id
    agg_var <- names(nms)[grep("Num", ftype_vec)]
  }

  has_cat <- grepl("Cat", ftype)
  var_cat <- NULL
  if (has_cat) var_cat <- dic_p %>% dplyr::filter(hdType %in% "Cat") %>% .$id

  has_geo <- grepl("Gcd|Gnm", ftype)
  var_group <- NULL
  if (has_geo) var_group <- dic_p %>% dplyr::filter(hdType %in% c("Gcd", "Gnm")) %>% .$id
  if (!is.null(var_cat)) var_group <- c(var_group, var_cat)

  has_cor <- grepl("Gln|Glt", ftype)
  var_cor <- NULL
  if (has_cor) {
    var_cor <- dic_p %>% dplyr::filter(hdType %in% c("Gln", "Glt")) %>% .$id
    var_group <- c(var_group, var_cor)
  }

  if (has_geo | has_cor) {
    if (length(var_group) == 1) {
      dd <- dsvizopts::function_agg(dd, agg, to_agg = var_num, a)
      ptage_col <- NULL
    } else if (length(var_group) == 2) {
      dd <- dsvizopts::function_agg(dd, agg, to_agg = var_num, a, b)
    } else if (length(var_group) == 3) {
      dd <- dsvizopts::function_agg(dd, agg, to_agg = var_num, a, b, c)
    }
  }

  if (!is.null(ptage_col))  ptage_col <- names(nms[match(ptage_col, nms)])

  dd <- dsvizopts::percentage_data(dd, agg_var = agg_var, by_col = ptage_col)

  if (add_cols) {
    join_cols <- dic_p$id[1:length(var_group)]
    extra_cols <- setdiff(dic$id, c(dic_p$id, "..percentage", "..count", "value"))
    dj <- d[c(join_cols, extra_cols)]

    # extra num cols
    dic_extra <- dic %>% dplyr::filter(id %in% extra_cols)
    var_num_extra <- dic_extra$id[dic_extra$hdType == "Num"]
    var_cat_extra <- dic_extra$id[dic_extra$hdType == "Cat"]
    if (!identical(var_cat_extra, character())) {
      dic$hdType[dic$id %in% var_cat_extra] <- "Cat.."
    }

    if (!identical(var_num_extra, character())) {
      # if (group_extra_num) {
      #   if (length(join_cols) == 1) {
      #     dj_s <- simple_summary(dj, agg, to_agg = var_num_extra, a)
      #   } else if (length(join_cols) == 2) {
      #     dj_s <- simple_summary(dj, agg, to_agg = var_num_extra, a, b)
      #   } else if (length(join_cols) == 3) {
      #     dj_s <- simple_summary(dj, agg, to_agg = var_num_extra, a, b, c)
      #   }
      #   dj <- dj %>% left_join(dj_s)
      # } else {
      dic$hdType[dic$id %in% var_num_extra] <- "Cat.."
      #}
    }

    if (length(join_cols) == 1) {
      dj <- dsvizopts::collapse_data(dj, a)
    } else if (length(join_cols) == 2) {
      dj <- dsvizopts::collapse_data(dj, a, b)
    } else if (length(join_cols) == 3) {
      dj <- dsvizopts::collapse_data(dj, a, b, c)
    }

    dd <- dd %>% dplyr::left_join(dj, by = join_cols)

  }

  dd$value <- dd[[agg_var]]
  nms_tooltip <- setNames(dic_p$label, dic_p$id)

  l <- list(
    data = dd,
    dic = dic,
    nms = nms,
    nms_tooltip = nms_tooltip #default tooltip when this is null
  )
  l
}





#' shape info
#'
#' @param map_name Map name, view \code{geodata::availableGeodata()}
#' @param ftype Data class by column
#' @param by_col Variables to join centroids with shape file
#' @param addRds A logical indicating if the output should contain the geographic information saved in rds.
#'
#' @examples
#'
#' shape_info("col_departments", ftype = "Gnm-Num")
#' @export
shape_info <- function (map_name, ftype, by_col = "name", addRds = FALSE) {

  if (is.null(map_name)) stop("You must type a map name")
  if (!map_name %in% geodata::availableGeodata()) stop("You map name isn't available, view availableGeodata()")

  geoInfo <- geodata::geoinfo(mapName = map_name)
  centroides <- geoInfo$centroids
  nms_centroides <- names(centroides)
  aditional_name <- setdiff(nms_centroides, c("id", "name", "lat", "lon"))
  more_levels <- !identical(aditional_name, character())
  centroides_join <- centroides[c("id", "lat", "lon")]
  topoInfo <- geoInfo$geo_sf


  topoInfo <- topoInfo %>%
    dplyr::left_join(centroides_join, by =  "id") %>%
    mutate(id = as.character(id))

  topoInfo_names <- names(topoInfo)

  if (grepl("Gnm", ftype) & !identical(aditional_name, character())) {
    topoInfo$name_alt <- paste0(topoInfo$name, " - ", topoInfo[[aditional_name]])
  } else {
    topoInfo$name_alt <- as.character(topoInfo[[by_col]])
  }

  topoInfo$name_alt <- iconv(tolower(topoInfo$name_alt), to = "ASCII//TRANSLIT")
  topoInfo$name_label <- topoInfo$name
  #topoInfo <- topoInfo %>% st_set_crs(3857)


  out <- list(
    topoInfo = topoInfo,
    more_levels = more_levels
  )

  if (addRds) {
    out <- modifyList(out, list(
      rdsInfo = geoInfo$geo_rds
    ))
  }

  out
}
