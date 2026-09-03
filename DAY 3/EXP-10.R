install.packages("arules")
library(arules)

transactions <- list(
  c("Bread", "Milk", "Butter"),
  c("Bread", "Milk"),
  c("Milk", "Butter"),
  c("Bread", "Butter"),
  c("Bread", "Milk", "Butter"),
  c("Bread", "Milk")
)

trans <- as(
  transactions,
  "transactions"
)

itemsets <- apriori(
  trans,
  parameter = list(
    target = "frequent itemsets",
    supp = 0.3333
  )
)

inspect(itemsets)

rules <- apriori(
  trans,
  parameter = list(
    supp = 0.3333,
    conf = 0.60
  )
)

inspect(rules)
