## Statistics 

### Background

There are two paths into statistics. One is mathematical, meaning it is based on careful thought. The other is empirical, meaning it is based on observations. Today's session is devoted to one at the expense of the other, but if you travel them both, you will have a more free and flexible mind. So, let me start by describing the two.

For a coherent picture, I must start with a third concept. **Probability theory** is a branch of mathematics that precisely describes random processes. It initially centered around gambling, but by the early 1900's, it was growing in response to important questions in physics and financial economics. Here's a classic probability problem. *Suppose a stock price changes by 0.1% every hour, going up with 51% probability and down with 49% probability. What is the chance it will exceed a 3% increase some time in the first 30 days?*

**Mathematical statistics** is a complement to probability, working backwards rather than forwards. *Given records of prices for your stock, how likely is it to go up each hour instead of down? What is the range of plausible values for this unknown parameter? Similarly, is 0.1% per hour the right rate of updating for your stock price data, or does it change more often?* These questions can be answered mathematically. 

**Applied statistics**, of course, faces more than just mathematical questions. It is seldom obvious what types of mathematical rules to consider and how much flexibility to allow. *Is the idea of regularly updating by small percentages workable, or are there irregular or violent shocks that must be considered? How would our decisions be affected if we made the wrong assumptions about the behavior of this stock?* These are empirical questions, and their answers depend on observation.

This course will consider both types of questions, as well as questions whose answers require both modes of thought. but we need simple formal models as a jumping-off point. Today, as a bridge into mathematical statistics, we'll discuss some basic probability concepts using one of the simplest and most common statistical models: the "Binomial distribution."

### Learning objectives

- Describe binomial random variables.
- Define probability mass functions. Write them out for binomial random variables. 
- Define expected value $E[X]$ and variance $Var[X]$ of a random variable $X$. 
- Define independence for random variables. Describe pairs of random variables that are independent or not.
- Calculate expected value and variance of a binomial random variable in two different ways.
- Describe the difference between a parameter and an estimate of that parameter.

### Background

A "random variable" is exactly what it sounds like: a number that results from a random process, such as a coin flip, a card deck shuffle, a decaying radioisotope, a meiotic recombination, a stock market fluctuation, or a thermal motion at nanometer scale. A "binomial" random variable is what you get by flipping a coin $N$ times and counting the number of heads. 

A "probability mass function" takes possible values of a random variable as input and yields their probabilities as output. If my random variable is the number of heads after two coin flips, the inputs to the PMF can be 0 or 2, each with 25% probabilty, or 1, with 50% probability (the probabilities are the outputs). In symbols, $f_X(0) = f_X(2) = 0.25$ and $f_X(1) = 0.5$, where $f$ is the probability mass function and $X$ is the random variable. 

The "expected value" or "the mean" is the average over all possible results, each weighted by its probability. In the example, it is $0.25 \times 0 + 0.5 \times 1 + 0.25 \times 2 = 1$. For a random variable $X$, the expected value is written $E[X]$.

The "variance" is the expected value of the square of the distance to the mean. (Squaring it prevents it from being negative.) In the example, it is $0.25 \times (0-1)^2 + 0.5 \times (1-1)^2 + 0.25 \times (2-1)^2 = 0.5$. For a random variable $X$, the variance is written $Var[X]$.

Coin 1 | Coin 2 | Total | Prob | Contribution to mean | Contribution to variance|
-------|--------|-------|------|----------------------|-------------------------|
H      |H       | 2     | 0.25 | 0.5                  | 0.25                    |
H      |T       | 1     | 0.25 | 0.25                 | 0                       |
T      |H       | 1     | 0.25 | 0.25                 | 0                       |
T      |T       | 0     | 0.25 | 0                    | 0.25                    |

Two random variables are "independent" if each contains no information about the other. Mathematically, this happens when $P(E_1 {\, \rm and \,} E_2) = P(E_1)P(E_2)$ for any pair of events $E_1$ and $E_2$ where each event involves only the respective variable. We have assumed the coins are independent. 

For any two random variables, $E[X+Y] = E[X] + E[Y]$. If they are also independent, then $Var[X+Y] = Var[X] + Var[Y]$. This can be proven mathematically -- take a proper stat class if you'd like to see how.

So far, this has all been probability. Let's now talk statistics. If you don't know $E[X]$ and $Var[X]$ ahead of time, you might look at some coin flips and try to estimate them. A reasonable estimator of $E[X]$ is the sample average. A reasonable estimator of $Var[X]$ will be discussed in the next session. Do not be fooled: always distinguish between the estimator and the true underlying quantity it is trying to estimate. 

### Exercises

Type your answers in a Word document and your code in an R script and email them to Eric as `LAST_FIRST_binomial.docx` and `LAST_FIRST_binomial.R`. If you want to write math symbols more easily, you could also try writing **markdown** using an editor like [this one](https://upmath.me/).

1. If the coin is weighted so as to have a 1/3 chance of landing heads, but you still flip it twice, then what is the PMF of the total number of heads? The expectation? The variance? What if you flip it 3 times?
2. Suppose the coins we flip are sentient, telekinetic, and anxiously conformist. The second coin, if it sees the first land heads, will also land heads. If it sees the first show tails, it will show tails as well. How does the table above change? What is the expected value? The variance? (This is no longer a binomial RV because the coins are not independent here.)
3. Write a function in R to compute the expected value and variance of a binomial RV given the number of trials and the success probability. You may use the built-in function for the PMF, which is called `dbinom`. 
    - Write out problem 1 as a test case to ensure your code is correct. 
4. Draw 10,000 independent binomial RV's, each with 25 trials and success probability $0.12345$. Estimate the mean and variance of the results from your samples. You can use the built-in functions `mean` and `var`. Are they close to your code's results?
5. You can represent a binomial RV as a sum of independent RV's, each of which is simple on its own. This leads to simple, efficient formulas for the mean and variance that work for any $p$ and $n$. Figure out how to do this.
6. Above, you used `dbinom`. It would be nice to know what that does. What is the PMF of a binomial RV with success probability $p$ over $n$ independent trials? Look it up on Wikipedia or a reference of your choice. Explain why each component of the formula is present and what would happen if you left each part out.






