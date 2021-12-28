setwd("~/Desktop/jhu/teaching/HEART choosing statistical methods/4_outlier_robustness/")
GeneActivity = as.data.frame(t(read.csv("SyntheticGeneActivityData.csv", row.names = 1)))

{
  png("timeseries_gene7.png", width = 300, height = 300)
  plot(rowSums(GeneActivity), GeneActivity$x_g7, xlab = "Time (sort of)", ylab = "Gene 7 RNA", 
       main = "A snapshot of many cells")
  dev.off()
}
{
  png("gene7_rna_vs_rna_velocity.png", width = 300, height = 300)
  plot(GeneActivity$x_g7, GeneActivity$velocity_x_g7, 
       xlab = "RNA concentration", 
       ylab = "RNA velocity", 
       main = "RNA decay dynamics")
  dev.off()
}

# My solutions -- linear regression and quantile regression
ls = lm(velocity_x_g7 ~ x_g7, data = GeneActivity)
qr = quantreg::rq(velocity_x_g7 ~ x_g7, data = GeneActivity)
plot(GeneActivity$x_g7, GeneActivity$velocity_x_g7, 
     xlab = "RNA concentration", 
     ylab = "RNA velocity", 
     main = "RNA decay dynamics")
abline(a = ls$coefficients[["(Intercept)"]], b = ls$coefficients[["x_g7"]], col = "red")
abline(a = qr$coefficients[["(Intercept)"]], b = qr$coefficients[["x_g7"]], col = "blue")
