
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


#' @export
default_theme_opts <- function(){

  list(
    logo = "datasketch",
    logo_position = "right",

    palette_colors = datasketch_style()$palette,
    branding_include = FALSE,
    branding_text = "",
    background_color = datasketch_style()$background,
    branding_background_color = "",
    accent_color = "#d2a045",

    # GENERAL STYLES
    text_show = TRUE,
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
    axis_title_color = '#5A6B72',
    axis_title_size = 13,
    axis_line_color = '#DDDDF9',
    axis_line_width = 1,
    axis_ticks_color = '#DDDDF9',
    axis_tick_length = 10,

    # GRID X
    grid_x_enabled = TRUE,
    grid_x_color =  "#fafafa",
    grid_x_width = 0,

    # GRID Y
    grid_y_enabled = TRUE,
    grid_y_color =  "#DDDDF9",
    grid_y_width = 1,
    grid_y_dash = "dot",



    # SPACE THAT COVERS ALL THE GRAPHIC
    plot_margin_bottom = NULL,
    plot_margin_top = NULL,
    plot_margin_left = NULL,
    plot_margin_right = NULL,

    # SPACE INTO AXIS (PLOT AREA)
    plot_background_color = NULL,
    plot_border_color = "#CCCCCC",
    plot_border_width = 0,

    # DATA LABELS STYLE

    label_color = "contrast",
    label_size = 11,
    label_text_decoration = NULL,
    label_text_outline = "1px contrast"

  )
}
