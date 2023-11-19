test_that("lm_summ_ec returns a list of length 4", {
  expect_length(lm_summ_ec(lm_ec(y~x, data.frame(x = 1:10, y = 2 * (1:10) + rnorm(10)))), 4)
})
