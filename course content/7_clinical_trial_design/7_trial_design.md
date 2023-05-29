## Clinical trial design

You're serving as a statistician at a large academic medical center. A team of doctors there wants to determine whether the antiparasitic drug Ivernectin improves outcomes of patients hospitalized with covid-19. This is a subject of [considerable controversy](https://astralcodexten.substack.com/p/ivermectin-much-more-than-you-wanted), and a carefully designed study would need a lot more thought than we can give it here. For instance, we won't consider different possible "endpoints", such as lung capacity post-recovery, 6-minute walking distance post-recovery, [severity index](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7832368/), length of hospital stay, rate of ventilator use, rate of death, and so on. We won't consider random allocation of patients to treatment/control, informed consent, blinding, or the [MCID](https://pubmed.ncbi.nlm.nih.gov/17448732/#:~:text=The%20minimum%20clinically%20important%20difference%20(MCID)%20represents%20the%20smallest%20improvement,in%20reference%20to%20that%20treatment.). And we'll be limited in the amount of flexibility we can allow for the joint effect of age and sex. To stay within the scope of the class, assume that:

- someone else will consider blinding and ethics. 
- The primary endpoint will be "Did the patient EITHER die OR stay hospitalized for over 20 days?" 
- All patients will be allocated to treatment or control with 50% probability. 
- All study participants are statistically independent: there are no phenomena such as virus variants or overflowed hospitals that might affect many study participants at once. 

The basic framework we'll use for analysis is called logistic regression. Logistic regression assumes the data come from a model like this.

- $x_1=0$ if patient assigned to Ivernectin, otherwise $x_1=1$
- $x_2=0$ if patient hormonally female upon admission, $x_2=0$ if patient hormonally male. (I chose to use hormones over gender identity or biological sex in this example because I expect the biggest effects on covid-19 severity to result from hormonal effects on the immune system.)
- $x_3$ is the patient's age
- $z = \beta_0 + \beta_1*x_1 + ... \beta_2*x_2$. The $\beta$'s are unknown measures of effect size. They will be estimated by a piece of software, which will be introduced in the example code. $z$ is different for each patient and it's a measure of risk ranging from $-\infty$ to $\infty$. 
- $p = \sigma(z)$ where $p$ is the probability that the patient will die or stay in the hospital more than 20 days and $\sigma$ is a "sigmoid" function that squashes continuous scores into [0,1]. Specifically, $\sigma(z) = \frac{1}{1 + \exp(-z)}$.
- $y = Bernoulli(p)$ is a coin-flip converting the probability into the outcome. (A Bernoulli distribution is just a Binomial distribution with $n=1$.)

Software in R can use data ($X$ and $Y$) to find parameters ($\beta$'s) and predict risk per-patient ($z$, $p$). To describe uncertainty in the parameters, the software can generate 95% confidence intervals which have a specific and subtle meaning that we unfortunately won't cover in depth. For purposes of this specific example, and backed up by much philosophical and quantitative hand-wringing, you can say the true parameter lies within the 95% confidence interval with 95% probability.

Here are the questions the doctors have asked you. 

- How many patients do we need to enroll for the trial to be "well-powered"? For now, "well-powered" means for a large true effect of Ivernectin ($\beta_1 = -0.5$), we have at least an 85% chance that the confidence interval won't overlap 0.
- The trial will record age, hormonal sex, height, BMI, and self-reported race. Some of these have an obvious association with covid-19 severity, most obviously age. In the final analyses, should these factors be included? Specifically, does including them increase or decrease bias in estimates of $\beta_1$? And does it increase or decrease the size of the confidence interval?

Conduct a simulation study to answer these questions. 

