## Mistaken assumptions

Statistical inference requires assumptions. This is unfortunate and limiting in light of the many "unknown unknowns" hiding behind the phenomena we wish to study. One major agenda in modern statistics is to reduce these assumptions to their barest form. This is often done by making models that are infinitely flexible in some way: lines of best fit that [bend and wiggle](https://en.wikipedia.org/wiki/Kernel_regression), categorical assignments with [no limit](https://www.ncbi.nlm.nih.gov/labs/pmc/articles/PMC6583910/) on the number of categories, probability mass functions with [no pre-specified shape](https://en.wikipedia.org/wiki/Kernel_density_estimation) or generating mechanism, or procedures that require only abstract properties: "non-decreasing", "symmetric", "independent", "exchangeable". It can also be done via the study of "misspecification", which aims to say, "Even if my model is wrong about this, that, or the other, it will yield results that are reliable in some specific sense." We won't have the mathematical firepower to dig into all of these, but spectacular examples of this type of analysis include [generalized estimating equations](https://en.wikipedia.org/wiki/Generalized_estimating_equation), [doubly-robust causal effect estimation](https://arxiv.org/abs/0804.2958), and [causal effect estimation with many invalid instrumental variables](https://arxiv.org/abs/1401.5755). 

In this session, we will explore the principle that sometimes, a statistical method must tolerate when its assumptions are mistaken. 

### Estimating variance with assortative mating

We return to the example from the "efficiency" lecture: variance of allele counts. But, let's generate the data a little differently. Let's assume that the population in question has a high degree of assortative mating. Assortative mating means that people with similar allele counts tend to have kids together. Instead of binomial allele counts, which require each chromosome to be independent, the chromosomes tend to be similar. The allele counts then have more 0's and 2's and fewer 1's. Assortative mating is common in humans. I'm not sure if it shows up this obviously in the data, but for fancier types of analysis, it makes a [big difference](https://www.biorxiv.org/content/10.1101/2022.03.21.485215v1)!

Repeat the tasks from the efficiency lecture (copied below) but with assortative mating. Type your answers in a Word document and your code in an R script and email them to Eric as `LAST_FIRST_binomial_variance.docx` and `LAST_FIRST_binomial_variance.R`. Here are the (modified) questions.

1. Simulate allele counts for 1 locus in 1000 people so that people with a reference allele on one chromosome are more likely to have it on the other chromosome, and people with the alternate allele on one chromosome are more likely to have the alternate allele on the other chromosome.
2. Estimate the variance across the 1000 people by method 1 and method 2. Store the results in a separate dataframe with one row and two columns. Recall the estimation methods from the efficiency lecture:
    > This lecture deals with the variance, defined as $Var[X] = E[(X - E[X])^2]$. In this demo, you will compare two existing methods for estimating variance.

    > Method 1 is the R function `var`, which uses the formula $\frac{(X_1 - \bar X)^2 + ... + X_N - \bar X)^2}{N-1}$. It plugs in the sample mean $\bar X$ in place of the population allele frequency $E[X]$, and it averages the squared deviations across each person in the sample. The denominator we'll use is N-1, not N, for reasons beyond the scope of this course. 

    > Method 2 is to compute $\bar X (2-\bar X)/2N$, where $\bar X$ is the sample mean. This method is derived from mathematical properties of the binomial distribution (coin flips). It requires certain assumptions (look up "Hardy-Weinberg equilibrium"), but it is more efficient than method 1.


3. Using `lapply` or a `for` loop, repeat this 2000 times. To store the results, extend the second dataframe to have 2000 rows and 2 columns.
4. Plot the results as a scatterplot (method 1 vs method 2) and a pair of histograms (method 1 vs method 2). 
5. Which estimation method is higher on average?
6. Which estimation method is more stable on average?
7. Which estimation method is closer to the truth on average? The variance of a binomial random variable with N trials and probability $p$ is $Np(1-p)$. If you didn't get to see why in the probability lecture, or if you want a refresher, ask and we can work through it at the board.
8. How extreme is the assortative mating in your example? Wrap all of your code in a function with an input parameter to vary the extent of assortative mating. Test different values and display the estimators' performance.

