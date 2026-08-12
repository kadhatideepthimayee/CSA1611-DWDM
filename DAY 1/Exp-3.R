A <- c(76,35,47,64,95,66,89,36,84)
B <- c(51,56,84,60,59,70,63,66,50)
# Mean
mean(A)
mean(B)
# Median
median(A)
median(B)
# Range
range(A)
diff(range(A))
range(B)
diff(range(B))
# Boxplot
boxplot(A, B,
        names=c("Class A","Class B"),
        col=c("lightgreen","lightblue"),
        main="Exam Scores Comparison")