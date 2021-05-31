# Function data_map_prep -----------------------------------------------------------------------------------

test_that("data_map_prep() works with geoname or geocode", {

  df <- sample_data("Gcd")
  out <- data_map_prep(data = df, ftype = "Gcd", agg= "sum", ptage_col = NULL)
  out <- out$data

  df <- sample_data("Gnm")
  out <- data_map_prep(data = df, ftype = "Gnm", agg= "sum", ptage_col = NULL)
  out <- out$data

  df <- sample_data("Gcd-Num-Num")
  out <- data_map_prep(data = df, ftype = "Gcd", agg= "sum", ptage_col = NULL)
  out <- out$data


  df <- sample_data("Gcd-Num")
  out <- data_map_prep(data = df, ftype = "Gcd-Num", agg= "sum", ptage_col = NULL)
  out <- out$data


  df <- sample_data("Gnm-Cat-Num")
  out <- data_map_prep(data = df, ftype = "Gnm", agg= "sum", ptage_col = NULL)
  out <- out$data


  df <- sample_data("Gnm-Cat-Num")
  out <- data_map_prep(data = df, ftype = "Gnm-Cat-Num", agg= "sum", ptage_col = names(df)[1])
  out <- out$data


})

test_that("data_map_prep() works with latitude and longitude", {

  df <- sample_data("Glt-Gln")
  out <- data_map_prep(data = df, ftype = "Glt-Gln", agg= "sum", ptage_col = NULL)
  out <- out$data


  df <- sample_data("Glt-Gln-Gnm")
  out <- data_map_prep(data = df, ftype = "Glt-Gln", agg= "sum", ptage_col = NULL)
  out <- out$data

  df <- sample_data("Glt-Gln-Gnm")
  out <- data_map_prep(data = df, ftype = "Glt-Gln-Gnm", agg= "sum", ptage_col = NULL)
  out <- out$data

  df <- sample_data("Glt-Gln-Num")
  out <- data_map_prep(data = df, ftype = "Glt-Gln-Num", agg= "sum", ptage_col = NULL)
  out <- out$data


  df <- sample_data("Glt-Gln-Cat-Num")
  out <- data_map_prep(data = df, ftype = "Glt-Gln-Cat", agg= "sum", ptage_col = names(df)[3])
  out <- out$data


  df <- sample_data("Glt-Gln-Cat-Num")
  out <- data_map_prep(data = df, ftype = "Glt-Gln-Cat-Num", agg= "sum", ptage_col = NULL)
  out <- out$data



  #expect_identical(out[[1]], paste0(unique(df[[1]]), collapse = ". "))
  #
  # names(df) <- c("Code", "Categorie", "Num")
  # out <- collapse_data(df, Categorie)
  # df_exp <- df %>% group_by(Categorie) %>% summarise(Code_c = paste0(Code, collapse = ". "))
  # expect_identical(out$Code, df_exp$Code_c)
})

