# Linear Regression package: lm
The goal of lm is to perform linear regression and understand the coefficients, residuals, and how well the model is fit to the data.

## Installation
You can install the package from GitHub with:
```
#install.packages("devtools")
devtools::install_github("elenachun1/biostat625hw3")
```

## Example using lm with mtcars data
The mtcars data has 32 rows and we will use lm to perform linear regression on the response variable mpg (miles per gallon) and predictors hp (gross horsepower), wt (weight), and displ (displacement).
```
library(lm)
data(mtcars)
lm_cars <- lm_ec(mpg ~ hp + wt + displ, data = mtcars)
lm_cars
lm_summ_ec(lm_cars)
```
