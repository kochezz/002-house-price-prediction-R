###########################

# Fundamentals in Predictive Modelling Assignment

###########################

# Author: William C. Phiri
# Date: 21 Apr 2025
# Pillar 1e: - Module 3 - Model Fit

#------------------------------------------

# Install PAckages

install.packages("tidyverse")
install.packages("dplyr")
install.packages("broom")
install.packages("car")
install.packages("Metrics")


# Load necessary packages
library(tidyverse)
library(dplyr)
library(broom)
library(car)
library(Metrics)


#------------------------------------------------------

# Load Saved Model

model1 <- readRDS("house_price_model.rds")

model_summary <- tidy(model1)

# Add interpretation

model_summary <- model_summary %>% 
  mutate(
    significance = if_else(p.value < 0.05, "Significant", "Not Significant"),
    interpretation = case_when(
      term == "(Intercept)" ~ "Base price when all predictors are zero",
      str_detect(term, "area") ~ "Price increase per additional sq ft of area",
      str_detect(term, "distance") ~ "Price change per km farther from metro",
      str_detect(term, "schools") ~ "Effect of each additional school nearby",
      TRUE ~ "Other"
    )
  )
  
  
# Print Results

print(model_summary)
  
# Show R-Squared values

model_stats <- glance(model1) %>% 
  dplyr::select(r.squared,adj.r.squared)


cat("\n📈 R-squared:", round(model_stats$r.squared, 3))
cat("\n📈 Adjusted R-squared:", round(model_stats$adj.r.squared, 3), "\n") 
  
  
#------------------------------------------------------

# Load Training Dataset

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/data/processed")

train_data <- read.csv("train_data.csv", header = TRUE)

#-------------------------------------------------------

# Calculate Variance Inflation Factor (VIF)

VIF <- vif(model1)

VIF_df <- as_tibble(VIF,rownames = "Predictor")
colnames(VIF_df) <- c("Predictor","VIF")

cat("📊 Variance Inflation Factor (VIF) Results:\n")
print(VIF_df)


#------------------------------------------------------

# Step 6: Identify Influential points

# Using Cooks Distance


cooks_d <- cooks.distance(model1)

# Threshold for influential observations

threshold <- 4/nrow(train_data)

# Identify influential points

influential_pts <- which(cooks_d > threshold)

# SUmmary

cat("🔍 Cook's Distance Threshold:", round(threshold, 4), "\n")
cat("📌 Influential Observations Detected:", length(influential_pts), "\n")
  

# Print Influential points

if (length(influential_pts) > 0) {
  print(influential_pts)
}

# Plot Cooks Distance

plot(cooks_d, type = "h", main = "Cooks Distance", col = "blue", ylab = "Cook's Distance")
abline(h = threshold, col = "red", lty = 2)
  

#--------------------------------------------------------


# Removal of Infleuential points to improve residual behaviour and model performance.

# We clean up the training data by removing the influential points.

influential_indices <- which(cooks_d > threshold)

train_data_cleaned <- train_data[-influential_indices,]

head(train_data_cleaned)

# Save the cleaned training data

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/data/processed")

write_csv(train_data_cleaned, "train_data_cleaned.csv")

#----------------------------------------------------------

# Re-Fit the model

model2 <- lm(price ~ area+distance+schools, data = train_data_cleaned)

# Save Model

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/models")

saveRDS(model2, file = "house_price_model2.rds")

# Model Summary

summary(model2)

# Add interpretation

model2_summary <- tidy(model2)

model2_summary <- model2_summary %>% 
  mutate(
    significance = if_else(p.value < 0.05, "Significant", "Not Significant"),
    interpretation = case_when(
      term == "(Intercept)" ~ "Base price when all predictors are zero",
      str_detect(term, "area") ~ "Price increase per additional sq ft of area",
      str_detect(term, "distance") ~ "Price change per km farther from metro",
      str_detect(term, "schools") ~ "Effect of each additional school nearby",
      TRUE ~ "Other"
    )
  )


print(model2_summary)


# Show R-Squared values

model2_stats <- glance(model2) %>% 
  dplyr::select(r.squared,adj.r.squared)


cat("\n📈 R-squared:", round(model2_stats$r.squared, 3))
cat("\n📈 Adjusted R-squared:", round(model2_stats$adj.r.squared, 3), "\n") 

#--------------------------------------------------------

# Step:7 Check for Normality of Residuals

# Residuals

residuals_lm <- residuals(model2)

# Q-Q Plot

qqnorm(residuals_lm, main = "Q-Q Plot of Residuals", pch = 19, col = "blue")
qqline(residuals_lm, col = "red", lwd = 2)


# Shapiro-Wilk Test

shapiro_result <- shapiro.test(residuals_lm)
cat("🧪 Shapiro-Wilk Test:\n")
print(shapiro_result)


#-------------------------------------------------------------

# Check for Heteroscadasticity: Residuals vs Fitted Plot


plot(model2$fitted.values, residuals_lm,
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted Values",
     pch = 19, col = "darkgreen")
abline(h = 0, col = "red", lty = 2)


#-------------------------------------------------------------


# Predict on training data

train_pred <- predict(model2, newdata = train_data_cleaned)
rmse_train <- rmse(train_data_cleaned$price, train_pred)

# Step 9.2: Predict on test set
test_pred <- predict(model2, newdata = test_data)
rmse_test <- rmse(test_data$price, test_pred)

# Output RMSE values
cat("✅ RMSE on Training Set:", round(rmse_train, 3), "\n")
cat("✅ RMSE on Testing Set :", round(rmse_test, 3), "\n")

#--------------------------------------------------------------














