data(iris)

iris$Binary <- ifelse(
  iris$Species == "setosa",
  1,
  0
)

model <- glm(
  Binary ~ Sepal.Length + Sepal.Width +
    Petal.Length + Petal.Width,
  data = iris,
  family = binomial
)

print(summary(model))

probability <- predict(
  model,
  iris,
  type = "response"
)

prediction <- ifelse(
  probability >= 0.5,
  1,
  0
)

accuracy <- mean(
  prediction == iris$Binary
)

cat("Logistic Regression Accuracy:",
    accuracy * 100, "%\n")
