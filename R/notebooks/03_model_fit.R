###########################

# Fundamentals in Predictive Modelling Assignment

###########################

# Author: William C. Phiri
# Date: 21 Apr 2025
# Pillar 1e: - Module 3 - Model Fit

#------------------------------------------

# Install PAckages


install.packages("DescTools")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("GGally")
install.packages("MASS")
install.packages("caret")
install.packages("reshape2")


# Load necessary packages
library(tidyverse)
library(dplyr)
library(DescTools)
library(ggplot2)
library(car)
library(GGally)
library(MASS)
library(caret)



#------------------------------------------------------

# Load Train Data set
train_data <- read.csv("train_data.csv", header = TRUE)

head(train_data)


#--------------------------------------------------------

# Fit linear regression model


model1 <- lm(price~area + distance + schools, data = train_data)

summary(model1)

#---------------------------------------------------------

# Save Model
#setwd

setwd("C:/Users/willi/GitHub/FPM_Assingment_R/FPM_R_Assignment/models")

saveRDS(model1, file = "house_price_model.rds")



























