
library(ggplot2)
library(reshape2)

library(ggplot2)
library(reshape2)

data <- read.csv("/cloud/project/inputs/data/table2.csv")

data <- data[-1,]
data <- data[, c(1, 3, 5)]

names(data) <- c("Condition", "Regret", "Luck")
data$Regret <- as.numeric(as.character(data$Regret))
data$Luck <- as.numeric(as.character(data$Luck))
data_melted <- melt(data, id.vars = 'Condition')

ggplot(data_melted, aes(x = variable, y = value, fill = Condition)) + 
  geom_bar(stat = 'identity', position = 'dodge') +
  scale_fill_grey(start = 0.8, end = 0.2) +  
  theme_minimal() +
  labs(x = '', y = '') +  # Removing axis labels as in the image
  theme(legend.title = element_blank(),  
        legend.position = 'bottom') +  
  scale_y_continuous(labels = scales::percent_format()) 