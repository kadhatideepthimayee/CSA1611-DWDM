
diabetes <- read.csv("diabetes.csv")

head(diabetes)

str(diabetes)

model <- lm(Outcome ~ Age, data = diabetes)

summary(model)

# Prediction
predicted <- predict(model)

print(predicted)

# Plot
plot(
  diabetes$Age,
  diabetes$Outcome,
  main = "Diabetes Trend with Age",
  xlab = "Age",
  ylab = "Diabetes Outcome"
)

abline(model)

# Correlation
correlation <- cor(
  diabetes$Age,
  diabetes$Outcome
)

cat("Correlation =", correlation, "\n")
