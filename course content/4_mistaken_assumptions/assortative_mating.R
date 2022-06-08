#' Generate allele counts with simulated assortative mating.
#'
#' This function follows a "mixture model" where there's two possibilities. Each locus can be either:
#' - so strongly affected by assortative mating that the two alleles are identical
#' - not affected at all, so the alleles are independent.
#' The chance for the first outcome is the input strength_of_assortative_mating. 
#' 
generateAlleleCounts = function(allele_frequency, strength_of_assortative_mating, n){
  # Check user input -- should be numbers from 0 to 1
  stopifnot(is.numeric(allele_frequency))
  stopifnot(is.numeric(strength_of_assortative_mating))
  stopifnot("strength_of_assortative_mating must be between 0 and 1" = allele_frequency > 0)
  stopifnot("strength_of_assortative_mating must be between 0 and 1" = allele_frequency < 1)
  stopifnot("Allele frequency must be between 0 and 1" = allele_frequency > 0)
  stopifnot("Allele frequency must be between 0 and 1" = allele_frequency < 1)
  extreme_assortative_mating = 2*rbinom(size = 1, prob = allele_frequency, n=n)
  no_assortative_mating = rbinom(size = 2, prob = allele_frequency, n=n)
  ifelse(rbinom(size = 1, prob = strength_of_assortative_mating, n), 
         extreme_assortative_mating,
         no_assortative_mating)
}

#' This function uses the Law of Total Variance to compute the variance of the outcomes from the above mixture model.
#'
#' Law of Total Variance: https://en.wikipedia.org/wiki/Law_of_total_variance
#' 
computeVariance = function(allele_frequency, strength_of_assortative_mating){
  # Check user input -- should be numbers from 0 to 1
  stopifnot(is.numeric(allele_frequency))
  stopifnot(is.numeric(strength_of_assortative_mating))
  stopifnot("strength_of_assortative_mating must be between 0 and 1" = allele_frequency > 0)
  stopifnot("strength_of_assortative_mating must be between 0 and 1" = allele_frequency < 1)
  stopifnot("Allele frequency must be between 0 and 1" = allele_frequency > 0)
  stopifnot("Allele frequency must be between 0 and 1" = allele_frequency < 1)
  variance_if_independent = 2*allele_frequency*(1-allele_frequency)
  variance_if_identical = 4*allele_frequency*(1-allele_frequency)
  strength_of_assortative_mating * variance_if_identical + (1-strength_of_assortative_mating)*variance_if_independent
}

# Check the math. These should all be roughly the same.
computeVariance(0.5, 0.5)
var(generateAlleleCounts(0.5, 0.5, 100000))
computeVariance(0.3, 0.3)
var(generateAlleleCounts(0.3, 0.3, 100000))
computeVariance(0.3, 0)
var(generateAlleleCounts(0.3, 0, 100000))
computeVariance(0.3, 1)
var(generateAlleleCounts(0.3, 1, 100000))

# How I generated the data for the last question
library("magrittr")
filenames = paste0("demo", 1:9, ".csv")
for(f in filenames){
  am = sample(c(0, 0.3), 1)
  sapply( (1:9)/10, function(af) generateAlleleCounts(af, am, 1000) ) %>% 
    as.data.frame %>% 
    set_colnames(paste0("Locus", 1:9)) %>% 
    write.csv(f)
}
