
# calculate lof for the quantitative variable
data$lof <- lofactor(data[,2],k=2)

# for lof > 1 outlier
# for lof < 1 no outlier
# assign score depending on lof
# assign 0 if no outlier

