library(ggplot2)
library(tidyverse)

#NORMAL MODEL
#1: Probability one scores higher than 732 (Wharton school's mean/avg) on GMAT
pnorm(732, mean=527, sd=112,lower.tail = FALSE)

#2: Score to be within top 1% (99th percentile) highest 1%
qnorm(0.99, mean=527, sd=112)

#3: How many score between 700-732
pnorm(732, mean = 527, sd=112)
1-pnorm(700, mean=527, sd=112)


#LINEAR REGRESSION
dat <- read.csv("/Users/ashwright/Documents/GitHub/crim1200-stat/Data/dat.nsduh.small.1.1.csv")

#Visual EDA mjage
hist(dat$mjage)

#Visual EDA cjage
hist(dat$cigage)

#Visual EDA both
plot(dat$cigage, dat$mjage)

#Linear regression
out <- lm(formula = cigage ~ mjage, data = dat)
summary(out)

#Assumption for linear model
plot(dat$mjage, dat$cigage)

#Outliers
plot(out)
dat[1,]
dat[3,]
dat[13,]

#Interpret the slope coefficient
summary(out)
