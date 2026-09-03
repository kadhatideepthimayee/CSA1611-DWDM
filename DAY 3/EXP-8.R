install.packages("RWeka")
library(RWeka)

data(iris)

set.seed(123)
index <- sample(1:nrow(iris), 0.7 * nrow(iris))

train <- iris[index, ]
test <- iris[-index, ]

model <- J48(
  Species ~ .,
  data = train
)

print(model)

prediction <- predict(model, test)

accuracy <- mean(prediction == test$Species)

cat("Decision Tree Accuracy:",
    accuracy * 100, "%\n")

print(table(
  Actual = test$Species,
  Predicted = prediction
))
