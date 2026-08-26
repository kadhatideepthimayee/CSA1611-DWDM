install.packages("arules")
library(arules)

transactions <- list(
  c("a", "d", "e"),
  c("a", "b", "c", "e"),
  c("a", "b", "d", "e"),
  c("a", "c", "d", "e"),
  c("b", "c", "e"),
  c("b", "d", "e"),
  c("c", "d"),
  c("a", "b", "c"),
  c("a", "d", "e"),
  c("a", "b", "e")
)

t <- as(transactions, "transactions")

rules <- apriori(t, parameter=list(
  supp=0.3, conf=0.5, minlen=2
))
inspect(rules)

fp_rules <- fim4r(t, method="fpgrowth",
                  target="rules",
                  support=0.3,
                  confidence=0.5)

print(fp_rules)
