import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

p = 0.12345

# Q1
# You need to wrap this in a function so you can repeat it more easily.
genotypes = pd.DataFrame({'allele_count': np.random.binomial(2, p, 1000)})

# Q2
def method1(x):
  # your code here
  return v

def method2(x):
  # your code here
  return v
  
variance_estimates = pd.DataFrame({'method1': np.zeros(4), 'method2': np.zeros(4)})
print(variance_estimates)
variance_estimates.at[1, 'method1'] = method1(genotypes) 
variance_estimates.at[1, 'method2'] = method2(genotypes) 
print(variance_estimates)

# Q3: one way to repeat a procedure and fill up a whole column of a dataframe is to use a for loop.
# Replace squareme with your code to generate data and estimate variance.
def squareme(x):
  return x*x
for i in range(4):
  variance_estimates.loc[i, 'method2'] = squareme(i)

# Q4
# Here are some demos of how to make charts in Python. 
example_data = pd.DataFrame({'x': np.random.binomial(25, 0.5, 1000),
                             'y': np.random.binomial(25, 0.5, 1000)})
plt.scatter(example_data['x'], example_data['y'])
plt.title("Demo scatterplot")
plt.show()

plt.hist(example_data['x'], bins=5)
plt.title("Demo histogram (bins=5)")
plt.show()

plt.hist(example_data['x'], bins=20)
plt.title("Demo histogram (bins=20)")
plt.show()

sns.scatterplot(data=example_data, x='x', y='y')
plt.title("Example scatterplot")
plt.show()

sns.histplot(data=example_data, x='x', bins=5)
plt.title("Example histogram (bins=5)")
plt.show()

sns.histplot(data=example_data, x='x', bins=15)
plt.title("Example histogram (bins=15)")
plt.show()

