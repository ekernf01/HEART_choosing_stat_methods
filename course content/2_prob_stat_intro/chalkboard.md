## Binomial random variables and probability fundamentals

*This document got screen-shared and it served as the "chalk board" during our second class.*

- Independence: $P(E_1 \:\mathrm{ and }\: E_2) = P(E_1)P(E_2)$
- Probability mass function of an RV $X$ takes possible values as inputs and produces probabilities as outputs. 

    $f_X(x)$ = probability that X=x

- Binomial random variable is the number of heads and we write $X \sim Bin(n, p)$ where $n$ is the number of flips and $p$ is the probability of heads. 

- Two coin flips, each with 50% prob of heads
    - $f_X(0) = 0.25 = 0.5 * 0.5$
    - $f_X(1) = 0.5$ due to multiple orderings
    - $f_X(2) = 0.25$ by symmetry 

- Expectation or expected value: 
    - Binomial RV with n=2: $E[X] = \sum_{x \in 0...2} xf_X(x)$
    - Any discrete RV: $E[X] = \sum_{x \in \mathbb Z} xf_X(x)$
    - Any continuous RV: $E[X] = \int_{x \in \mathbb R} xf_X(x)dx$
    
- Linearity of expected value:

    $$E[X + cY] = E[X] + cE[Y]$$ ALWAYS

This example below: $X\sim Binomial(15, 0.5)$

- $E[X] = \sum_{x\in 0...15} xf_X(x) = ?????? = 7.5$
- $E[X] = np = 7.5$

- Variance: 
    - $Var[X] = \sum_{x \in \Theta} f_X(x) (x-E[x])^2$ (discrete)
    - $Var[X] = \int_{x \in \mathbb R} (x-E[x])^2f_X(x)dx$ (continuous)

    $Var[X + Y] = Var[X] + Var[Y]$ IF X and Y are independent

### DETOUR: representations of random variables

If $X \sim Bin(n, p)$, then it can be represented as $X_1 + ... + X_n$ where $X_i \sim Bin(1, p)$. 

#### Expectation via a nice representation

$E[X] = E[\sum_{i\in 1...n}X_i] = \sum_{i\in 1...n}E[X_i] = \sum_{i\in 1...n}p = np$

$E[X_i] = \sum_{x \in 0...1} xf_X(x) = 0*(1-p) + 1*(p) = p$

- $f_{X_i}(0) = 1-p$
- $f_{X_i}(1) = p$

#### Variance via a nice representation

- $Var[X] = Var[\sum_{i\in 1...n}X_i] = \sum_{i\in 1...n}Var[X_i] = np(1-p)$

$$\begin{align}
Var[X_i] 
&= \sum_{x\in 0...1} f_X(x) (x-p)^2 \\
&= (1-p)(0-p)^2 + p(1-p)^2 \\
&= (1-p)p p + (1-p)(1-p)p \\
&= [p + (1-p)] (1-p)p \\
&= (1-p)p
\end{align}$$

- $f_{X_i}(0) = 1-p$
- $f_{X_i}(1) = p$
