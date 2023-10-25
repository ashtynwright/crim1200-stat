library(ggplot2)
library(tidyverse)

# Quiz 2


# Normal model

# 1. The patient recovery time from a particular surgical procedure is normally distributed with a mean of 10 days and a standard deviation of 2 days.

# 1.a. What is the z-score for a patient who takes 12 days to recover?
(12-10)/2=1

# 1.b. What percentage of patients take 20 days or longer to recover?
pnorm(20, mean=10, sd=2, lower.tail = FALSE)
.00028 #percent

# 1.c. What percentage of patients take between 1 and 5 days to recover?
pnorm(5, mean = 10, sd=2, lower.tail = FALSE)
pnorm(1, mean= 10, sd=2, lower.tail = FALSE)
-0.006 #percent

# 1.d. How many days does it take for the 20th percentile of the distribution to recover?
qnorm(0.2, mean = 10, sd = 2)
8.3 #days 



# Linear regression 

# 2. We are going to study the relationship between number of murders per city and number of robberies, only for cities with population > 1,000,000 using the Uniform Crime Reports from 2017, which are crimes reported to the police, and then compiled by the FBI.

# 2.a. What are some ethical concerns you might have with the data?

# 2.b. Load the data.
big.cities <- read.csv("/Users/ashwright/Desktop/ucr2017_big_cities.csv")

# 2.c. Draw a scatterplot of actual_robbery_total vs actual_murder. What does the relationship look like?
big.cities %>% ggplot(aes(x=actual_murder, y=actual_robbery_total)) + geom_point()
plot(big.cities$actual_murder, big.cities$actual_robbery_total)

# 2.d. Fit a simple linear regression where you regress actual_robbery_total onto actual_murder. 
lm.output <- lm(formula = actual_robbery_total ~ actual_murder, data = big.cities)
summary(lm.output)

lm.output$residuals
lm.output$fitted.values

# Before interpreting the coefficients, look at the diagnostic plots. Are the assumptions for fitting the linear model satisfied? 
# A. Homoscedasticity
# B. Independence between observations
# C. Normality of errors
# D. Linear relationship between x and y:
  
    #A Not satisfied, graph changes across the independent variable
    #B Not satisfied, scatterplot shows value clustering suggesting dependency between values
      plot(lm.output$residuals, big.cities$actual_murder)
    #C Satisfied, x values are normally distributed across the line
      plot(lm.output)
          par(mfrow=c(2,2)) 
          plot(lm.output)
          par(mfrow=c(1,1))
    #D
      plot(big.cities$actual_murder, big.cities$actual_robbery_total)



# 2.e. What are the outliers? Why do you think they are outliers?
  #Look to "Residuals v. Leverage" graph
   big.cities[7,]
   big.cities[11,]
      #These cities are outliers because they are larger cities known for higher rates of crime
   
# 2.f. Look at the regression plot on the scatterplot.
   big.cities %>% ggplot(aes(x=actual_murder, y=actual_robbery_total)) + 
     geom_point() + geom_smooth(method="lm", formula=y~x, se=FALSE)
   
# 2.g. Regardless of how the diagnostics look, interpret the slope coefficient. 
   #What can you conclude about the relationship between murder and robberies? 
   #(Ignore p-values or any measure of uncertainty associated with the coefficient 
   #since we haven't covered that in class.)
   
   summary(lm.output)
   
   # Each additional murder is associated with 22.78 additional robberies 
   #(higher rate of murder = higher rate of robberies)



