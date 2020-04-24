
#' Chart Options
#'
#' @name dsviz_default_opts
#' @param agg defaults to "sum"
#' @param agg_text defaults to NULL
#' @param caption defaults to NULL
#' @param pallete_colors defaults to NULL
#' @param color_by defaults to discrete"
#' @param drop_na defaults to FALSE
#' @param format_num defaults to "1,500.00"
#' @param highlight_value defaults to NULL
#' @param highlight_value_color defaults to '#F9B233'
#' @param hor_label defaults to NULL
#' @param hor_line defaults to NULL
#' @param label_ratio defaults to 1
#' @param label_wrap defaults to 12
#' @param marks defaults to c("." "")
#' @param n_digits defaults to NULL
#' @param order defaults to NULL
#' @param orientation defaults to "ver"
#' @param percentage defaults to FALSE
#' @param prefix defaults to NULL
#' @param slice_n defaults to NULL
#' @param sort defaults to "no"
#' @param subtitle defaults to NULL
#' @param suffix defaults to NULL
#' @param text_color defaults to "#5A6B72"
#' @param text_show defaults to TRUE
#' @param text_size defaults to 3
#' @param theme defaults to NULL
#' @param title defaults to NULL
#' @param ver_label defaults to NULL
#' @param ver_line defaults to NULL
#' @param opts defaults to NULL
#' @import homodatum
dsviz_default_opts <- function(
                           agg = "sum",
                           agg_text = NULL,
                           caption = NULL,
                           pallete_colors = NULL,
                           color_by = NULL,
                           drop_na = FALSE,
                           highlight_value = NULL,
                           highlight_value_color = '#F9B233',
                           hor_label = NULL,
                           hor_line = NULL,
                           label_ratio = 1,
                           label_wrap = 12,
                           marks = c(".", ","),
                           n_digits = NULL,
                           order = NULL,
                           orientation = "ver",
                           percentage = FALSE,
                           prefix = NULL,
                           slice_n = NULL,
                           sort = "no",
                           subtitle = NULL,
                           suffix = NULL,
                           text_color = "#5A6B72",
                           text_show = TRUE,
                           text_size = 3,
                           theme = NULL,
                           title = NULL,
                           ver_label = NULL,
                           ver_line = NULL,
                           opts = NULL){

  # opts$agg_text<- opts$agg_text %||% opts$agg
  # opts$palette_colors <- opts$palette_colors %||% opts$theme$palette_colors
  # opts$background_color <- opts$background_color %||% opts$theme$background_color
  # opts

  preprocessOpts <- list(
    drop_na = FALSE,
    na_label = "(NA)"
  )
  summarizeOpts <- list(
    agg = "sum",
    agg_text = NULL
  )
  postprocessOpts <- list(
    sort = "no",
    slice_n = NULL,
    order = NULL
  )

  styleOpts <- list(
    axis_text_angle = NA,
    color_by = NULL,# which variable?
    format_dat_sample = "Jun 24 2010",
    format_num_sample = "1,500.00",
    format_cat_sample = "Title case",
    locale = "en-US",
    label_wrap = 12,
    spline = FALSE
    # label_ratio = 1,
    # highlight_value = NULL,
    # highlight_value_color = '#F9B233',
  )
  chartOpts <- list(
    orientation = "ver"
  )
  titleOpts <- list(
    title = NULL,
    ver_title = NULL,
    hor_title = NULL,
    subtitle = NULL,
    caption = NULL
  )

  themeOpts <- list(
    has_subtitle = FALSE
  )
  themeOpts <- modifyList(themeOpts, default_theme_opts(), keep.null = TRUE)

  list(
    preprocess = preprocessOpts,
    summarize = summarizeOpts,
    postprocess = postprocessOpts,
    style = styleOpts,
    chart = chartOpts,
    title = titleOpts,
    theme = themeOpts
  )
}
#' @export
dsviz_defaults <- function(flat = FALSE){
  opts <- dsviz_default_opts()
  if(flat) return(options_flatten(opts))
  opts
}

#' @export
merge_dsviz_options <- function(...){
  default_opts <- dsviz_defaults(flat = TRUE)
  args <- list(...)
  # flat_args <- options_flatten(args)
  opts_flat <- mergeOptions(args, defaults = default_opts)

  theme <- pull_opt_group(opts_flat, "theme")
  theme$has_subtitle <- !is.null(opts_flat$subtitle)

  list(
    preprocess = pull_opt_group(opts_flat, "preprocess"),
    summarize = pull_opt_group(opts_flat, "summarize"),
    postprocess = pull_opt_group(opts_flat, "postprocess"),
    style = pull_opt_group(opts_flat, "style"),
    chart = pull_opt_group(opts_flat, "chart"),
    title = pull_opt_group(opts_flat, "title"),
    theme = theme
  )
}




#' Merge Options
#'
#' Merges (...) parameters to an opts list
#'
#' @param defaults A list to provide base structures to parameters.
#' @noRd
mergeOptions <- function(..., defaults = NULL){
  args <- list(...)
  # str(args)
  opts_list <- args$opts
  # str(opts_list)
  args$opts <- NULL
  args_opts <- modifyList(args, opts_list %||% list(), keep.null = TRUE)
  flat_args_opts <- options_flatten(args_opts)
  # str(args_opts)
  modifyList(defaults, flat_args_opts, keep.null = TRUE)
}



pull_opt_group <- function(opts, group){
  defaults <- dsviz_defaults(flat = FALSE)
  group_names <- map(defaults, names)
  if(!group %in% names(defaults))
    stop("Option group not found, must be one of: ",
         paste0(names(group_names), collapse = ", "))
  group_opts <- group_names[[group]]
  pulled_opts <- opts[group_opts]
  names(pulled_opts) <- group_opts
  pulled_opts
}


is_flat_list <- function(x) all(map_lgl(x, ~!is.list(.)))

options_flatten <- function(x){
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

