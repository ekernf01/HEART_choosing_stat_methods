# Q1
regression_demo = data.frame(
  x1 = sample(rep(1:10, times = 5)), # the sample() function puts things in a random order.
  x2 = sample(rep(1:10, times = 5)),
  x3 = sample(rep(1:10, times = 5)) 
)
regression_demo[["y"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
plot(regression_demo$y, regression_demo$x1)
plot(regression_demo$y, regression_demo$x2)
model_complex = lm(y ~ 1 + x1 + x2 + x3, data = regression_demo)
model_complex
summary(model_complex)

# Q2
number_of_simulations = 1e2
number_of_simulations_inner = 1e2
yz_association_complex = yz_association_simple = rep(NA, number_of_simulations)
for( j in 1:number_of_simulations){
  # z looks a lot like y, but only contains info from x1 and x2. 
  regression_demo[["z"]] = regression_demo[["x1"]]*1.1 + regression_demo[["x2"]]*0.1 + rbinom(nrow(regression_demo), 10, 0.5)
  model_simple = lm(y ~ 1 + x1, data = regression_demo)
  model_simple
  yz_association_complex_inner = yz_association_simple_inner = rep(NA, number_of_simulations_inner)
  for(i in 1:number_of_simulations){
    regression_demo[["y_predicted_complex"]] = predict(model_complex) + rbinom(nrow(regression_demo), 10, 0.5)
    regression_demo[["y_predicted_simple"]] = predict(model_simple) + rbinom(nrow(regression_demo), 10, 0.5)
    yz_association_complex_inner[i] = with(regression_demo, cor(z, y) - cor(z, y_predicted_complex))
    yz_association_simple_inner[i] = with(regression_demo, cor(z, y) - cor(z, y_predicted_simple))
  }
  yz_association_simple[j] = mean(yz_association_simple_inner)
  yz_association_complex[j] = mean(yz_association_complex_inner)
}
hist(yz_association_simple)
hist(yz_association_complex)
