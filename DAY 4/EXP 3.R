library(e1071)

data(iris)

# Split data
set.seed(123)

train_index <- sample(
  1:nrow(iris),
  size = 0.7 * nrow(iris)
)

train <- iris[train_index, ]
test <- iris[-train_index, ]

# -------------------------
# Naive Bayes
# -------------------------

nb_model <- naiveBayes(Species ~ ., data = train)

nb_pred <- predict(nb_model, test)

nb_cm <- table(
  Actual = test$Species,
  Predicted = nb_pred
)

print("Naive Bayes Confusion Matrix")
print(nb_cm)

nb_accuracy <- sum(diag(nb_cm)) / sum(nb_cm)

cat("Naive Bayes Accuracy:",
    nb_accuracy * 100, "%\n")


# -------------------------
# SVM
# -------------------------

svm_model <- svm(
  Species ~ .,
  data = train,
  kernel = "linear"
)

svm_pred <- predict(svm_model, test)

svm_cm <- table(
  Actual = test$Species,
  Predicted = svm_pred
)

print("SVM Confusion Matrix")
print(svm_cm)

svm_accuracy <- sum(diag(svm_cm)) / sum(svm_cm)

cat("SVM Accuracy:",
    svm_accuracy * 100, "%\n")


# -------------------------
# Accuracy comparison
# -------------------------

accuracy <- c(
  nb_accuracy,
  svm_accuracy
)

names(accuracy) <- c(
  "Naive Bayes",
  "SVM"
)

barplot(
  accuracy * 100,
  main = "Naive Bayes vs SVM",
  ylab = "Accuracy (%)",
  ylim = c(0,100)
)
