# Econometrics-Regression-Diagnostics-and-Model-Specification
## Overview

This project examines the determinants of inflation using multiple regression analysis. The analysis investigates the relationship between inflation and key macroeconomic variables, including unemployment, the federal funds rate, and money supply growth.
An Ordinary Least Squares (OLS) regression model was estimated and subsequently evaluated using a range of diagnostic tests. The project also applies Newey-West robust standard errors to address potential violations of classical regression assumptions.

## Research Objective

The objectives of this project were to:

- Examine the determinants of inflation using macroeconomic variables.
- Estimate an Ordinary Least Squares (OLS) regression model.
- Assess potential model specification problems.
- Test for heteroscedasticity.
- Test for autocorrelation.
- Examine multicollinearity.
- Assess residual normality.
- Identify influential observations and leverage points.
- Apply robust inference using Newey-West standard errors.

## Project Structure

```text
Project 2/
│
├── Analysis/
│   └── Project analysis script, report, and diagnostic plots
│
├── data/
│   ├── CPIAUCSL.csv
│   ├── UNRATE.csv
│   ├── FEDFUNDS.csv
│   └── M2SL.csv
│
└── eviews_outputs/
    └── Regression and diagnostic output figures
```
## Data

The project uses four macroeconomic datasets:

- CPIAUCSL.csv — Consumer Price Index data.
- UNRATE.csv — Unemployment rate data.
- FEDFUNDS.csv — Federal Funds Rate data.
- M2SL.csv — M2 Money Stock data.

The datasets were merged using their common observation date.

## Variable Creation

The analysis created the following variables:

- Inflation rate — calculated from changes in the Consumer Price Index.
- M2 growth rate — calculated from changes in the M2 Money Stock.

The final regression dataset includes:

- Inflation
- Unemployment rate
- Federal Funds Rate
- M2 growth rate

## Analysis

The project was conducted using the following steps:

- Import and inspect the datasets.
- Merge the datasets using the observation date.
- Create the monthly inflation rate.
- Create the monthly M2 growth rate.
- Prepare the final regression dataset.
- Estimate an OLS regression model.
- Conduct regression diagnostic tests.
- Examine residual normality.
- Apply Newey-West robust standard errors.
- Generate diagnostic plots.

## Regression Model

The OLS regression model examines inflation as a function of:

- Unemployment rate
- Federal Funds Rate
- M2 growth rate

The model was estimated using Ordinary Least Squares (OLS).

## Diagnostic Tests

The regression model was evaluated using several diagnostic procedures.

- Model Specification
- Ramsey RESET test
- Heteroscedasticity
- Breusch-Pagan test
- White test
- Autocorrelation
- Durbin-Watson test
- Breusch-Godfrey test
- Multicollinearity
- Variance Inflation Factor (VIF)
- Influential Observations
- Cook's Distance
- Leverage values
- Residual Normality
- Jarque-Bera test
- Robust Inference

Newey-West robust standard errors were calculated to provide inference that is robust to potential heteroscedasticity and autocorrelation.

## Diagnostic Plots

The project includes diagnostic visualizations for:

- Residuals versus fitted values
- Autocorrelation Function (ACF)
- Partial Autocorrelation Function (PACF)
- Cook's Distance

Additional regression and diagnostic outputs are available in the eviews_outputs/ folder.

## Software

The project was developed using:

R for data preparation, regression analysis, diagnostic testing, and robust inference.
EViews for regression and diagnostic outputs.

The R analysis uses the following packages:

- dplyr
- lmtest
- skedastic
- car
- tseries
- sandwich

## Reproducibility

The R script imports the datasets using relative file paths from the project's data/ folder.

The data, analysis files, diagnostic plots, and EViews outputs are organized within the project to support review and reproducibility.

## Author

Nafia Siddiqui
