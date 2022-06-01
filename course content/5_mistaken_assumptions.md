## Mistaken assumptions

Statistical inference requires assumptions. This is unfortunate and limiting in light of the many "unknown unknowns" hiding behind the phenomena we wish to study. One major agenda in modern statistics is to reduce these assumptions to their barest form. This is often done by making models that are infinitely flexible in some way: lines of best fit that [bend and wiggle](https://en.wikipedia.org/wiki/Kernel_regression), categorical assignments with [no limit](https://www.ncbi.nlm.nih.gov/labs/pmc/articles/PMC6583910/) on the number of categories, probability mass functions with [no pre-specified shape](https://en.wikipedia.org/wiki/Kernel_density_estimation) or generating mechanism, or procedures that require only  abstract properties: "non-decreasing", "symmetric", "independent", "exchangeable". It can also be done via the study of "misspecification", which aims to say, "Even if my model is wrong about this, that, or the other, it will yield results that are reliable in some specific sense." We won't have the mathematical firepower to dig into all of these, but spectacular examples of this type of analysis include [generalized estimating equations](https://en.wikipedia.org/wiki/Generalized_estimating_equation), [doubly-robust causal effect estimation](https://arxiv.org/abs/0804.2958), and [causal effect estimation with many invalid instrumental variables](https://arxiv.org/abs/1401.5755). 

In this session, we will explore the principle that sometimes, a statistical method must tolerate when its assumptions are mistaken. 

### Doubly-robust causal effect estimation

Scientific studies, especially studies of people, often have missing observations. Even in a controlled trial, the ideal would be to compare each patient's outcome under treatment against the same patient's outcome under a placebo or another control setting. This is often impossible. We must rely on instead on the treated and untreated patients being comparable, usually due to randomization. If there are extra missing observations due to participants dropping out of the trial after treatment assignment, the problem becomes even more complicated. Participants that disappear may not be comparable to those that remain. They might disappear disproportionately from the treatment group if the treatment is  a burdensome diet and exercise program. Even if drop-out is balanced between treatment and control, they may be sicker or healthier to begin with, or different in other ways, and the treatment may be more or less effective in them compared to the whole population of interest.

Today's demo is on tools that solve some but not all of these issues. Specifically, we will consider a simulated dataset with 1,000 patients, $i = 1...1000$. 

- Each patient will have an outcome $y_i$ between 1 and 100. 
- For some patients, the outcome will not be observed/available to us. We will write $t_i=0$ if patient $i$ has a missing outcome or $t_i=1$ if they do not. 
- Each patient will have a record of socioeconomic status called $x_i$ with values from 1 to 5. We can use $x_i$ to help predict outcomes or missingness.



### Footnotes

This example is simplified from the discussion in [this paper](https://arxiv.org/abs/0804.2958).


