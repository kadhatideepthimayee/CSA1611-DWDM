# Boxplot of mpg by number of cylinders
boxplot(mpg ~ cyl,
        data=mtcars,
        main="MPG vs Number of Cylinders",
        xlab="Number of Cylinders",
        ylab="Miles per Gallon",
        col=c("lightblue","lightgreen","lightpink"))