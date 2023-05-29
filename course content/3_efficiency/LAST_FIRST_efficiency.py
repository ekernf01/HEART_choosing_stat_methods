import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

p = 0.12345

# Q1
genotypes = pd.DataFrame({'allele_count': np.random.binomial(2, p, 1000)})

# Q2
variance_estimates = pd.DataFrame({'method1': np.zeros(4), 'method2': np.zeros(4)})
print(variance_estimates)
variance_estimates.at[1, 'method1'] = 12345  # replace this with code for method 1
variance_estimates.at[1, 'method2'] = 12345  # replace this with code for method 2
print(variance_estimates)

# Q3
squareme = lambda x: x * x
variance_estimates['method2'] = [squareme(i) for i in range(4)]

# Q4
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

