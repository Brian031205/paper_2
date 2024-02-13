#### Preamble ####
# Purpose: Figure 2 replication
# Author: Kimlin Chin
# Date: 22 February 2022
# Contact: kimlin.chin@mail.utoronto.ca
# License: MIT

## Data Sources:

# Martin JA, Hamilton BE, Osterman MJK, et al. Births: Final data for 2015. 
# National vital statistics report; vol 66, no 1. Hyattsville, MD: National Center for Health Statistics. 
# 2017. https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf.
# Data can be found on page 35,
# Table 9. Birth rates, by live-birth order and race and Hispanic origin of mother: United States, 1980–2015
# Columns: Fertility Rate, All races[years 1980-2015]

# Martin JA, Hamilton BE, Osterman MJK, Driscoll AK. Births: Final Data for 2019. National
# Vital Statistics Reports; vol 70 no 2. Hyattsville, MD: National Center for Health
# Statistics. 2021. DOI: https://dx.doi.org/10.15620/cdc:100472.
# Data can be found on page 13,
# Table 1. Births and birth rates: United States, 2010–2019, and by race and Hispanic origin, United States, 2016–2019
# Columns: Fertility Rate, All races and origins[years 2016-2018]

# Hamilton BE, Martin JA, Osterman MJK. Births: Provisional data for 2020. Vital Statistics
# Rapid Release; no 12. Hyattsville, MD: National Center for Health Statistics. May
# 2021. DOI: https://doi.org/10.15620/cdc:104993.
# Data can be found on page 6,
# Table 1. Births and birth rates, by age of mother: United States, final 2019 and provisional 2020
# Columns: 2020 Rate, 2019 Rate, Age of mother[All ages]

# I crosschecked the data from these 3 reports with the data in fig_1.csv provided by 
# the authors of the paper 
# Kearney, Melissa S., Phillip B. Levine, and Luke Pardue. 2022. 
# "The Puzzle of Falling US Birth Rates since the Great Recession." 
# Journal of Economic Perspectives, 36 (1): 151-76. DOI: 10.1257/jep.36.1.151 
# and it is the same.


#### Workspace setup ####
# Load libraries
library(tidyverse)


# Read in the raw data.
data <- read_csv("inputs/data/osf-past-normality-regret-replication-exp2-data-v2.csv")
str(data)

# calculate condition
data$Sc3condition <- 0
data$compensationagg <- 0
data$regretagg <- 0

for (i in 1:nrow(data)){
  if (!is.na(data$Sc3_C1_text[i])){
    data$Sc3condition[i] <- 1
    data$compensationagg[i] <- data$sc3_c1_compensation[i]
    data$regretagg[i] <- data$sc3_c1_regret[i]
  }
  else if (!is.na(data$Sc3_C2_text[i])){
    data$Sc3condition[i] <- 2
    data$compensationagg[i] <- data$sc3_c2_compensation[i]
    data$regretagg[i] <- data$sc3_c2_regret[i]
  }
  else if (!is.na(data$Sc3_C3_text[i])){
    data$Sc3condition[i] <- 3
    data$compensationagg[i] <- data$sc3_c3_compensation[i]
    data$regretagg[i] <- data$sc3_c3_regret[i]
  }
  else {
    data$Sc3condition[i] <- NA
    data$compensationagg[i] <- NA
    data$regretagg[i] <- NA
  }
}

#value labels
data$Sc3conditionl<-factor(data$Sc3condition,levels = c(1,2,3), labels=c("Routine", "Self-produced exception", "Other-produced exception"))

# Make plot
ggplot(data, aes(x=Sc3conditionl, y=mean, group = factor(1))) +
  geom_line() +
  geom_point() + 
  xlab("Condition") +
  ylab("Compensation") +
  expand_limits(y=0) +
  geom_errorbar(aes(ymin=mean-ci, ymax=mean+ci), width=.1) +
  ggtitle("Mean compensation by condition")

# Save plot
ggsave(
  "replication/plots/figure2.png",
  height = 100,
  width = 133.33,
  units = "mm",
  dpi = 900
)