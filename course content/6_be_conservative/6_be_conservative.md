## Being conservative 

When it's obvious that the exact right answer cannot be determined from a dataset, you need to make a choice about what types of errors are most dangerous. In order to have enough context to introduce this topic, I need to take a detour and discuss *regression*.

TODO: explain linear regression with pictures

Often this boils down to *prediction* versus *inference*. Inference means we want to learn something about the internal mechanisms of the system under study. Prediction means we don't care if the internals are right or wrong, unless it affects the 

 You might decide it's best to fit a model that is on the simpler side, so that it may lack certain effects but at least there is strong evidence for the effects that it does include -- this prioritizes *inference*. Or, it may be best to fit a more complex model. Even if some of the effects it includes are wrong, it is capable of making good predictions. 

This can become complicated when you use a predictive model as a component of an inference pipeline. Sometimes you need to add complexity to the predictive model in order to control false positives (and achieve lower complexity) downstream. 

### Quantitative details

TODO: explain NHST...

### A note for the future

You often see people arguing about information criteria called BIC and AIC, which are used for model selection. These people are often arguing because they were trained under two different philosophies ("Bayesian" versus "Frequentist"). AIC happens to be phrased in Frequentist terms and BIC in Bayesian terms. For decades, Bayesian and Frequentist schools of thought were essentially at war, and a surprising number of otherwise respectable scholars remain caught up in that. 

The flame wars are unfortunate because the most important difference between BIC and AIC is not Bayesian vs Frequentist; it is inference versus prediction. BIC tends to select smaller models with strong evidence that they are right; AIC tends to select larger models that make the best possible predictions. Neither of these goals is inherently Bayesian or Frequentist. For example, if a dogmatic Frequentist wanted to prioritizes inference over predictive accuracy, it would still be possible. It is often done via hypothesis testing methods that control the rate of false positives or some related quantity. 

You might ask, can we not do both? Why are good inferences not compatible with good predictions? Unfortunately, it turns out that [optimal prediction and optimal inference are incompatible goals](https://academic.oup.com/biomet/article-abstract/92/4/937/389439?redirectedFrom=fulltext). 