# Example data
points <- c(12,15,14,10,18,20,22,13,11,35)

# Boxplot
boxplot(points,
        main="Tennis Players Points Distribution",
        ylab="Points Scored",
        col="orange")

# Outliers
boxplot.stats(points)$out