library(dataiku)

# Input datasets
data <- dkuReadDataset("data_prepared_2012_predictions")

scores <- data.frame(Nom=character(), 
                 Score=numeric(), 
                 stringsAsFactors=FALSE) 

# We remove zero values (because of the division)
data <- subset(data, data$consomation != 0)

# Scores

# 1) MAPE
scores[1,1] = "MAPE"
scores[1,2] = mean(abs((data$consomation - data$prediction)/(data$consomation)))

# 2) MAPE for site ID01
data01 = subset(data, Site=="ID01")
scores[2,1] = "MAPE ID01"
scores[2,2] = mean(abs((data01$consomation - data01$prediction)/(data01$consomation)))

# 3) MAPE for site ID18
data18 = subset(data, Site=="ID18")
scores[3,1] = "MAPE ID18"
scores[3,2] = mean(abs((data18$consomation - data18$prediction)/(data18$consomation)))

# 4) MAPE for site ID31
data31 = subset(data, Site=="ID31")
scores[4,1] = "MAPE ID31"
scores[4,2] = mean(abs((data31$consomation - data31$prediction)/(data31$consomation)))

# Output datasets
dkuWriteDataset(scores,"scores")
