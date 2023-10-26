import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm
import statsmodels.formula.api as smf

# Set working directory
data_url = "https://raw.githubusercontent.com/ekernf01/HEART_choosing_stat_methods/main/course%20content/5_outlier_robustness/SyntheticGeneActivityData.csv"
GeneActivity = pd.read_csv(data_url, index_col=0).T

# Plot timeseries for Gene 7 RNA
plt.figure(figsize=(5, 5))
plt.scatter(GeneActivity.sum(axis=1), GeneActivity["x_g7"])
plt.xlabel("Time (sort of)")
plt.ylabel("Gene 7 RNA")
plt.title("A snapshot of many cells")
plt.savefig("timeseries_gene7.png")
plt.close()

# Plot Gene 7 RNA vs. RNA velocity
plt.figure(figsize=(5, 5))
plt.scatter(GeneActivity["x_g7"], GeneActivity["velocity_x_g7"])
plt.xlabel("RNA concentration")
plt.ylabel("RNA velocity")
plt.title("RNA decay dynamics")
plt.savefig("gene7_rna_vs_rna_velocity.png")
plt.close()

# Linear regression
ls_model = smf.ols("velocity_x_g7 ~ x_g7", data=GeneActivity).fit()

# Quantile regression
qr_model = smf.quantreg("velocity_x_g7 ~ x_g7", data=GeneActivity).fit(q=0.5)

# Plot RNA decay dynamics with regression lines
plt.figure(figsize=(5, 5))
plt.scatter(GeneActivity["x_g7"], GeneActivity["velocity_x_g7"])
plt.xlabel("RNA concentration")
plt.ylabel("RNA velocity")
plt.title("RNA decay dynamics")
plt.scatter(GeneActivity["x_g7"], ls_model.predict(GeneActivity["x_g7"]), color="red", label="Linear Regression")
plt.scatter(GeneActivity["x_g7"], qr_model.predict(GeneActivity["x_g7"]), color="blue", label="Quantile Regression")
plt.legend()
plt.savefig("gene7_rna_vs_rna_velocity_with_regression.png")
plt.close()

