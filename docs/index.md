
---
layout: default
title: House Price Prediction (R)
---

<p align="center">
  <img src="./BEDA_logo3.png" alt="BEDA Logo" width="280"/>
  <h2 align="center"><i>Get it done the BEDA way</i></h2>
</p>

---

### 🔗 Navigation  
[🏠 Home](./index.md) | [📈 R Project](https://kochezz.github.io/002-house-price-prediction-R/) | [📊 Python Project](https://kochezz.github.io/001-house-price-prediction-python/) | [📧 Contact](mailto:wphiri@beda.ie)

---

# 🏡 House Price Prediction using Multiple Linear Regression (R)

[![R](https://img.shields.io/badge/Built%20With-R-blue?logo=r)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status](https://img.shields.io/badge/Status-Complete-brightgreen.svg)]()
[![Data](https://img.shields.io/badge/Data-Cleaned-lightgrey)]()

---

## 📘 Project Overview

This project builds a **Multiple Linear Regression** model in **R** to predict the **selling price** of houses based on:

- Carpet area (in square feet)
- Distance from the nearest metro station (in km)
- Number of schools within 2 km

---

## 📂 Repository Structure

```
002-house-price-prediction-R/
├── data/
│   ├── raw/
│   └── processed/
├── models/
├── R/
│   └── scripts/
├── reports/
├── dashboards/
├── environment/
└── README.md
```

---

## 📊 Model Summary

- **R²:** 0.794
- **Adjusted R²:** 0.791
- **Train RMSE:** 1.699
- **Test RMSE:** 2.242

**All three predictors (`area`, `distance`, `schools`) were statistically significant.**

---

## 🔍 Diagnostics Summary

| Check                   | Result                         |
|------------------------|--------------------------------|
| Multicollinearity      | No (VIF < 5 for all variables) |
| Influential Points     | 19 removed (Cook’s Distance)   |
| Normality of Residuals | Slight deviation (p = 0.011)   |
| Homoscedasticity       | ✅ Verified via residual plots  |

---

## 🧪 Notes

The R version of the model had slightly different characteristics from Python due to:
- Different influential point removal count
- `set.seed()` and `createDataPartition()` variation in splitting
- `schools` remained statistically significant in R

---

## 📬 Contact

Business Enterprise Data Architecture (BEDA)  
📩 [wphiri@beda.ie](mailto:wphiri@beda.ie)  
🔗 [LinkedIn – William Phiri](https://www.linkedin.com/in/william-phiri-866b8443/)

---


---

### 📉 Model Diagnostics Plots

**Residuals vs Fitted**
![Residual Plot](./residual_plot.png)

**Cook’s Distance Plot**
![Cook's Distance](./cooks_distance.png)

**Normal Q-Q Plot**
![Normal Q-Q](./qq_plot.png)

Upload these plot images into your `docs/` folder to make them appear here on your live GitHub Pages site.
