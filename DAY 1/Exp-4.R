
# (a) Min-max normalization example
minF <- 50000
maxF <- 100000
v <- 80000
normalized_v <- (v - minF) / (maxF - minF)
print(normalized_v)
# (b) Normalize the data
x <- c(200, 300, 400, 600, 1000)
# Min-max normalization (0 to 1)
min_max <- (x - min(x)) / (max(x) - min(x))
print(min_max)
# Z-score normalization
z_score <- (x - mean(x)) / sd(x)
print(z_score)