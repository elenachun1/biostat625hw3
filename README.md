<!-- badges: start -->
[![R-CMD-check](https://github.com/elenachun/biostat625hw3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/elenachun/biostat625hw3/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/elenachun/biostat625hw3/branch/main/graph/badge.svg)](https://app.codecov.io/gh/elenachun/biostat625hw3?branch=main)
<!-- badges: end -->

# Linear Regression package: lm
The goal of lm is to perform linear regression and understand the coefficients, residuals, and how well the model is fit to the data. Linear regression analysis uses a linear approach when modelling the relationship between the response variable and the predictor variables.

## Installation
You can install the package from GitHub with:
```
#install.packages("devtools")
devtools::install_github("elenachun1/biostat625hw3")
```

## Example using lm with mtcars data
The mtcars data has 32 rows and we will use lm to perform linear regression on the response variable mpg (miles per gallon) and predictors hp (gross horsepower), wt (weight), and disp (displacement).
```
library(lm)
data(mtcars)
lm_cars <- lm_ec(mpg ~ hp + wt + disp, data = mtcars)
lm_cars
lm_summ_ec(lm_cars)

# Output
#Call:
#lm_ec(formula = mpg ~ hp + wt + disp, data = mtcars)

#Coefficients:
#             Estimate 
#(Intercept)  37.105505
#hp           -0.031157
#wt           -3.800891
#disp         -0.000937

#$Call
#lm_ec(formula = mpg ~ hp + wt + disp, data = mtcars)

#$Residuals
#       Min      0.25%     Median      0.75%        Max 
#-3.8911127 -1.6400736 -0.1720285  1.0611572  5.8609261 

#$Coefficients
#                 Estimate Std. Error     t value      p value
#(Intercept) 37.1055052690 2.11081525 17.57875558 5.809679e-17
#hp          -0.0311565508 0.01143579 -2.72447633 5.485516e-03
#wt          -3.8008905826 1.06619064 -3.56492586 6.654956e-04
#disp        -0.0009370091 0.01034974 -0.09053451 4.642535e-01

#$Model.Fit
#[1] "Residual Standard Error: 2.639 on 28 degrees of freedom"                    
#[2] "Multiple R-squared: 0.790570527090299"                                      
#[3] "Adjusted R-squared: 0.806296706759323"                                      
#[4] "F-statistic: 66.5937065872984 on 3 and 28 DF, p-value: 7.33466649387652e-13"
```
