
data <- read.csv("/cloud/project/inputs/data/osf-past-normality-regret-replication-exp1-data.csv", header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")
data$Sc1_regret <- factor(data$Sc1_regret, levels = c(1,2), ordered = TRUE, labels = c("Exception Jones", "Routine Smith"))
data$sc1_socnorms1 <- factor(data$sc1_socnorms1, levels = c(1,2), ordered = TRUE, labels = c("Exception Jones", "Routine Smith"))
data$sc1_socnorms2 <- factor(data$sc1_socnorms2, levels = c(1,2), ordered = TRUE, labels = c("Exception Jones", "Routine Smith"))
data$sc1_combinednorms <- factor(data$sc1_combinednorms, levels = c(1,2), ordered = TRUE, labels = c("Exception Jones", "Routine Smith"))

data$Sc3condition1 <- NA
data$compensationagg1 <- NA
data$regretagg1 <- NA

data <- transform(data, Sc3condition1 = ifelse(!is.na(Sc3_C1_text), 1, ifelse(!is.na(Sc3_C2_text) | !is.na(Sc3_C3_text), 2, NA)),
                  compensationagg1 = ifelse(!is.na(Sc3_C1_text), sc3_c1_compensation, ifelse(!is.na(Sc3_C2_text), sc3_c2_compensation, ifelse(!is.na(Sc3_C3_text), sc3_c3_compensation, NA))),
                  regretagg1 = ifelse(!is.na(Sc3_C1_text), sc3_c1_regret, ifelse(!is.na(Sc3_C2_text), sc3_c2_regret, ifelse(!is.na(Sc3_C3_text), sc3_c3_regret, NA))))

data$Sc3conditionl1 <- factor(data$Sc3condition1, levels = c(1, 2), labels = c("Routine", "Exception"))

data$compensationaggrecoded1 <- data$compensationagg1 - 1
data$regretaggrecoded1 <- data$regretagg1 + 1

fig3 <- ggplot(data, aes(x = Sc3conditionl1, y = compensationaggrecoded1)) + 
  geom_violin(trim = FALSE) + 
  geom_jitter(shape = 16, position = position_jitter(height = 0.1, width = 0.2)) + 
  theme_apa() +
  labs(x = "Condition", y = "Compensation") +
  scale_y_continuous(minor_breaks = seq(-10, 15, 5)) +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(width = 0.9), width = 0.2) +
  stat_summary(fun.y = mean, geom = "point", shape = 18, size = 3)

fig4 <- ggplot(data, aes(x = Sc3conditionl1, y = regretaggrecoded1)) + 
  geom_violin(trim = FALSE) + 
  geom_jitter(shape = 16, position = position_jitter(height = 0.1, width = 0.2)) + 
  theme_apa() +
  labs(x = "Condition", y = "Regret") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = position_dodge(width = 0.9), width = 0.2) +
  stat_summary(fun.y = mean, geom = "point", shape = 18, size = 3)

fig3 
fig4