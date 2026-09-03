person <- c(
  "Gopu", "Babu", "Baby", "Gopal", "Krishna",
  "Jai", "Dev", "Malini", "Hema", "Anu"
)

vegetarian <- c(
  "yes", "yes", "yes", "no", "yes",
  "no", "no", "yes", "yes", "yes"
)

data <- data.frame(
  Person = person,
  Vegetarian = vegetarian
)

print(data)

# Count
count <- table(data$Vegetarian)

print(count)

# Display values
cat("Vegetarian:", count["yes"], "\n")
cat("Non-Vegetarian:", count["no"], "\n")

# Find greater count
if(count["yes"] > count["no"]) {
  cat("Vegetarian count is greater\n")
} else if(count["no"] > count["yes"]) {
  cat("Non-Vegetarian count is greater\n")
} else {
  cat("Both are equal\n")
}

# Bar plot
barplot(
  count,
  main = "Vegetarian vs Non-Vegetarian",
  xlab = "Category",
  ylab = "Number of Persons"
)
