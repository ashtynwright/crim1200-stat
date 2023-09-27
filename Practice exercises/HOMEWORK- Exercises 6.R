library(tidyverse)
library(palmerpenguins)
library(ggplot2)
ggplot2::theme_set(ggplot2::theme_minimal())

# Selecting observations to manipulate data guidelines
penguins %>% filter(species == "Adelie")

# REORDERING ROWS
penguins %>% arrange (bill_length_mm) #sorts by bill length

penguins %>% arrange(desc(bill_length_mm)) #descending bill length



#SELECTING ROWS
# select only rows three and four
penguins %>% slice(3:4)

# " only last five rows
penguins %>% slice_tail(n=5) 

# selects a random sample of five rows
penguins %>% slice_sample(n=5) 

#Question for prof: What does it mean by samples w replacement ((below))
penguins %>% slice_sample(n=5, replace=TRUE)

#select row w the highest bill length
penguins %>% slice_max(bill_length_mm, n=1)




#SELECTING SPECIFIC COLUMNS
penguins %>% select(bill_length_mm) #selects single column, bill_length_mm

#find the maximum of that column
penguins %>% select(bill_length_mm) %>% max(na.rm = TRUE)


#ADD A NEW COLUMN
penguins %>% mutate(bill_length_m = bill_length_mm / 1000)
# new column views bill length by meters



#CREATE A FREQUENCY TABLE
penguins %>% count(species)


#summarize by groups
penguins %>% group_by(species) %>% summarize(m=mean(bill_length_mm, na.rm = TRUE),
                                             sd=sd(bill_length_mm, na.rm = TRUE),
                                             n=n()) #creates summary grouping by species

penguins %>% group_by(island) %>% summarize(m=mean(bill_length_mm, na.rm = TRUE),
                                            sd=sd(bill_length_mm, na.rm = TRUE),
                                            n=n()) #summary grouping by island
