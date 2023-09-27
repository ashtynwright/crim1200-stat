library(tidyverse)
library(palmerpenguins)
library(ggplot2)
library(ggthemes)
ggplot2::theme_set(ggplot2::theme_minimal)

#LOAD IN THE DATA AFTER LOADING PACKAGES! 
income.data <- read_csv("/Users/ashwright/Documents/GitHub/crim1200-stat/Data/income.data.csv")


# what type of variables are in the data?
class(income.data$education)
class(income.data$gender)
class(income.data$income)
class(income.data$happiness)

# describe each variable quantitatively
# quantitative variable: income
summary(income.data$income)

#quantitative variable: happiness
summary(income.data$happiness)

#categorical: gender
income.data %>% count(gender)
table(income.data$gender)

#categorical: education
income.data %>% count(education)


# describe each one visually
# income
#base r
hist(income.data$income)
#ggplot
income.data %>% ggplot(aes(x=income)) + geom_histogram()

# happiness
income.data %>% ggplot(aes(x=happiness)) + geom_histogram()

# education
barplot(table(income.data$education))

# gender
barplot(table(income.data$gender))



# study the relationship between happiness and education
ggplot(data = income.data, aes(x=happiness, fill=education)) + geom_histogram()

# str happiness and gender
ggplot(data = income.data, aes(x=happiness, fill=gender)) + geom_histogram()





