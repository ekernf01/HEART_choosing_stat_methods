
set.seed(0)
patients = data.frame(
  # you could probably find a more realistic age & sex distribution 
  # for the population of people hospitalized with covid-19.
  # For example, this review finds that it skews slightly male. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7467845/
  age = 1:100, 
  hormonal_sex = rbinom(0.5, 100),
  # This IS the right distribution because we'll randomize the treatment.
  ivernectin = rbinom(0.5, 100),
)
effects = data.frame(
  # It's really hard to find estimates of these parameters.
  # This paper gets close, but represents age as above vs below 45 instead of treating it as a continuous effect.
  # It also uses a continuous measure of hospital stay length, not a cutoff at 20 like we have done.
  # https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8759704/
  age = 0.1,
  hormonal_sex = 0.1,
  ivernectin = -0.5,
)

