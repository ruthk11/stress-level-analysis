install.packages("Hotelling")
library(tidyverse)
library(caret)
library(car)
library(Hotelling)

#1. MULTIPLE REGRESSION : Model stress as numeric, interpret coefficients

stress <- read.csv("stress_detection_data.csv")
stress$Stress_Numeric <- as.numeric(factor(stress$Stress_Detection,
                                           levels = c("Low","Medium","High")))
stress$Gender <- as.factor(stress$Gender)

set.seed(123)
idx <- sample(1:nrow(stress), 0.8 * nrow(stress))
train <- stress[idx, ]; test <- stress[-idx, ]

lm_model <- lm(Stress_Numeric ~ Age + Gender + Sleep_Duration + Sleep_Quality +
                 Physical_Activity + Screen_Time + Caffeine_Intake +
                 Work_Hours + Alcohol_Intake, data = train)
summary(lm_model)

par(mfrow = c(2, 2))
plot(lm_model)


# Test set MSE
preds_lm <- predict(lm_model, test)
mse <- mean((preds_lm - test$Stress_Numeric)^2)
cat("Test MSE:", mse, "\n")




#2.Basic hypothesis test (two sample t test) : Compare stress between genders

t.test(Stress_Numeric ~ Gender, data = stress)

#3. chi square test : Test independence of stress category vs. demographics

chisq.test(table(stress$Stress_Detection, stress$Gender))
chisq.test(table(stress$Stress_Detection, stress$Occupation))
chisq.test(table(stress$Stress_Detection, stress$Smoking_Habit))



#5.  MANOVA : Test if stress groups differ on multiple lifestyle vars

manova_model <- manova(cbind(Sleep_Duration, Screen_Time, Work_Hours, Physical_Activity)
                       ~ Stress_Detection, data = stress)
summary(manova_model, test = "Wilks")
summary.aov(manova_model)  # Follow-up univariate ANOVAs


par(mfrow = c(2, 3))
for (var in c("Sleep_Duration", "Physical_Activity", "Heart_Rate", "BMI", "Daily_Steps", "Age")) {
  boxplot(get(var) ~ Stress_Detection, data = stress, main = var, col = c("green", "orange", "red"))
}



#6. Hotelling's T² : Multivariate comparison of males vs. females

library(mvtnorm)
library(ICS)
library(ICSNP)
males <- stress[stress$Gender == "Male", c("Sleep_Duration","Screen_Time","Work_Hours")]
females <- stress[stress$Gender == "Female", c("Sleep_Duration","Screen_Time","Work_Hours")]
HotellingsT2(males, females)


par(mfrow = c(2, 3))
for (var in c("Sleep_Duration", "Physical_Activity", "Heart_Rate", "BMI", "Daily_Steps", "Age")) {
  boxplot(get(var) ~ Gender, data = stress, main = var, col = c("steelblue", "pink"))
}









