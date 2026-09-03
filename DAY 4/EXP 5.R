# EXPERIMENT 5
# Scatter Plot

x <- c(4, 1, 5, 7, 10, 2, 50, 25, 90, 36)

y <- c(12, 5, 13, 19, 31, 7, 153, 72, 275, 110)

data <- data.frame(
  MobilePhonesSold = x,
  Money = y
)

print(data)

# Scatter plot
plot(
  x,
  y,
  pch = 19,
  main = "Mobile Phones Sold vs Money",
  xlab = "Number of Mobile Phones Sold",
  ylab = "Money"
)

# Add regression line
model <- lm(y ~ x)

abline(model)

# Correlation
cat("Correlation:",
    cor(x, y),
    "\n")
