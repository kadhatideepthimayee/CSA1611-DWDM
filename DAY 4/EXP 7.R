library(rpart)
library(e1071)
library(caret)

# Read diabetes dataset
url <- "https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv"

diabetes <- read.csv(
  url,
  header = FALSE
)

names(diabetes) <- c(
  "Pregnancies",
  "Glucose",
  "BloodPressure",
  "SkinThickness",
  "Insulin",
  "BMI",
  "DiabetesPedigree",
  "Age",
  "Outcome"
)

diabetes$Outcome <- as.factor(diabetes$Outcome)

# Split dataset
set.seed(123)

index <- createDataPartition(
  diabetes$Outcome,
  p = 0.7,
  list = FALSE
)

train <- diabetes[index, ]
test <- diabetes[-index, ]


# -------------------------
# Decision Tree
# -------------------------

tree_model <- rpart(
  Outcome ~ .,
  data = train,
  method = "class"
)

tree_pred <- predict(
  tree_model,
  test,
  type = "class"
)

tree_cm <- confusionMatrix(
  tree_pred,
  test$Outcome,
  positive = "1"
)

print(tree_cm)

tree_accuracy <- tree_cm$overall["Accuracy"]

tree_f1 <- tree_cm$byClass["F1"]

cat("Decision Tree Accuracy:",
    tree_accuracy, "\n")

cat("Decision Tree F1:",
    tree_f1, "\n")


# -------------------------
# SVM
# -------------------------

svm_model <- svm(
  Outcome ~ .,
  data = train,
  kernel = "linear"
)

svm_pred <- predict(
  svm_model,
  test
)

svm_cm <- confusionMatrix(
  svm_pred,
  test$Outcome,
  positive = "1"
)

print(svm_cm)

svm_accuracy <- svm_cm$overall["Accuracy"]

svm_f1 <- svm_cm$byClass["F1"]

cat("SVM Accuracy:",
    svm_accuracy, "\n")

cat("SVM F1:",
    svm_f1, "\n")


# -------------------------
# Comparison graph
# -------------------------

results <- rbind(
  c(tree_accuracy, tree_f1),
  c(svm_accuracy, svm_f1)
)

colnames(results) <- c(
  "Accuracy",
  "F1"
)

rownames(results) <- c(
  "Decision Tree",
  "SVM"
)

print(results)

barplot(
  t(results) * 100,
  beside = TRUE,
  main = "Decision Tree vs SVM",
  ylab = "Percentage",
  ylim = c(0,100),
  legend.text = TRUE
)
