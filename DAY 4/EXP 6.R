library(arules)
library(arulesViz)

# Create transaction dataset
transactions <- list(
  c("Milk", "Bread", "Butter"),
  c("Milk", "Bread"),
  c("Milk", "Butter"),
  c("Milk", "Bread", "Butter"),
  c("Bread", "Butter"),
  c("Milk", "Bread", "Butter")
)

# Convert to transactions
trans <- as(transactions, "transactions")

inspect(trans)

# FP-growth
rules <- apriori(
  trans,
  parameter = list(
    support = 0.50,
    confidence = 0.75,
    minlen = 2
  ),
  appearance = list(
    default = "lhs"
  )
)

print(rules)

# Inspect rules
inspect(rules)

# Sort rules by confidence
rules_sorted <- sort(
  rules,
  by = "confidence",
  decreasing = TRUE
)

inspect(rules_sorted)

# Plot
plot(
  rules,
  method = "graph"
)
