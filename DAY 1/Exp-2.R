x <- c(18,18,18,20,20,20,20,20,20,20,21,21,
       21,21,25,25,25,25,25,28,28,30,30,30)
# Equal-frequency partition (3 bins)
bins <- split(x, cut(seq_along(x), breaks=3, labels=FALSE))
bins
# Bin means smoothing
bin_mean <- lapply(bins, function(b) rep(mean(b), length(b)))
bin_mean
# Bin boundary smoothing
bin_boundary <- lapply(bins, function(b){
  low <- min(b)
  high <- max(b)
  sapply(b, function(v){
    if(abs(v-low) <= abs(v-high)) low else high
  })
})
bin_boundary
# Histogram
hist(x,
     breaks=3,
     main="Equal Frequency Histogram",
     xlab="Values",
     col="lightblue")