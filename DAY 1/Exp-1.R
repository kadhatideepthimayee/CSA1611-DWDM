# Photograph preference data
A <- c(18, 2, 20)
B <- c(22, 28, 10)
C <- c(20, 40, 40)
# Create data frame
photo <- data.frame(A, B, C)
# 1. Sample covariance between B and C
cov(B, C)
# 2. Sample covariance matrix
cov(photo)
# 3. Sample correlation between B and C
cor(B, C)
# 4. Sample correlation matrix
cor(photo)
