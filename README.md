# 📊 Stress Level Analysis & Prediction

## 📌 Overview
This project analyzes the factors contributing to stress using statistical modeling and hypothesis testing techniques. The goal is to both predict stress levels and identify key lifestyle factors influencing stress.


## 📊 Dataset
- Stress Level Prediction Dataset (Kaggle)
- Includes:
  - Age, Gender
  - Sleep Duration & Quality
  - Physical Activity
  - Screen Time
  - Work Hours
  - Lifestyle habits


## 🔍 Methods Used

### 1. Multiple Linear Regression
- Modeled stress level as a numeric variable
- Identified key predictors:
  - Sleep duration (negative effect)
  - Screen time, work hours, caffeine (positive effect)

### 2. Chi-Square Test
- Found significant relationships between:
  - Stress level & marital status
  - Stress level & physical activity

### 3. ANOVA
- Confirmed differences in stress levels across physical activity groups

### 4. MANOVA
- Showed lifestyle variables differ significantly across stress levels

### 5. Hotelling’s T² Test
- Identified significant differences between male and female lifestyle patterns


## 📈 Key Results
- Model achieved reasonable predictive performance (MSE ≈ 0.37)
- Lifestyle factors strongly influence stress levels
- Sleep, work hours, and screen time are major contributors


## 🛠️ Tools Used
- R Programming
- Statistical Modeling
- Data Analysis


## 📂 Project Files
- `report.pdf` → full analysis
- `analysis.R` → code (if available)


## 👤 Author
Ruth Kanyinda
