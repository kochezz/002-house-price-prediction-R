
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
  
## 📋 Objectives / Questions Addressed

1. **Data Import & Structure Check**
2. **Train-Test Split (80/20)**
3. **Model Building using Multiple Linear Regression**
4. **Variable Significance & Interpretation**
5. **R² and Adjusted R² Evaluation**
6. **Multicollinearity Check (VIF)**
7. **Influential Observations**
8. **Normality of Errors**
9. **Heteroscedasticity Check**
10. **RMSE Calculation for Training & Testing Sets**

---  

The dataset contains **198 observations** and 5 variables.

The Project aims to;
- Predict house prices in millions of Rs
- Build an interactive dashboard using `Shiny`
- Model trained using `Stats Package` lm()
- Built with reproducibility and scalability in mind
  
The dataset contains **198 observations** and 5 variables.

---

## 📂 Repository Structure

```
├── data/
│   ├── raw/                       # Original dataset
│   ├── processed/                 # Cleaned and split datasets
├── models/                        # Saved R model (RDS format)
├── R/
│   ├── scripts/                   # R scripts by step
│   └── reports/                   # Report outputs
├── dashboards/                    # (future) Shiny app files
└── house_price_model_report.pdf  # Final analysis report (PDF)
```

---

## 📊 Final Model Summary

- **Model Type:** Multiple Linear Regression
- **R²:** 0.847
- **Adjusted R²:** 0.843
- **Train RMSE:** 1.699
- **Test RMSE:** 2.242

**Significant Predictors:**  
✅ `carpet_area`  
✅ `distance_from_metro`  
✅ `number_of_schools`

---

## 🔍 Diagnostics Summary

| Check                   | Result                         |
|------------------------|--------------------------------|
| Multicollinearity      | No (VIF < 5 for all vars)      |
| Influential Points     | 17 removed (Cook’s Distance)   |
| Normality of Residuals | Slight deviation (p = 0.011)   |
| Homoscedasticity       | ✅ Verified via residual plots  |

---

## 🚀 Next Steps

- Develop a **Shiny dashboard** for real-time predictions
- Deploy the model via **RStudio Connect** or **ShinyApps.io**
- Add interactive CSV upload for bulk predictions

---

## 📬 Contact

Developed by **Business Enterprise Data Architecture (BEDA)**  
📩 Email: [wphiri@beda.ie](mailto:wphiri@beda.ie)  
🔗 LinkedIn: [William Phiri](https://www.linkedin.com/in/william-phiri-866b8443/)  
🧭  _"Get it done the BEDA way"_

---

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.
