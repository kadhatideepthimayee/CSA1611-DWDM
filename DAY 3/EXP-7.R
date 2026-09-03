library(arules)

# Given transactions
transactions <- list(
  T1 = c("M", "O", "N", "K", "E", "Y"),
  T2 = c("D", "O", "N", "K", "E", "Y"),
  T3 = c("M", "A", "K", "E"),
  T4 = c("M", "U", "C", "K", "Y"),
  T5 = c("C", "O", "K", "I", "E")
)

# Convert into transaction format
trans <- as(
  transactions,
  "transactions"
)

# Display transactions
inspect(trans)

# Apriori
rules <- apriori(
  trans,
  parameter = list(
    supp = 0.50,
    conf = 0.80
  )
)

# Display association rules
inspect(rules)

# Find frequent itemsets
itemsets <- apriori(
  trans,
  parameter = list(
    supp = 0.50,
    target = "frequent itemsets"
  )
)

# Display frequent itemsets
inspect(itemsets)
