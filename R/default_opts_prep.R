
default_opts_prep <- function(){
  list(
    drop_na = FALSE,
    drop_na_legend = FALSE,
    na_label = "(NA)",
    agg_data = TRUE,
    agg = "sum",
    agg_text = NULL, # Ex. Text for aggregation sum_agg_text
    # can be a vector for all numeric vars
    collapse_rows = FALSE,
    agg_collapse_rows = "sum",
    sort = "no",
    slice_n = NULL,
    order = NULL,
    order_legend = NULL,
    order_stacked = NULL,
    percentage = FALSE,
    percentage_col = NULL,
    percentage_intra = FALSE,
    color_by = NULL,# which variable?
    format_sample_cat = NULL, #"Title case",
    format_sample_dat = NULL,
    format_sample_num = "1,500.00",
    si_prefix = FALSE, # sistema internacional M, K, B etc
    datalabel_formmater_js = FALSE,
    #format_numeric_symbols = FALSE, # Qué es?
    label_wrap_legend = 12,
    label_wrap = 12,
    locale = "en-US",
    prefix_num = "",
    suffix_num = "",
    formatter_js = NULL,
    formatter_x_js = NULL
  )
}
