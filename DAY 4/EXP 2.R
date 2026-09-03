employee <- data.frame(
  EmployeeID = c(111,222,333,444,555,666),
  Gender = c("Male","Male","Female","Female","Female","Male"),
  Age = c(28,25,26,25,30,29),
  Salary = c(150000,150000,160000,160000,170000,200000),
  Credit = c(39,27,42,40,64,72)
)

print(employee)

# Use numerical attributes
data <- employee[, c("Age", "Salary", "Credit")]

# Standardization
data_scaled <- scale(data)

# K-Means
set.seed(123)
model <- kmeans(data_scaled, centers = 2, nstart = 25)

employee$Cluster <- model$cluster

print(employee)

# Cluster centers
print(model$centers)

# Plot Age vs Credit
plot(employee$Age,
     employee$Credit,
     col = employee$Cluster,
     pch = 19,
     xlab = "Age",
     ylab = "Credit",
     main = "K-Means Employee Clustering")

legend("topleft",
       legend = unique(employee$Cluster),
       col = unique(employee$Cluster),
       pch = 19)
