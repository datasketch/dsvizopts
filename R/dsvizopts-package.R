#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL



#' Palette type options
#'
#' @description
#' This page describes the characteristics of the color palettes available by default
#'
#' @param categorical Palette that assigns a color to each category without a particular order.
#'  When choosing categorical palettes it is important that the colors do not convey a certain order or hierarchy of
#'  the categories and that the colors are clearly distinguishable from each other.
#' @param sequential Palette that assigns sequential colors to numerical values. This type of palette is recommended
#'  for numerical values (such as economic or population indices) or ordered categories
#'  (such as years or days of the week) to convey the importance of minimum and maximum values.
#' @param divergent Palette that assigns divergent colors to numerical values. This type of palette contains
#'  a color scale with two different colors at each end and a third color in the middle to express neutrality. Recommended for continuous
#'  variables with a central reference value around which the more extreme values of the data are compared (such as satisfaction levels in a survey).
#'  The colors assigned to the extremes of the data should highlight the respective difference to the reference value, which is assigned a neutral
#'  color between the two more striking colors assigned to the extremes.
#' @keywords internal
#' @name dsvizopts_palette_type
NULL

#' Theme options
#' @description
#'
#' @param logo Logo path or url
#' @param logo_position Logo "left" or "right"
#' @param palette_colors Vector of colors
#' @param palette_colors_categorical Vector of colors suitable for categorical variable
#' @param palette_colors_sequential Vector of sequential colors suitable for numerical variable
#' @param palette_colors_divergent Vector of divergent colors suitable for numerical variable
#' @param palette_type Type of color palette "categorical", "sequential", or "divergent"
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
#' @keywords internal
#' @name dsvizopts_theme
NULL

