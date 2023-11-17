# Function to summarize the residuals, coefficients, model fit from the linear regression output
lm_summ_ec <- function(model) {
  # Get residuals and design matrix from the model
  residuals <- model$residuals
  design_matrix <- model$design_matrix
  
  # Calculate the minimum, 1st quartile, median, 3rd quartile, maximum of the distribution of residuals
  residuals_summ <- c(
    "Min" = min(residuals),
    "0" = quantile(residuals, 0.25),
    "Median" = median(residuals),
    "0" = quantile(residuals, 0.75),
    "Max" = max(residuals)
  )
  
  
  # Calculate the standard error of the coefficients
  # residual sum of squares
  rss <- sum(residuals^2)
  
  # variance-covariance matrix
  var_cov <- (rss / model$df.residual) * solve(t(design_matrix) %*% design_matrix)
  
  # standard errors of coefficients
  std_error <- sqrt(diag(var_cov))
  
  # Calculate t statistic of the predictors
  t_value <- model$coefficients / std_error
  
  # Calculate p value of the t statistic of the predictors
  p_value <- pt(q = abs(t_value), df = model$df, lower.tail = FALSE)
  
  # Summarize the coefficients
  coef_summ <- cbind(model$coefficients, std_error, t_value, p_value)
  colnames(coef_summ) <- c("Estimate", "Std. Error", "t value", "p value")
  
  
  # Assess model fit
  # Calculate Residual Standard Error (RSE)
  rse <- round(sqrt(rss / model$df.residual), digits=3)
  rse_str <- paste0("Residual Standard Error: ", rse, " on ", model$df, " degrees of freedom")
  
  # Calculate multiple r-squared
  # total sum of squares
  tss <- sum((model$fitted.values - mean(model$fitted.values))^2)
  # Multiple R-squared
  mult_r_sq <- 1 - rss / tss
  mult_r_sq_str <- paste0("Multiple R-squared: ", mult_r_sq)
  
  # Calculate adjusted r-squared
  n <- nrow(design_matrix)
  k <- ncol(design_matrix) - 1
  r_sq <- 1 - (rss / sum((model$coefficients - mean(model$coefficients))^2))
  adj_r_sq <- 1 - ((1 - r_sq) * (n - 1) / (n - k - 1))
  adj_r_sq_str <- paste0("Adjusted R-squared: ", adj_r_sq)
  
  # Calculate F-statistic of the model
  df_regr <- model$rank - 1 #regression df
  df_res <- model$df.residual #residual df
  Fstat <- ((sum(model$coefficients^2) / df_regr) / (rss / df_res))
  
  # Calculate p-value for the F-statistic
  p_value_F <- pf(Fstat, df_regr, df_res, lower.tail = FALSE)
  Fstat_str <- paste0("F-statistic: ", Fstat, " on ", df_regr, " and ", df_res, " DF, p-value: ", p_value_F)
  
  # Build summary output
  summ <- list(
    Call = model$call,
    Residuals = residuals_summ,
    Coefficients = coef_summ,
    Model.Fit = paste(c(rse_str, mult_r_sq_str, adj_r_sq_str,Fstat_str), sep = "/n")
  )
  
  return(summ)
}