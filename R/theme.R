
#' Theme Options
#'
#' @export
default_theme_opts <- function( logo = NULL,
                                logo_position = NULL,
                                palette_colors = NULL,
                                palette_colors_categorical = NULL,
                                palette_colors_sequential = NULL,
                                palette_colors_divergent = NULL,
                                palette_type = NULL,
                                branding_include = NULL,
                                branding_text = NULL,
                                background_color = NULL,
                                branding_background_color = NULL,
                                accent_color = NULL,
                                text_show = NULL,
                                text_size = NULL,
                                text_color = NULL,
                                text_family = NULL,
                                line_color = NULL,
                                line_size = NULL,
                                title_color = NULL,
                                title_align = NULL,
                                title_family = NULL,
                                title_size = NULL,
                                title_weight = NULL,
                                subtitle_color = NULL,
                                subtitle_align = NULL,
                                subtitle_size = NULL,
                                subtitle_weight = NULL,
                                caption_color = NULL,
                                caption_align = NULL,
                                caption_size = NULL,
                                table_title_color = NULL,
                                table_title_family = NULL,
                                table_title_size = NULL,
                                table_title_weight = NULL,
                                table_subtitle_color = NULL,
                                table_subtitle_family = NULL,
                                table_subtitle_size = NULL,
                                table_subtitle_weight = NULL,
                                table_caption_color = NULL,
                                table_caption_family = NULL,
                                table_caption_size = NULL,
                                table_caption_weight = NULL,
                                header_text_color = NULL,
                                header_text_family = NULL,
                                header_text_size = NULL,
                                header_text_weight = NULL,
                                cell_text_color = NULL,
                                cell_text_family = NULL,
                                cell_text_size = NULL,
                                cell_text_weight = NULL,
                                link_color = NULL,
                                header_background = NULL,
                                table_background = NULL,
                                table_border_color = NULL,
                                zebra_stripe_color = NULL,
                                desactivated_controls = NULL,
                                axis_title_color = NULL,
                                axis_title_size = NULL,
                                axis_line_color = NULL,
                                axis_line_size = NULL,
                                axis_ticks_color = NULL,
                                axis_tick_length = NULL,
                                grid_x_enabled = NULL,
                                grid_x_color = NULL,
                                grid_x_size = NULL,
                                grid_y_enabled = NULL,
                                grid_y_color = NULL,
                                grid_y_size = NULL,
                                grid_y_dash = NULL,
                                plot_margin_bottom = NULL,
                                plot_margin_top = NULL,
                                plot_margin_left = NULL,
                                plot_margin_right = NULL,
                                plot_background_color = NULL,
                                plot_border_color = NULL,
                                plot_border_size = NULL,
                                label_color = NULL,
                                label_size = NULL,
                                label_text_decoration = NULL,
                                label_text_outline = NULL,
                                marker_enabled = TRUE){

  list(
    logo = "public",
    logo_position = "right",
    logo_width = 150,
    logo_height = 50,
    logo_x_position = 350,


    palette_colors = NULL,
    palette_type = NULL,
    palette_colors_categorical = datasketch_style()$categorical,
    palette_colors_sequential = datasketch_style()$sequential,
    palette_colors_divergent = datasketch_style()$divergent,
    na_color = "#cbcdcf",

    branding_include = FALSE,
    branding_text = "",
    background_color = datasketch_style()$background,
    branding_background_color = "",

    accent_color = "#d2a045",

    # GENERAL STYLES
    text_size = 12,
    text_color = "#28333f",
    text_family = "IBM Plex Sans",
    line_color = "#bec7d0",
    line_size = 0.5,

    # TITLE STYLES
    title_color = "#28333f",
    title_align = "left", # left - center - right
    title_family = "IBM Plex Sans",
    title_size = 21,
    title_weight = 700, # too, with ligh, bold...

    # SUBTITILES STYLES
    subtitle_color = "#28333f",
    subtitle_align = "left", # left - center - right
    subtitle_size = 17,
    subtitle_weight = 700,

    # caption = "", # Needed to update chart caption when logo defined
    caption_color = "#28333f",
    caption_align = "left", # left - center - right
    caption_size = 12,
    caption_link = " ",

    # REACTABLE STYLES
    table_title_color = "#28333f",
    table_title_family = "IBM Plex Sans",
    table_title_size = 30,
    table_title_weight = "normal",
    table_subtitle_color = "#28333f",
    table_subtitle_family = "IBM Plex Sans",
    table_subtitle_size = 18,
    table_subtitle_weight = "normal",
    table_caption_color = "#28333f",
    table_caption_family = "IBM Plex Sans",
    table_caption_size = 11,
    table_caption_weight = "normal",

    header_text_color = "#ffffff",
    header_text_family = "IBM Plex Sans",
    header_text_size = 21,
    header_text_weight = "bold",
    cell_text_color = "#28333f",
    cell_text_family = "IBM Plex Sans",
    cell_text_size = 18,
    cell_text_weight = "normal",
    link_color = "#e59fd7",
    header_background = "#385573",
    table_background = "#ffffff",
    table_border_color = "#BBBDC0",
    zebra_stripe_color = "#fafafa",
    desactivated_controls = "#becacc",

    # GENERAL AXIS
    axis_title_color = NULL,
    axis_title_size = 13,
    axis_line_color = "#7e858c",
    axis_line_size = NULL,
    axis_line_x_size = 0,
    axis_line_y_size = NULL,
    axis_ticks_color = NULL,
    axis_tick_length = 10,
    labelsRotationX = NULL,
    labelsRotationY = NULL,
    grid_color = "#d1d9db",
    grid_line_type = "Dot",
    grid_size = 0.3,

    # GRID X
    grid_x_enabled = TRUE,
    grid_x_color =  "#d1d9db",
    grid_x_size = 0,
    grid_x_line_type = NULL,
    grid_x_width = 1,
    # GRID Y
    grid_y_enabled = TRUE,
    grid_y_color =  "#d1d9db",
    grid_y_size = NULL,
    grid_y_line_type = NULL,
    grid_y_width  = 1,
    y_axis_align = NULL,
    y_max = NULL,


    show_axes = FALSE, #show titles in sankey

    # SPACE THAT COVERS ALL THE GRAPHIC
    plot_margin_bottom = NULL,
    plot_margin_top = NULL,
    plot_margin_left = NULL,
    plot_margin_right = NULL,

    # SPACE INTO AXIS (PLOT AREA)
    plot_background_color = NULL,
    plot_border_color = "#d1d9db",
    plot_border_size = 0,

    # DATA LABELS STYLE
    inner_dataLabels = FALSE,


    #BAR
    bar_pointWidth = NULL,
    bar_padding = 0,
    bar_groupWidth = 0.1,
    # LEGEND STYLE
    legend_show = TRUE,
    legend_color = NULL,
    legend_family = "IBM Plex Sans",
    legend_size = 11,
    legend_layout = "horizontal",
    legend_align = 'center',
    legend_verticalAlign = 'bottom',
    legend_itemMarginTop = 0,
    legend_itemMarginBottom = 0,
    legend_reversed = FALSE,
    legend_position = "bottom",
    legend_y_position = 0,

    # Tooltip
    tooltip_family = NULL,

    # MAP STYLES
    border_weight = 2,
    border_color = "#28333f",
    topo_fill_opacity = 0.8,
    map_provider_tile = "leaflet", #leaflet or ESRI
    map_extra_layout = NULL, #other layouts (URL)
    map_name_layout = NULL,
    map_tiles = NULL,
    map_tiles_esri = "Topographic",
    map_zoom = TRUE,
    map_canvas = FALSE,
    map_options = NULL,
    map_cluster = NULL,
    map_tiles_zoom_update = TRUE,
    map_tiles_id_update = FALSE,

    # Lines and areas
    marker_enabled = TRUE,
    marker_radius = 4,
    connect_lines_nulls = FALSE,

    # plot lines
    plotLine_value_x = NULL,
    plotLine_value_y = NULL,
    plotLine_label_x = NULL,
    plotLine_label_y = NULL,

    #wordCloud
    text_weight = 900,
    wordMaxFont = 5,
    wordMinFont = 25,
    wordSpiral = 'square', #rectangular, archimedean
    placementStrategy = 'center', # random,
    wordFromRotation = 0,
    wordToRotation = 0,
    wordOrientations = 0,
    stopwords = TRUE
  )
}



#' @export
local_logo_path <- function(logo = NULL, background = "#ffffff"){
  if(is.null(logo)) return()
  #if(logo == "datasketch"){
  logo_path <- system.file("logos",package = "dsthemer")
  light_dark <- paletero::which_contrast(background)
  logo <- file.path(logo_path,paste0(logo, "/",light_dark,".png"))
  #}
  logo
}

