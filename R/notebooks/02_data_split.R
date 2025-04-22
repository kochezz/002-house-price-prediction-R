###########################

# Fundamentals in Predictive Modelling Assignment

###########################

# Author: William C. Phiri
# Date: 21 Apr 2025
# Pillar 1e: - Module 3 - Data Spilt

#------------------------------------------

# Install PAckages

install.packages("e1071")
install.packages("DescTools")
install.packages("tidyverse")
install.packages("naniar")
install.packages("dplyr")
install.packages("car")
install.packages("GGally")
install.packages("MASS")
install.packages("caret")
install.packages("reshape2")
install.packages("nortest")
install.packages("janitor")
install.packages("rsample")

# Load necessary packages
library(tidyverse)
library(naniar)
library(e1071)
library(dplyr)
library(DescTools)
library(ggplot2)
library(car)
library(GGally)
library(MASS)
library(caret)
library(reshape2)
library(nortest)
library(janitor)
library(rsample)

#------------------------------------------------------

# Load Data set
hse_price_cleaned <- read.csv("hse_price_cleaned.csv", header = TRUE)

head(hse_price_cleaned)



#--------------------------------------------------------

# Splitting Data into Training (80%) and Testing (20%) Sets

# 2. Set seed for reproducibility
set.seed(42)

# 3. We will use the rsample to split the data so that we can try and align 
# with the python split as closley as possible.

split_obj <- initial_split(hse_price_cleaned, prop = 0.8)


# Extract train and test sets.

train_data <- training(split_obj)
test_data <- testing(split_obj)

# Print dimensions to confirm match

cat("✅ Train rows:", nrow(train_data), "\n")
cat("✅ Test rows :", nrow(test_data), "\n")

# Save data sets.

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/data/processed")

write_csv(train_data, "train_data.csv")
write_csv(test_data, "test_data.csv")

#--------------------------------------------------------




























