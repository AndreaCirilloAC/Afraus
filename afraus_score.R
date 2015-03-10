# scoring rules
# Benford
  #outlier if p-value between 0 and 0.05 ( 95% confidence interval)
  # 0.05 : 1 = 0:100
# Local Outlier Factor
  # outlier for lof equal or greater then 1
  # 1: 1 = 100: max(lof)
# Control Chart
  # outlier if greater than UCL or less than LCL
  # for x > UCL
    # 1: UCL = 100:max(X)
  # for x < LCL
    # 1: LCL = 100:min(X)

# for non outlier values , 0 is assignes