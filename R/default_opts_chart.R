


default_opts_chart <- function(){
  list(
    axis_text_angle = NA,
    inverted_axes = FALSE, # Transpose axes, flip_coord
    #invert_axis = ??? upside-down axis? o right to left?
    reversed_yaxis = FALSE,
    #label_ratio = 1 # Nudge from point label
    highlight_value = NULL,
    highlight_value_color = "#50c5b7",
    tooltip_template = "",
    animation_duration = 0,
    #item plot
    # minItemRscale = 10,
    # maxItemRscale = 1000,
    legend_decreasing=FALSE
  )
}
