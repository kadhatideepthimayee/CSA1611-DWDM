transactions <- list(
  T1 = c("Milk", "Beer", "Diapers"),
  T2 = c("Bread", "Butter", "Milk"),
  T3 = c("Milk", "Diapers", "Cookies"),
  T4 = c("Bread", "Butter", "Cookies"),
  T5 = c("Beer", "Cookies", "Diapers"),
  T6 = c("Milk", "Diapers", "Bread", "Butter"),
  T7 = c("Bread", "Butter", "Diapers"),
  T8 = c("Beer", "Diapers"),
  T9 = c("Milk", "Diapers", "Bread", "Butter"),
  T10 = c("Beer", "Cookies")
)




items <- unique(unlist(transactions))

cat("Distinct Items:\n")
print(items)

n <- length(items)

cat("\nNumber of distinct items =", n, "\n")


max_rules <- 3^n - 2^(n + 1) + 1

cat("\nMaximum number of association rules =",
    max_rules, "\n")


transaction_size <- sapply(transactions, length)

cat("\nTransaction Sizes:\n")
print(transaction_size)


max_itemset_size <- max(transaction_size)

cat("\nMaximum size of frequent itemset =",
    max_itemset_size, "\n")


for(i in seq_along(transactions)){
  cat(
    names(transactions)[i],
    ": {",
    paste(transactions[[i]], collapse = ", "),
    "}\n"
  )
}



