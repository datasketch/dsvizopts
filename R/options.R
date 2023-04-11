
#' Chart Options
#'
#' @description
#' This page describes the chart options arguments
#'
#' The `tableOpts` options are used to style tables from the `reactable` package
#' and their descriptions have been copied and slightly adapted from their Github
#' [documentation](https://glin.github.io/reactable/reference/reactable.html).
#'
#' @export
#' @param title String with the main title (on top). Default is NULL
#' @param subtitle String for subtitle (below the title). Default is NULL
#' @param caption String for caption (bottom). Default is NULL
#' @param hor_title String with horizontal axis title. Default is NULL
#' @param ver_title String with vertical axis title . Default is NULLL
#' @param legend_title String with the main title to legend. Default is NULL
#' @param palette_colors An optional character vector specifying the colors
#' @param palette_type  String with type of color palette (optional). Options:
#'  "categorical", "sequential" and "divergent" palettes, more info in  <[`palette-types`][dsvizopts_palette_type]>
#' @param color_by A character with the name of the variable by which you want to color the graph. Default is NULL
#' @param drop_na Boolean. If TRUE drop missing values
#' @param na_label String with label that should be used to recode missing values. Default is "(NA)"
#' @param drop_na_legend Boolean. If TRUE drop missing values in legend
#' @param agg Aggregation type to compute summary statistics of data. Options: "sum", "mean", "median". Default is "sum"
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
#' @param datalabel_formmater_js A specifier to format numerical value(s)  - catcatnum - treemap, e.g.12K, 12M
#' @param locale Locale to use, e.g. "fr-FR" for french.
#' @param label_wrap Is this a numeric vector of length one or just an integer to choose the number of characters of the label text (overflowing text will be placed in a new line below).
#' @param label_wrap_legendIs this a numeric vector of length one or just an integer to choose the number of characters in each line of text in the legend (overflowing text will be placed in a new line below.)
#' @param spline Boolean. If TRUE, the segments between the data points are smoothed.
#' @param suffix Character string to append before formatted value.
#' @param prefix Character string to append after formatted value.
#' @param orientation A character vector of length one, where the chart can be displayed vertically ("ver") or horizontally ("hor").
#' @param graph_type A character vector of length one with graph type. Options: "grouped" (show individual values) or "stacked" (stack the values of each series on top of each other). Default is "grouped".
#' @param highlight_value A character vector with the categories you want to highlight. Default is NULL
#' @param highlight_value_color A character vector of length one with the color to highlight categories select in highlight_value
#' @param tooltip HTML with information that appears when hovering your pointer over the graph. Variables are enclosed by curly brackets.
#' @param groupBy Character vector of column names to group by.
#' @param sortable Enable sorting? Default is TRUE.
#' @param resizable Enable column resizing? Default is FALSE.
#' @param filterable Enable column filtering? Default is FALSE.
#' @param searchable Enable global table searching? Default is FALSE.
#' @param selection Enable row selection? Either "multiple" or "single" for multiple or single row selection. Default is NULL.
#' @param showSortIcon Show a sort icon when sorting columns? Default is TRUE.
#' @param showSortable Show an indicator on sortable columns? Default is TRUE.
#' @param height Height of the table in pixels. Default is "auto" for automatic sizing.
#' @param width Width of the table in pixels. Default is "auto" for automatic sizing.
#' @param fullWidth Stretch the table to fill the full width of its container? Default is TRUE.
#' @param wrap Enable text wrapping? Default is TRUE.
#' @param outlined Add borders around the table? Default is FALSE.
#' @param bordered Add borders around the table and every cell? Default is FALSE.
#' @param borderless Remove inner borders from table? Default is TRUE.
#' @param striped Add zebra-striping to table rows? Default is TRUE.
#' @param compact Make tables more compact? Default is FALSE.
#' @param highlight Highlight table rows on hover? Default is FALSE.
#' @param pagination Enable pagination? Default is TRUE.
#' @param showPagination Show pagination? Default is NULL (defaults to TRUE if the table has more than one page).
#' @param showPageInfo Show page info? Default is TRUE.
#' @param showPageSizeOptions Show page size options? Default is FALSE.
#' @param paginationType Pagination control to use. Either "numbers" for page number buttons (the default),
#' "jump" for a page jump, or "simple" to show 'Previous' and 'Next' buttons only.
#' @param defaultPageSize Default page size for the table. Default is 10.
#' @param pageSizeOptions Page size options for the table. Default is 10, 25, 50, 100.
#' @param linksAsHyperlinks Cells that start with http, https or www will be converted to hyperlinks. Default is TRUE.
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
#' @param legend_decreasing Leaflet legend, If True decreasing order
#' @param opts All of the previous options can be passed as list of options opts
#' @name chart_viz_options
#'
dsviz_default_opts <- function(...){

  # opts$agg_text<- opts$agg_text %||% opts$agg
  # opts$palette_colors <- opts$palette_colors %||% opts$theme$palette_colors
  # opts$background_color <- opts$background_color %||% opts$theme$background_color
  # opts

  list(
    area = default_opts_area(),
    bar = default_opts_bar(),
    bubbles = default_opts_bubbles(),
    chart = default_opts_chart(),
    data_labels = default_opts_data_labels(),
    donut = default_opts_donut(),
    line = default_opts_line(),
    map = default_opts_map(),
    pie = default_opts_pie(),
    prep = default_opts_prep(),
    scatter = default_opts_scatter(),
    sankey = default_opts_sankey(),
    shiny = default_opts_shiny(),
    table = default_opts_table(),
    titles = default_opts_titles(),
    treemap = default_opts_treemap(),
    theme =  default_opts_theme()
  )
}


#' @export
dsviz_defaults <- function(flat = FALSE){
  opts <- dsviz_default_opts()
  if(flat) return(options_flatten(opts))
  opts
}


