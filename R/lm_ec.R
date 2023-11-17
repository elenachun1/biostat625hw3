#Function to perform linear regression given formula and data
lm_ec <- function(formula, data) {
  # Get response and predictor variables from the formula
  response <- as.character(formula[[2]])
  predictors <- as.character(formula[[3]])
  
  # Create a design matrix from the given formula and data
  design_matrix <- model.matrix(formula, data)
  
  # Linear regression
  response_vec <- data[[response]]
  coefficients <- solve(t(design_matrix) %*% design_matrix) %*% t(design_matrix) %*% response_vec
  colnames(coefficients) <- "Estimate"
  
  # Build linear regression model output
  model <- list(
    call = match.call(),
    terms = formula,
    coefficients = coefficients,
    design_matrix = design_matrix,
    fitted.values = design_matrix %*% coefficients,
    residuals = response_vec - design_matrix %*% coefficients,
    rank = qr(design_matrix)$rank,
    df.residual = length(response_vec) - qr(design_matrix)$rank,
    df = nrow(data) - (ncol(design_matrix)-1) - 1
  )
  
  class(model) <- "lm"
  return(model)
}