
#' Chart Options
#'
#' @description
#' This page describes the chart options arguments
#' @export
#' @param title String with the main title (on top). Default is NULL
#' @param subtitle String for subtitle (below the title). Default is NULL
#' @param caption String for caption (bottom). Default is NULL
#' @param hor_title String. The main title (on top). Default is NULL
#' @param ver_title String. The main title (on top). Default is NULL
#' @param legend_title String. The main title (on top). Default is NULL
#' @param palette_colors An optional character vector specifying the colors
#' @param palette_type  String with type of color palette (optional). You can choose into
#'  "categorical", "sequential" and "divergent" palettes, more info in  <[`palette-types`][dsvizopts_palette_type]>
#' @param color_by A character with the name of the variable by which you want to color the graph. Default is NULL
#' @param drop_na Boolean. If TRUE drop missing values
#' @param na_label String with label that should be used to recode missing values. Default is "(NA)"
#' @param drop_na_legend Boolean. If TRUE drop missing values in legend
#' @param agg Compute summary statistics of data, the default aggregation is "sum" but "mean" and "median" are available
#' @param agg_text When there is aggregation agg_text is prepended to grouped variable
#' @param sort String. Order the bars by the values of the graphed category. Options: "without", "desc" (sort a variable in descending order), "asc" (sort a variable in ascending order). Default is "without.
#' @param slice_n Numeric value, It allows you to select and remove unique rows
#' @param order A character vector of variables to sort categories on the axes in the respective order.
#' @param order_legend A character vector of variables to sort categories on the legend in the respective order.
#' @param percentage Boolean. If TRUE, calculates the percentage according to the variable chosen in "percetage_col", by default it chooses the first column of the entered dataframe.
#' @param percentage_col A character with the name of the variable for which you want the percentage to be calculated.
#' @param format_sample_cat A specifier to format categories, e.g. "TITTLE", "lowercase", "Title Case"
#' @param format_sample_num A specifier to format numerical value(s), e.g. "1,234.56" or "1'234.5678"
#' @param format_sample_dat A specifier to format date(s), e.g. "28/04/2020" or "February 28th 2020"
#' @param locale Locale to use, e.g. "fr-FR" for french.
#' @param label_wrap A numeric vector of length one to choose the number of characters of the label text (overflowing text will be placed in a new line below).
#' @param label_wrap_legend A numeric vector of length one to choose the number of characters in each line of text in the legend (overflowing text will be placed in a new line below.)
#' @param spline Boolean. If TRUE, the segments between the data points are smoothed.
#' @param suffix Character string to append before formatted value.
#' @param prefix Character string to append after formatted value.
#' @param orientation A character vector of length one, where the chart can be displayed vertically ("ver") or horizontally ("hor").
#' @param graph_type A character vector of length one with graph type. Options: "grouped" (show individual values) or "stacked" (stack the values of each series on top of each other). Default is "grouped".
#' @param highlight_value A character vector with the categories you want to highlight. Default is NULL
#' @param highlight_value_color A character vector of length one with the color to highlight categories select in highlight_value
#' @param tooltip HTML with information that appears when hovering your pointer over the graph. Variables are enclosed by curly brackets.
#' @param allow_point Boolean. If TRUE, allow this series' points to be selected by clicking on the graphic. Default is FALSE.
#' @param color_click String with color to change the color of the series that was clicked.
#' @param color_hover String with color to change the color of the series over which the mouse hovered.
#' @param cursor You can set the cursor to "pointer" if you have click events attached to the series, to signal to the user that the points and lines can be clicked.
#' @param clickFunction String with JS function to indicate the values to be captured when clicking on the chart.
#' @param dataLabels_show Boolean. If TRUE it shows the values of the chart labels
#' @param dataLabels_format_sample String. A specifier to format label(s)
#' @param dataLabels_size Number. Label font size
#' @param dataLabels_color String with hexadecimal color for the label
#' @param dataLabels_text_outline Boolean. If TRUE, data labels are show with outline
#' @param opts All of the previous options can be passed as list of options opts
#' @name chart_viz_options
#'
dsviz_default_opts <- function(...){

  # opts$agg_text<- opts$agg_text %||% opts$agg
  # opts$palette_colors <- opts$palette_colors %||% opts$theme$palette_colors
  # opts$background_color <- opts$background_color %||% opts$theme$background_color
  # opts
  titleOpts <- list(
    title = NULL,
    ver_title = NULL,
    hor_title = NULL,
    subtitle = NULL,
    caption = NULL,
    legend_title = NULL
  )

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
    label_wrap_legend = 12,
    label_ratio = 1
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
    animation_duration = 0,
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
    map_label_by = "name",
    map_bins = 5,
    map_bins_pretty = FALSE,
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
    map_projection_rotation = 0,
    map_projection_params = 45,
    map_min_zoom = 1,

    #treemap
    treemap_layout = "squarified", # one of: stripes, squarified, strip, slice and dice (NULL)
    treemap_direction = "vertical" # horizontal
  )

  dataLabelsOpts <- list(
    dataLabels_show = FALSE,
    dataLabels_format_sample = NULL,
    dataLabels_type = NULL,
    dataLabels_size = NULL,
    dataLabels_color = NULL,
    dataLabels_text_outline = TRUE
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
  group_names <- purrr::map(defaults, names)
  if(!group %in% names(defaults))
    stop("Option group not found, must be one of: ",
         paste0(names(group_names), collapse = ", "))
  group_opts <- group_names[[group]]
  pulled_opts <- opts[group_opts]
  names(pulled_opts) <- group_opts
  pulled_opts
}


is_flat_list <- function(x) all(purrr::map_lgl(x, ~!is.list(.)))

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

