library(ggplot2)

customers <- data.frame(
  CustomerID = 1:20,
  Age = c(19,21,20,23,31,35,40,42,28,30,
          45,48,50,52,25,27,29,33,38,22),
  Gender = c("Male","Female","Female","Female","Female",
             "Male","Male","Female","Male","Female",
             "Male","Female","Male","Female","Male",
             "Female","Male","Female","Male","Female"),
  AnnualIncome = c(15000,18000,17000,20000,35000,
                   38000,42000,45000,50000,52000,
                   70000,72000,75000,78000,85000,
                   88000,90000,95000,100000,105000),
  SpendingScore = c(85,90,88,82,60,
                    55,50,45,70,65,
                    30,35,25,20,85,
                    90,80,95,88,92)
)

# Select variables for clustering
x <- customers[, c("AnnualIncome", "SpendingScore")]

# K-Means with 5 clusters
set.seed(123)
kmeans_model <- kmeans(x, centers = 5, nstart = 25)

# Add cluster number
customers$Cluster <- as.factor(kmeans_model$cluster)

# Display result
print(customers)

# Cluster centers
print(kmeans_model$centers)

# Plot clusters
ggplot(customers,
       aes(x = AnnualIncome,
           y = SpendingScore,
           color = Cluster)) +
  geom_point(size = 4) +
  geom_point(data = as.data.frame(kmeans_model$centers),
             aes(x = AnnualIncome,
                 y = SpendingScore),
             color = "black",
             size = 5,
             shape = 8) +
  labs(title = "Customer Segmentation using K-Means",
       x = "Annual Income",
       y = "Spending Score") +
  theme_minimal()
