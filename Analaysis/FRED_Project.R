# ================================
# PROJECT 2: DETERMINANTS OF INFLATION
# ================================

# Load required packages
library(dplyr)
library(lmtest)
library(skedastic)
library(car)
library(tseries)
library(sandwich)

# ================================
# DATA IMPORT
# ================================

cpi <- read.csv("data/CPIAUCSL.csv")
unemploymentrate <- read.csv("data/UNRATE.csv")
fedfunds <- read.csv("data/FEDFUNDS.csv")
m2 <- read.csv("data/M2SL.csv")
str(cpi)
str(unemploymentrate)
str(fedfunds)
str(m2)
summary(cpi)
summary(unemploymentrate)
summary(fedfunds)
summary(m2)
# ================================
# MERGE DATASETS
# ================================

data <- merge(cpi, unemploymentrate, by = "observation_date")

data <- merge(data, fedfunds, by = "observation_date")

data <- merge(data, m2, by = "observation_date")

summary(data)
# ================================
# VARIABLE CREATION
# ================================

# Create monthly inflation rate
data$inflation <- (data$CPIAUCSL / dplyr::lag(data$CPIAUCSL) - 1) * 100

# Create monthly M2 growth rate
data$m2_growth <- (data$M2SL / dplyr::lag(data$M2SL) - 1) * 100

# Check the transformed variables
summary(data$inflation)
summary(data$m2_growth)
# ================================
# FINAL REGRESSION DATASET
# ================================

model_data <- na.omit(data[c("inflation", "UNRATE", "FEDFUNDS", "m2_growth")])
summary(model_data)
# ================================
# OLS REGRESSION
# ================================

model_ols <- lm(inflation ~ UNRATE + FEDFUNDS + m2_growth,data = model_data)
summary(model_ols)
# ================================
# DIAGNOSTIC TESTS
# ================================

# Ramsey RESET test
resettest(model_ols)
# Breusch-Pagan test
bptest(model_ols)

# White test
white(model_ols)

# Durbin-Watson test
dwtest(model_ols)

# Breusch-Godfrey test
bgtest(model_ols)

# Variance Inflation Factor
vif(model_ols)

# Cook's Distance
cooks.distance(model_ols)

# Maximum Cook's Distance
max(cooks.distance(model_ols))

# Observation with maximum Cook's Distance
which.max(cooks.distance(model_ols))

# Leverage (hat values)
hatvalues(model_ols)

# Maximum leverage value
max(hatvalues(model_ols))

# ================================
# RESIDUAL NORMALITY
# ================================

jarque.bera.test(residuals(model_ols))

# ================================
# NEWEY-WEST ROBUST STANDARD ERRORS
# ================================

nw_results <- coeftest(model_ols, vcov. = NeweyWest(model_ols))
nw_results

# ================================
# DIAGNOSTIC PLOTS
# ================================

# Residuals vs Fitted Values
plot(model_ols, which = 1)

# Autocorrelation Function (ACF)
acf(residuals(model_ols))

# Partial Autocorrelation Function (PACF)
pacf(residuals(model_ols))

# Cook's Distance
plot(model_ols, which = 4)
