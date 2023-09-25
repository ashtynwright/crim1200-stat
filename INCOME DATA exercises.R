# load packages
library(tidyverse)
library(ggplot2)


# summarize the data
income.data %>% summarize(m=mean(income, na.rm = TRUE),
                          sd=sd(income, na.rm = TRUE),
                          n=n()) #income data summarized by earnings


income.data %>% summarize(m=mean(happiness, na.rm = TRUE),
                          sd=sd(happiness, na.rm =TRUE),
                          n=n()) #income data summarized by net happiness

#scatterplot comparing income data and happiness
income.data %>% ggplot(aes(x=income, y=happiness)) + geom_point()

#scatterplot comparing income data and happiness, grouped by education
income.data %>% ggplot(aes(x=income, y=happiness, color=education)) + geom_point()



#comparing income across gender
ggplot(data = income.data, aes(x=income, fill=gender)) + geom_histogram()

# ^^ facet wrapped
ggplot(data = income.data, aes(x=income, fill=gender)) +
  geom_histogram() +
  facet_wrap(vars(gender))