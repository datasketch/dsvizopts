

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
    table = pull_opt_group(opts_flat, "table"),
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




