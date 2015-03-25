data$afraus_score <- data$benford_score*1+data$control_score*0+data$lof_score*0
data$score_filter <- data$afraus_score>0.5
results           <- data.matrix(table(data$test,data$score_filter))

TP        <- results[2,2]
TN        <- results[1,1]
Accuracy  <- (TP+TN)/(nrow(data))
FP        <- results[1,2]
FN        <- results[2,1]
precision <- TP/(TP+FP)
F1        <- (2*TP)/(2*TP+FP+FN)

