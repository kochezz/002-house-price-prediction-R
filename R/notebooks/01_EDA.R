###########################

# Fundamentals in Predictive Modelling Assignment

###########################

# Author: William C. Phiri
# Date: 21 Apr 2025
# Pillar 1e: - Module 3

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

#------------------------------------------------------

# BACKGROUND

# The data for modeling contains information on Selling price of each house in 
# million Rs. It also contains Carpet area in square feet, Distance from nearest 
# metro station and Number of schools within 2 km distance. The data has 198 rows 
# and 5 columns.


#--------------------------------------------------------

# Import Data

hse_price <- read.csv("House Price Data.csv", header = TRUE)


#--------------------------------------------------------

# Data structure and overview

head(hse_price)


str(hse_price)

summary(hse_price)

dim(hse_price)

any(is.na(hse_price))

#-------------------------------------------------------

# Data Cleaning

# Clean Column names make everything lower case

hse_price <- hse_price %>% 
  clean_names()

# Drop HouseID column

hse_price <- subset(hse_price, select = -houseid)

head(hse_price)
str(hse_price)
dim(hse_price)


#--------------------------------------------------------

# Splitting Data into Training (80%) and Testing (20%) Sets

# 2. Set seed for reproducibility
set.seed(123)

# 3. Create training partition (80%)
split_index <- createDataPartition(hse_price$price, p = 0.8, list = FALSE)

# 4. Split the data
train_data <- hse_price[split_index, ]
test_data  <- hse_price[-split_index, ]

dim(train_data)
dim(test_data)

#--------------------------------------------------------

# Save updated files

# Set folder for saving processed files.

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/data/processed")

# Save hse_price cleaned data set

write.csv(hse_price,"hse_price_cleaned.csv")


# Save train/test datasets

write_csv(train_data, "train_data.csv")
write_csv(test_data, "test_data.csv")

#---------------------------------------------------------






















