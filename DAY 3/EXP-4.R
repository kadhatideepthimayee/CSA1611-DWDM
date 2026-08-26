data <- read.csv(file.choose())

print(head(data))

print(names(data))

names(data) <- tolower(names(data))

linear_model <- lm(outcome ~ age, data = data)

print(summary(linear_model))

plot(data$age, data$outcome,
     main = "Diabetes Trend with Age",
     xlab = "Age",
     ylab = "Diabetes Outcome")

abline(linear_model)

multiple_model <- lm(
  outcome ~ age + glucose + bmi + bloodpressure,
  data = data
)

print(summary(multiple_model))

cat("Linear Regression R-squared:",
    summary(linear_model)$r.squared, "\n")

cat("Multiple Regression R-squared:",
    summary(multiple_model)$r.squared, "\n")
