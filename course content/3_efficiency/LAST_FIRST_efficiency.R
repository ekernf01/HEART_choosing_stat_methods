p = 0.12345
# Q1
genotypes = data.frame(allele_count = rbinom(1000, 2, p))

# Q2
# This demo code shows how to make, print, and modify a "dataframe", but it doesn't implement the stats methods yet.
variance_estimates = data.frame(method1 = rep(0, 4), method2 = rep(0, 4))
print(variance_estimates)
variance_estimates[2, "method1"] = 12345 # replace this with code for method 1
variance_estimates[2, "method2"] = 12345 # replace this with code for method 2
print(variance_estimates)

# Q3
# Q3 requires you to repeat Q1 and Q2 in a for loop or using lapply.
squareme = function(x) x*x
lapply(1:9, squareme)
for(i in 1:9){
  variance_estimates[i, "method2"] = squareme(i)
}

# Q4
# Demos of how to make scatterplots and histograms from columns in a dataframe
example_data = data.frame(x = rbinom(1000, 25, 0.5), y = rbinom(1000, 25, 0.5))
plot(example_data[["x"]], example_data[["y"]], main = "Demo scatterplot")
hist(example_data[["x"]], main = "Demo histogram", breaks = 5)
hist(example_data[["x"]], main = "Demo histogram", breaks = 20)
# Demo of how to make the sample plots in ggplot2
library("ggplot2")
ggplot(example_data) + geom_point(aes(x=x, y=y)) + ggtitle("Example scatterplot")
ggplot(example_data) + geom_histogram(aes(x=x), bins = 5) + ggtitle("Example histogram")
ggplot(example_data) + geom_histogram(aes(x=x), bins = 15) + ggtitle("Example histogram")

