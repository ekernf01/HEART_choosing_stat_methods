# Setup
set.seed(0)
regression_demo = data.frame(
  x1 = sample(rep(1:10, times = 5)), # the sample() function puts things in a random order.
  x2 = sample(rep(1:10, times = 5)),
  x3 = sample(rep(1:10, times = 5)) 
)
# Let's add some randomness, maybe from measurement error or unobserved parts of the system we're studying.
# This function makes random variables with a mean of 0.
make_noise = function(n = nrow(regression_demo)) rbinom(n, 10, 0.5) - 5
# In truth, y depends strongly on x1, weakly on x2, and not at all on x3.
regression_demo[["y"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + make_noise()
plot(regression_demo$x1, regression_demo$y, main = "Y depends strongly on x1")
plot(regression_demo$x2, regression_demo$y, main = "Y depends weakly on x2")
plot(regression_demo$x3, regression_demo$y, main = "Y is independent of x3")

# Q1 
# TODO: run this 10,000 times and check how many times x1, x2, and x3 are included.
# We can use built-in functions to fit a model that estimates how strongly y depends on x1, x2, x3.
model_complex = lm(y ~ 1 + x1 + x2 + x3, data = regression_demo)
# It guesses y =    -1.28887   +   1.18901*x1   +   0.08631*x2  +   0.04992*x3 .   
model_complex
# We can compare its predictions against the actual y.
plot(regression_demo$y, predict(model_complex), main = "Model predictions versus actual y")
# Using built-in functions, R can test the null hypothesis that each coefficient is 0.
# If you include a term in the model whenever the test yields a p-value below 0.1, then
# you should control false positive rate. Any variable not actually used -- here, x3
# is not used -- will only be included 10% of the time. 
null_hypothesis_test_results = summary(model_complex)
null_hypothesis_test_results
included = null_hypothesis_test_results$coefficients[,4]<0.1

# Q2
# Instead of controlling false positives, maybe we just want the best possible predictions.
# This code measures prediction error by leaving out each row of the data.
# TODO: run this 1,000 times and check how many times simple, medium, or complex performs best.
leave_one_out_prediction_error = c("simple" = 0, "medium" = 0, "complex" = 0)
for(i in 1:nrow(regression_demo)){
  models_leave_one_out = list(
    "simple" = lm(y ~ 1 + x1, data = regression_demo[-i,]),
    "medium" = lm(y ~ 1 + x1 + x2, data = regression_demo[-i,]),
    "complex" = lm(y ~ 1 + x1 + x2 + x3, data = regression_demo[-i,])
  )
  for(m in c("simple", "medium", "complex")){
    leave_one_out_prediction_error[[m]] = leave_one_out_prediction_error[[m]] + (predict(models_leave_one_out[[m]], newdata = regression_demo[i,] ) - regression_demo[i,"y"])^2
  }
}
leave_one_out_prediction_error

# Q3
# TODO: Modify the Q2 code so that models are fit to the whole dataset and prediction error is measured on the whole dataset.
# How many often does simple, medium, or complex win out?
