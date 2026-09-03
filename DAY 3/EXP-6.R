
diabetes <- read.csv("diabetes.csv")

head(diabetes)

model <- lm(
  Outcome ~ Pregnancies + Glucose + BloodPressure +
    SkinThickness + Insulin + BMI +
    DiabetesPedigreeFunction + Age,
  data = diabetes
)

# Display model details
summary(model)

# Predict values
prediction <- predict(model, diabetes)

# Display first 10 predictions
head(prediction, 10)

# Plot Actual vs Predicted
plot(
  diabetes$Outcome,
  prediction,
  main = "Actual vs Predicted Diabetes",
  xlab = "Actual Outcome",
  ylab = "Predicted Outcome"
)

abline(
  a = 0,
  b = 1
)
