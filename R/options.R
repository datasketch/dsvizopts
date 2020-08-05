
#' Chart Options
#'
#' @name dsviz_default_opts
#' @param drop_na drop NA values from input data
#' @param na_label replace NA values with string
#' @param agg Aggregation function for groups, defaults to sum
#' @param agg_text When there is aggegregaton agg_text is prepended to grouped variable
#' @param sort Whether to sort the data column: asc or desc
#' @param slice_n Slide the data from 1 to n
#' @param order Give the order of the categories
#' @param axis_text_angle Rotate axis ticks test
#' @param color_by Column to map colors
#' @param format_dat_sample  Sample format for dates, e.g. "28/04/2020" or "February 28th 2020"
#' @param format_num_sample Sample format for numbers, e.g. "1,234.56" or "1'234.5678"
#' @param format_cat_sample Sample format for categories, e.g. "TITTLE", "lowercase", "Title Case"
#' @param locale Locale to use, e.g. "en-US"
#' @param label_wrap Number of characters to wrap long tick titles
#' @param spline Spline TRUE or FALSE for line charts (html only)
#' @param prefix Add preffix to values
#' @param suffix Add suffix to values
#' @param label_wrap_legend Wrap the legend string the given number of characters
#' @param orientation Chart orientation: horizonal ("hor") or verical ("ver")
#' @param bubble_min Relative min size of bubbles in chart
#' @param bubble_max Relative max size of bubbles in chart
#' @param dataLabels_show Show data labels
#' @param dataLabels_format_sample Format for data labels
#' @param dataLabels_size Data labels size
#' @param dataLabels_color Data labels color
#' @param title Chart title
#' @param ver_title Vertical axis title
#' @param hor_title Horizontal axis titble
#' @param subtitle Subtitle
#' @param caption Caption
#' @param opts All of the previous options can be passed as list of options opts
#' @export
dsviz_default_opts <- function(drop_na = NULL,
                               na_label = NULL,
                               agg = NULL,
                               agg_text = NULL,
                               sort = NULL,
                               slice_n = NULL,
                               order = NULL,
                               axis_text_angle = NULL,
                               color_by = NULL,
                               format_dat = NULL,
                               format_sample_dat = NULL,
                               format_sample_num = NULL,
                               format_sample_cat = NULL,
                               locale = NULL,
                               label_wrap = NULL,
                               spline = NULL,
                               prefix = NULL,
                               suffix = NULL,
                               label_wrap_legend = NULL,
                               orientation = NULL,
                               bubble_min = NULL,
                               bubble_max = NULL,
                               data_labels_show = NULL,
                               data_labels_format_sample = NULL,
                               title = NULL,
                               ver_title = NULL,
                               hor_title = NULL,
                               subtitle = NULL,
                               caption = NULL,
                               opts = NULL){

  # opts$agg_text<- opts$agg_text %||% opts$agg
  # opts$palette_colors <- opts$palette_colors %||% opts$theme$palette_colors
  # opts$background_color <- opts$background_color %||% opts$theme$background_color
  # opts

  preprocessOpts <- list(
    drop_na = FALSE,
    drop_na_legend = FALSE,
    na_label = "(NA)"
  )
  summarizeOpts <- list(
    agg = "sum",
    agg_text = NULL
  )
  postprocessOpts <- list(
    sort = "no",
    slice_n = NULL,
    order = NULL,
    order_legend = NULL,
    percentage = FALSE,
    percentage_col = NULL
  )

  styleOpts <- list(
    axis_text_angle = NA,
    color_by = NULL,# which variable?
    format_dat = NULL,
    format_sample_dat = NULL,
    format_sample_num = "1,500.00",
    format_sample_cat = NULL,#"Title case",
    locale = "en-US",
    label_wrap = 12,
    spline = FALSE,
    prefix = "",
    suffix = "",
    label_wrap_legend = 12
    # label_ratio = 1,
    # highlight_value = NULL,
    # highlight_value_color = '#F9B233',
  )
  chartOpts <- list(
    orientation = "ver",
    graph_type = "grouped",
    highlight_value = NULL,
    highlight_value_color = "#50c5b7",
    tooltip = ""
  )

  shinyOpts <- list(
    allow_point = FALSE,
    color_click = NULL,
    color_hover = NULL,
    cursor =  NULL,
    clickFunction = NULL
  )

  extraOpts <- list(
    # Cat-Cat Bars
    graph_type = "grouped",
    # Scatter specific
    scatter_format_num_sample_x = "1,500.00",
    scatter_format_num_sample_y = "1,500.00",
    scatter_format_num_sample_size = "1,500.00",
    scatter_prefix_x = "",
    scatter_suffix_x = "",
    scatter_prefix_y = "",
    scatter_suffix_y = "",
    scatter_regression = FALSE,
    scatter_regression_color = '#d35400',
    scatter_regression_equation = TRUE,

    date_intervals = NULL,

    # Area specific
    area_alpha = 0.5,
    # Bubbles specific
    bubble_min = 30,
    bubble_max = 120,
    bubble_opacity = 1,
    # Pie
    pie_dataLabels_pos = 1.1,
    # Donut
    donut_dataLabels_pos = 1.1,
    donut_width = 0.2,
    # Map specific
    map_name = "world_countries",
    map_color_scale = "Numeric",
    map_bins = 5,
    map_quantile = 4,
    map_cutoff_points = NULL,
    map_radius = 5,
    map_min_size = 1,
    map_max_size = 10,
    map_stroke = FALSE,
    map_add_alaska = FALSE,
    map_graticule = FALSE,
    map_graticule_interval = 5,
    map_projection = "mercator",
    map_projection_lat = 90,
    map_projection_long = 0,
    map_projection_rotation = NULL,
    map_projection_params = 45,
    map_min_zoom = 1
  )

  dataLabelsOpts <- list(
    dataLabels_show = FALSE,
    dataLabels_format_sample = NULL,
    dataLabels_size = NULL,
    dataLabels_color = NULL,
    dataLabels_text_outline = TRUE
  )

  titleOpts <- list(
    title = NULL,
    ver_title = NULL,
    hor_title = NULL,
    subtitle = NULL,
    caption = NULL,
    legend_title = NULL
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
    dataLabels = dataLabelsOpts,
    extra = extraOpts,
    shiny = shinyOpts,
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
    dataLabels = pull_opt_group(opts_flat, "dataLabels"),
    extra = pull_opt_group(opts_flat, "extra"),
    shiny = pull_opt_group(opts_flat, "shiny"),
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

