# Q1
set.seed(1)
regression_demo = data.frame(
  x1 = sample(rep(1:10, times = 5)), # the sample() function puts things in a random order.
  x2 = sample(rep(1:10, times = 5)),
  x3 = sample(rep(1:10, times = 5)) 
)
regression_demo[["y"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
plot(regression_demo$x1, regression_demo$y)
plot(regression_demo$x2, regression_demo$y)
plot(regression_demo$x3, regression_demo$y)
model_complex = lm(y ~ 1 + x1 + x2 + x3, data = regression_demo)
model_complex
summary(model_complex)

# Q2
number_of_simulations = 1e4
yz_association_true_model = yz_association_complex_model = yz_association_simple_model = rep(NA, number_of_simulations)
for( j in 1:number_of_simulations){
  # z looks a lot like y, but only contains info from x1 and x2. 
  regression_demo[["y"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
  regression_demo[["z"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
  # Make a negative control that looks like y, but only contains info from x1 and x2. 
  # Will it be good enough?
  model_simple = lm(y ~ 1 + x1, data = regression_demo)
  model_complex = lm(y ~ 1 + x1 + x2 + x3, data = regression_demo)
  regression_demo[["negative_control_complex_model"]] = predict(model_complex) + rbinom(nrow(regression_demo), 10, 0.5)
  regression_demo[["negative_control_simple_model"]] = predict(model_simple) + rbinom(nrow(regression_demo), 10, 0.5)
  regression_demo[["negative_control_true_model"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
  #  For predicting z, is the negative control just as good as y?
  yz_association_true_model[j] = with(regression_demo, cor(z, y) - cor(z, negative_control_true_model))
  yz_association_complex_model[j] = with(regression_demo, cor(z, y) - cor(z, negative_control_complex_model))
  yz_association_simple_model[j] = with(regression_demo, cor(z, y) - cor(z, negative_control_simple_model))
}
hist(yz_association_simple_model, 40)
hist(yz_association_complex_model, 40)
hist(yz_association_true_model, 40)
mean(yz_association_simple_model)
mean(yz_association_complex_model)
mean(yz_association_true_model)
