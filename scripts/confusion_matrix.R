results <- data.matrix(table(data$test,data$score_filter))
sum(diag(results))
