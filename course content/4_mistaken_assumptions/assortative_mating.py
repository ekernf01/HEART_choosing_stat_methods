import numpy as np
import pandas as pd

def generate_allele_counts(allele_frequency, strength_of_assortative_mating, n):
    # Check user input -- should be numbers from 0 to 1
    assert isinstance(allele_frequency, (int, float)) and 0 <= allele_frequency <= 1, f"Allele frequency must be between 0 and 1; got {allele_frequency}"
    assert isinstance(strength_of_assortative_mating, (int, float)) and 0 <= strength_of_assortative_mating <= 1, f"Strength of assortative mating must be between 0 and 1; got {strength_of_assortative_mating}"

    extreme_assortative_mating = 2 * np.random.binomial(1, allele_frequency, n)
    no_assortative_mating = np.random.binomial(2, allele_frequency, n)

    return np.where(np.random.binomial(1, strength_of_assortative_mating, n),
                    extreme_assortative_mating,
                    no_assortative_mating)

def compute_variance(allele_frequency, strength_of_assortative_mating):
    # Check user input -- should be numbers from 0 to 1
    assert isinstance(allele_frequency, (int, float)) and 0 <= allele_frequency <= 1, f"Allele frequency must be between 0 and 1; got {allele_frequency}"
    assert isinstance(strength_of_assortative_mating, (int, float)) and 0 <= strength_of_assortative_mating <= 1, f"Strength of assortative mating must be between 0 and 1; got {strength_of_assortative_mating}"

    variance_if_independent = 2 * allele_frequency * (1 - allele_frequency)
    variance_if_identical = 4 * allele_frequency * (1 - allele_frequency)

    return strength_of_assortative_mating * variance_if_identical + (1 - strength_of_assortative_mating) * variance_if_independent

# Check the math. These should all be roughly the same.
print(compute_variance(0.5, 0.5))
print(np.var(generate_allele_counts(0.5, 0.5, 100000)))
print(compute_variance(0.3, 0.3))
print(np.var(generate_allele_counts(0.3, 0.3, 100000)))
print(compute_variance(0.3, 0))
print(np.var(generate_allele_counts(0.3, 0, 100000)))
print(compute_variance(0.3, 1))
print(np.var(generate_allele_counts(0.3, 1, 100000)))

# How I generated the data for the last question
filenames = [f"demo{i}.csv" for i in range(1, 10)]
for i, filename in enumerate(filenames):
    am = np.random.choice([0, 0.3], 1)[0]
    allele_counts = np.array([generate_allele_counts(af, am, 1000) for af in np.arange(0.1, 1, 0.1)]).T
    allele_counts_df = pd.DataFrame(allele_counts, columns=[f"Locus{i}" for i in range(1, 10)])
    allele_counts_df.to_csv(filename, index=False)

# How to read a CSV into Python as a dataframe
# If you have a local file called "demo.csv"
allele_counts = pd.read_csv("demo1.csv")
# If you want to pull it straight from the course website using a URL
allele_counts = pd.read_csv("https://raw.githubusercontent.com/ekernf01/HEART_choosing_stat_methods/main/course%20content/4_mistaken_assumptions/demo_data/demo1.csv")
