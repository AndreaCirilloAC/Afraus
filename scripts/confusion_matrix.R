confusion_matrix          <- data.matrix(table(data$test,data$score_filter))
# compute true positive, true negative
TP        <- confusion_matrix[2,2]
TN        <- confusion_matrix[1,1]
# compute accuracy
Accuracy  <- (TP+TN)/(nrow(data))
# compute false positive
FP        <- confusion_matrix[1,2]
# compute false negative
FN        <- confusion_matrix[2,1]
# compute precision
precision <- TP/(TP+FP)


