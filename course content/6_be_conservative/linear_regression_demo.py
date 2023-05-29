import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

np.random.seed(0)

# Simulating data
regression_demo = pd.DataFrame({
    'x1': np.random.choice(np.repeat(range(1, 11), 5)),
    'x2': np.random.choice(np.repeat(range(1, 11), 5)),
    'x3': np.random.choice(np.repeat(range(1, 11), 5))
})

def make_noise(n):
    return np.random.binomial(n, 0.5, size=n)

regression_demo['y'] = regression_demo['x1']*1.1 + regression_demo['x2']*0.1 + make_noise(len(regression_demo))

# Plotting
plt.figure(figsize=(5, 5))
plt.scatter(regression_demo['x1'], regression_demo['y'])
plt.title("Y depends strongly on x1")
plt.xlabel("x1")
plt.ylabel("y")
plt.show()

plt.figure(figsize=(5, 5))
plt.scatter(regression_demo['x2'], regression_demo['y'])
plt.title("Y depends weakly on x2")
plt.xlabel("x2")
plt.ylabel("y")
plt.show()

plt.figure(figsize=(5, 5))
plt.scatter(regression_demo['x3'], regression_demo['y'])
plt.title("Y is independent of x3")
plt.xlabel("x3")
plt.ylabel("y")
plt.show()

# Hypothesis testing
model_complex = LinearRegression().fit(regression_demo[['x1', 'x2', 'x3']], regression_demo['y'])
print("Model coefficients:", model_complex.intercept_, model_complex.coef_)

plt.figure(figsize=(5, 5))
plt.scatter(regression_demo['y'], model_complex.predict(regression_demo[['x1', 'x2', 'x3']]))
plt.title("Model predictions versus actual y")
plt.xlabel("Actual y")
plt.ylabel("Predicted y")
plt.show()

included = model_complex.coef_ != 0
print("Included variables:", included)

# Leave-one-out cross validation
models_leave_one_out = {
    'simple': LinearRegression(),
    'medium': LinearRegression(),
    'complex': LinearRegression()
}

leave_one_out_prediction_error = {'simple': 0, 'medium': 0, 'complex': 0}

for i in range(len(regression_demo)):
    for m in ['simple', 'medium', 'complex']:
        train_data = regression_demo.drop(i)
        models_leave_one_out[m].fit(train_data[['x1', 'x2', 'x3']], train_data['y'])
        leave_one_out_prediction_error[m] += (models_leave_one_out[m].predict(regression_demo.iloc[i][['x1', 'x2', 'x3']]) - regression_demo.iloc[i]['y'])**2

leave_one_out_prediction_error = pd.Series(leave_one_out_prediction_error)
print("Leave-one-out prediction errors:", leave_one_out_prediction_error)

# Fitting error
whole_dataset_models = {
    'simple': LinearRegression(),
    'medium': LinearRegression(),
    'complex': LinearRegression()
}

whole_dataset_prediction_error = {'simple': 0, 'medium': 0, 'complex': 0}

for m in ['simple', 'medium', 'complex']:
    whole_dataset_models[m].fit(regression_demo[['x1', 'x2', 'x3']], regression_demo['y'])
    whole_dataset_prediction_error[m] = ((whole_dataset_models[m].predict(regression_demo[['x1', 'x2', 'x3']]) - regression_demo

