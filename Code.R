rm(list = ls())

# Note : All the file paths and directories need to be changed appropriately
# for the code to run on you pc

directory <- "C:/Users/sanku/OneDrive/Desktop/econometrics II"
setwd(directory)

library(dplyr, quietly = TRUE)

# Load the dataset
load("C:/Users/sanku/OneDrive/Desktop/econometrics II/data_set.RData")

# Code for Question 1.

# Checking if the combination of ID_P and SURVEY is unique
nrow(unique(take_home_exam[, c('ID_P', 'SURVEY')]))

# Code for Question 2.

# table of summary statistics for key variables in our analysis
summary(take_home_exam[, c('std_edu', 'widow', 'cons_capita')])

# Code for Question 3.

# t-test to check if the difference is statistically significant.
t.test(cons_capita ~ widow, data = take_home_exam)

# Code for Question 4

# No code needed

# Code for Question 5

# regression of st_edu ~ widow & controlling household background variables 
summary(lm(std_edu ~ widow + cons_capita + hh_children + hh_assets + hindu + ln_cons, data = take_home_exam))

# Code for Question 6

# using dummy interactions to find out if widowhood affect girls differently than boys
summary(lm(std_edu ~ widow + widow*girl, data = take_home_exam))
