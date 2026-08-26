install.packages("e1071")
install.packages("rpart")
install.packages("rpart.plot")

library(e1071)
library(rpart)
library(rpart.plot)

d <- data.frame(
  age=c("<=30","<=30","31-40",">40",">40",">40","31-40","<=30",
        "<=30",">40","<=30","31-40","31-40",">40"),
  income=c("high","high","high","medium","low","low","low","medium",
           "low","medium","medium","medium","high","medium"),
  student=c("no","no","no","no","yes","yes","yes","no",
            "yes","yes","yes","no","yes","no"),
  credit=c("fair","excellent","fair","fair","fair","excellent","excellent",
           "fair","fair","fair","excellent","excellent","fair","excellent"),
  class=c("no","no","yes","yes","yes","no","yes","no",
          "yes","yes","yes","yes","yes","no")
)


train <- d[1:10,]
test <- d[11:14,]

nb <- naiveBayes(class ~ ., train)
pred1 <- predict(nb, test)

print(pred1)
print(table(test$class, pred1))
cat("Bayes Accuracy =", mean(pred1 == test$class)*100, "%\n")

dt <- rpart(class ~ ., train, method="class")
rpart.plot(dt)

pred2 <- predict(dt, test, type="class")

print(pred2)
print(table(test$class, pred2))
cat("Decision Tree Accuracy =", mean(pred2 == test$class)*100, "%\n")
