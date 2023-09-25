# load packages
library(tidyverse)
library(palmerpenguins)
library(ggplot2)
ggplot2::theme_set(ggplot2::theme_minimal())



#EDA EXAMPLES
# create a histogram of the quant. var
ggplot(data = penguins, aes(x=flipper_length_mm)) +
  geom_histogram()

# compare the quantitative var (flipper length) with categorical var (species)
ggplot(data = penguins, aes(x=flipper_length_mm, fill=species)) + 
  geom_histogram()

# same comparison as above, facet wrapped
ggplot(data = penguins, aes(x=flipper_length_mm, fill=species)) +
  geom_histogram() +
  facet_wrap(vars(species))


#make a BOXPLOT
penguins %>% ggplot(aes(x=flipper_length_mm, fill=species)) + geom_boxplot()

#make a SCATTERPLOT, compare 2 quantitative vars
penguins %>% ggplot(aes(x=flipper_length_mm, y=bill_length_mm)) + geom_point()

# same as above but differentiated by species
penguins %>% ggplot(aes(x=flipper_length_mm, y=bill_length_mm, color=species)) +
    geom_point()


