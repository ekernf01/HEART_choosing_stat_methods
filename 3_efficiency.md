## Efficiency

### Background

In today's demo, you are motivated by the need to make efficient use of limited samples. This need is central in many applications. One broad example is late-stage clinical trials: pre-planned studies including rare outcomes such as heart attacks can require tens of thousands of participants. Another example is genomics: a small number of RNA sequencing samples circa 2020 could easily cost thousands of dollars, and some important biological signals are present in low-abundance genes that are hard to quantify. A third example is in predicting election outcomes. The ground truth, meaning the elections themselves, happens infrequently; no amount of money can buy more data.  

This aspect of statistics is EXTREMELY heavily studied, and there are some common techniques that automatically inherit justifications about being the most powerful or most efficient option. These include maximum likelihood estimation, which chooses parameters to maximize the probability of the observed data, and Bayesian inference, which imposes certain prior assumptions on the unknown parameters and then rigidly follows the rules of mathematical probability. There are also competing techniques with other virtues that you might use sometimes, even though they are not the most efficient. In these situations, what are you gaining or losing with one method or the other?

### Exercises

In human genetics, samples often contain people of multiple ancestries, and separating them out can be interesting and useful for anthropology and medical studies. This is often best done using genetic data themselves. Some methods for doing this attempt to operate in a way that gives equal weight to each locus. (A **locus** is a spot on the genome; plural **loci**). In other words, loci with high variance are not supposed to influence the results more than loci with low variance. This example is about estimating genotype variance at some genetic loci, so you can later assign them commensurate weight. 

By "variance", I mean a specific quantity that was defined in the stats lecture as $Var[X] = E[(X - E[X])^2]$. Here, $X$ will be the number of copies of the most common allele, which is 0, 1, or 2 for each person. In this equation $E[X]$ is the population allele frequency, which is what you would get if you genotyped everybody and averaged the results. In this demo, you will compare two existing methods for estimating variance.

Method 1 is the R function `var`, which uses the formula $\frac{(X_1 - \bar X)^2 + ... + X_N - \bar X)^2}{N-1}$. It plugs in the sample mean $\bar X$ in place of the population allele frequency $E[X]$, and it averages the squared deviations across each person in the sample. The denominator we'll use is N-1, not N, for fascinating reasons beyond the scope of this course. 

Method 2 is to compute $\bar X (2-\bar X)/2N$, where $\bar X$ is the sample mean. This method is derived from mathematical properties of the binomial distribution (coin flips). It requires certain assumptions (look up "Hardy-Weinberg equilibrium"), but it is more efficient than method 1.

Type your answers in a Word document and your code in an R script and email them to Eric as `LAST_FIRST_binomial_variance.docx` and `LAST_FIRST_binomial_variance.R`. 

1. Simulate allele counts for 1 locus in 1,000 people using the function `rbinom`. Store the result in a dataframe.
2. Compute the variance by method 1 and method 2. Store the results in a separate dataframe with one row and two columns.
3. Repeat this 1,000 times, extending the second dataframe to have 1000 rows and 2 columns.
4. Plot the results as a scatterplot (method 1 vs method 2) and a pair of histograms (method 1 vs method 2). 
5. How similar are the estimates? 
6. Which ones are higher or lower on average?
7. Which ones are more stable on average?
8. Which ones are closer to the truth on average? Remember, the estimate itself is not the same as the parameter being estimated. You need to determine the true parameter mathematically, based on the PMF you used to set up your simulation.
9. What allele frequency did you choose? Wrap all your code in a function that takes an allele frequency as input. Repeat the test at 3 very different allele frequencies and comment on the results.


### TTIMCTYCUA: the truth is more complex than your classes usually admit

- Actually, population allele frequency is usually described as being between 0 and 1, not 0 and 2, but I'll ignore that here. 
- For today, you may assume you have a simple random sample that is representative of "everybody". There are no family members and people only share alleles by chance. In real studies, you have to be more careful about family members, whose genotypes are not independent, and you have to make specific plans to get reasonable representation of non-European ancestries.
 
