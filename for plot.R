official <- runif(100000)
autocrat <- runif(100000)

data <- as.data.frame(cbind(autocrat, official))
data$total <- data$autocrat + data$official

data$outcome = ifelse(data$total < 0.5, 0, 1)
data$revolt <- dplyr::recode_factor(data$outcome, '1' = "impossible revolt", '0' = "possible revolt" )

#data[1,1]

#plot(data = data, autocrat~official, col = outcome)
library(ggplot2)

ggplot(data = data, aes(x = official, y = autocrat, colour = revolt))+
  geom_point()+
  theme_minimal()+
  #ggtitle("Possibility of the revolt based on the autocrat's and the official's qualities")+
  ylab("The autocrat's quality")+
  xlab("The official's quality")


data_vote <- as.data.frame(cbind(autocrat, official))
data_vote$total <- data_vote$autocrat + data_vote$official
data_vote$vote <- 1 - (data_vote$total / 2)
data_vote$fraud <- max(0.5 - data_vote$vote, (0.5-data_vote$official)/2, 0)
data_vote$fraud <- 0

for (i in length(data_vote$total)){
  data_vote$fraud[i] <- max(0.5 - (data_vote$vote[i]), (0.5-data_vote$official[i])/2, 0)
}

