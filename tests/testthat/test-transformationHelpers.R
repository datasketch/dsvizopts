test_that("Vertical Orientation labels", {
  axis_names <- orientationXY(orientation = "ver", x = "transport", y = "units", hor = "Transport classification", ver = "Total units")
  expect_equal(axis_names, c("Transport classification", "Total units"))
})

test_that("Horizontal Orientarion labels", {
  axis_names <- orientationXY(orientation = "hor", x = "transport", y = "units", hor = "Transport classification", ver = "Total units")
  expect_equal(axis_names, c("Total units", "Transport classification"))
})
