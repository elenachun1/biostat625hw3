test_that("lm_ec returns a list of length 9", {
  expect_length(lm_ec(y~x, data.frame(x = 1:10, y = 2 * (1:10) + rnorm(10))), 9)
})

