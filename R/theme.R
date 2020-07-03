
#' Theme Options
#'
#' @param logo Logo path or url
#' @param logo_position Logo "left" or "right"
#' @param palette_colors Vector of colors
#' @param branding_include Include branding logical
#' @param branding_text Text for branding bar
#' @param background_color Plot background color
#' @param branding_background_color Branding bar background color
#' @param accent_color ?
#' @param text_show ?
#' @param text_size Size of text in pt
#' @param text_color Text color
#' @param text_family Font
#' @param line_color Axis and grid line colors
#' @param line_size Line size
#' @param title_color Color for title text
#' @param title_align Alignment of title "left", "center" or "right"
#' @param title_family Title font
#' @param title_size Title size, defaults to 1.1 text_size
#' @param title_weight Font weight for title
#' @param subtitle_color Color for subtitle text
#' @param subtitle_align Alignment of subtitle "left", "center" or "right"
#' @param subtitle_size Subtitle size, defaults to 1.1 text_size
#' @param subtitle_weight Font weight for subtitle
#' @param caption_color Color for caption text
#' @param caption_align Alignment of caption "left", "center" or "right"
#' @param caption_size caption size, defaults to 1.1 text_size
#' @param axis_title_color Color for axis text
#' @param axis_title_size Axis text size
#' @param axis_line_color Axis line color
#' @param axis_line_size Axis line width
#' @param axis_ticks_color Axis ticks color
#' @param axis_tick_length Axis tick length
#' @param grid_x_enabled Enable horizontal grid
#' @param grid_x_color Horizontal grid color
#' @param grid_x_size Horizontal grid line width
#' @param grid_y_enabled Enable vertical grid
#' @param grid_y_color Vertical grid color
#' @param grid_y_size Verical grid line width
#' @param grid_y_dash ?
#' @param plot_margin_bottom Plot margin bottom
#' @param plot_margin_top Plot margin top
#' @param plot_margin_left Plot margin left
#' @param plot_margin_right Plot margin right
#' @param plot_background_color ? Chart background color
#' @param plot_border_color ? Chart border color
#' @param plot_border_size ? Chart border width
#' @param label_color ? Text color
#' @param label_size ? Text size
#' @param label_text_decoration ? Text decoration
#' @param label_text_outline ? Text outline
#' @export
default_theme_opts <- function( logo = NULL,
                                logo_position = NULL,
                                palette_colors = NULL,
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
                                label_text_outline = NULL){

  list(
    logo = "datasketch",
    logo_position = "right",
    logo_width = 180,
    logo_height = 60,

    palette_colors = datasketch_style()$palette,
    na_color = "#cbcdcf",

    branding_include = FALSE,
    branding_text = "",
    background_color = datasketch_style()$background,
    branding_background_color = "",

    accent_color = "#d2a045",

    # GENERAL STYLES
    text_size = 11,
    text_color = "#6D8089",
    text_family = "Ubuntu",
    line_color = "#DDDDF9",
    line_size = 1,

    # TITLE STYLES
    title_color = "#444444",
    title_align = "left", # left - center - right
    title_family = "Montserrat",
    title_size = 21,
    title_weight = 700, # too, with ligh, bold...

    # SUBTITILES STYLES
    subtitle_color = "#999999",
    subtitle_align = "left", # left - center - right
    subtitle_size = 17,
    subtitle_weight = 700,


    # caption = "", # Needed to update chart caption when logo defined
    caption_color = "#AAAAAA",
    caption_align = "right", # left - center - right
    caption_size = 17,


    # GENERAL AXIS
    axis_title_color = NULL,
    axis_title_size = 13,
    axis_line_color = NULL,
    axis_line_size = NULL,
    axis_line_x_size = NULL,
    axis_line_y_size = NULL,
    axis_ticks_color = NULL,
    axis_tick_length = 10,

    grid_color = "#CCCCCC",
    grid_line_type = "solid",
    grid_size = 0.5,

    # GRID X
    grid_x_enabled = TRUE,
    grid_x_color =  NULL,
    grid_x_size = NULL,
    grid_x_line_type = NULL,
    grid_x_width = 1,
    # GRID Y
    grid_y_enabled = TRUE,
    grid_y_color =  NULL,
    grid_y_size = NULL,
    grid_y_line_type = NULL,
    grid_y_width  = 1,


    # SPACE THAT COVERS ALL THE GRAPHIC
    plot_margin_bottom = NULL,
    plot_margin_top = NULL,
    plot_margin_left = NULL,
    plot_margin_right = NULL,

    # SPACE INTO AXIS (PLOT AREA)
    plot_background_color = NULL,
    plot_border_color = "#CCCCCC",
    plot_border_size = 0,

    # DATA LABELS STYLE
    inner_dataLabels = FALSE,


    # LEGEND STYLE
    legend_show = TRUE,
    legend_color = NULL,
    legend_family = "Montserrat",
    legend_size = 11,
    legend_layout = "horizontal",
    legend_align = 'center',
    legend_verticalAlign = 'bottom',
    legend_itemMarginTop = 0,
    legend_itemMarginBottom = 0,
    legend_reversed = FALSE,
    legend_position = "topright",

    # MAP STYLES
    border_weight = 2,
    border_color = "#293845",
    topo_fill_opacity = 0.8,
    map_tiles = NULL,
    map_zoom = TRUE

  )
}



#' @export
local_logo_path <- function(logo = NULL, background = "#ffffff"){
  if(is.null(logo)) return()
  if(logo == "datasketch"){
    logo_path <- system.file("logo",package = "dsvizopts")
    light_dark <- paletero::which_contrast(background)
    logo <- file.path(logo_path,paste0("ds-logo-",light_dark,".png"))
  }
  logo
}

