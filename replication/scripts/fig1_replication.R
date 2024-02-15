# Figure 1 replication

library(ggplot2)
library(reshape2)
library(ggplot2)
library(readr)
library(dplyr)


library(ggplot2)
library(reshape2)

# Read the data from Exp1.csv
data <- read.csv("/cloud/project/inputs/data/Ex1.csv")
data <- data[-1,]

# Select columns by index assuming the order is as follows:
# Condition name, Percentage for Regret, Percentage for Social norm (injunctive),
# Percentage for Social norms (descriptive), Percentage for Negative affect
data <- data[, c(1, 3, 5, 7, 9)]

# Assigning the correct names to the columns
names(data) <- c("Condition", "Regret", "Social_norm_injunctive", "Social_norms_descriptive", "Negative_affect")

# Convert the percentage columns to numeric (as.character is used to handle factors)
data$Regret <- as.numeric(as.character(data$Regret))
data$Social_norm_injunctive <- as.numeric(as.character(data$Social_norm_injunctive))
data$Social_norms_descriptive <- as.numeric(as.character(data$Social_norms_descriptive))
data$Negative_affect <- as.numeric(as.character(data$Negative_affect))

# Melt the data for use with ggplot2
data_melted <- melt(data, id.vars = 'Condition')

# Plotting
ggplot(data_melted, aes(x = variable, y = value, fill = Condition)) + 
  geom_bar(stat = 'identity', position = 'dodge') +
  scale_fill_grey(start = 0.8, end = 0.2) +  # Adjust the colors to match the image
  theme_minimal() +
  labs(x = '', y = '') +  # Removing axis labels as in the image
  theme(legend.title = element_blank(),  # Removing legend title
        legend.position = 'bottom') +  # Moving legend to bottom
  scale_y_continuous(labels = scales::percent_format())