# define afraus_score as weighted mean of three models scores
data$afraus_score <- data$benford_score*0.4+data$control_score*0.4+data$lof_score*0.2
# define which records has afraus_score greater than 0.5
data$score_filter <- data$afraus_score>0.5
results           <- data.matrix(table(data$test,data$score_filter))
# compute true positive, true negative
TP        <- results[2,2]
TN        <- results[1,1]
# compute accuracy
Accuracy  <- (TP+TN)/(nrow(data))
# compute false positive
FP        <- results[1,2]
# compute false negative
FN        <- results[2,1]
# compute precision
precision <- TP/(TP+FP)


