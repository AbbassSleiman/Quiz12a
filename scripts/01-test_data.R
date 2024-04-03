#### Preamble ####
# Purpose: Tests the simulated data to ensure that it operates as expected.
# Author: Abbass Sleiman
# Date: 2 April 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: This script requires the user to have ran the 00-simulate-data.R 
# script in order to have access to the simulated data.


#### Workspace setup ####
library(tidyverse)


#### Test data ####

# 1-5. Test data types
test_age_numeric <- is.numeric(simulated_data$Age)
print(test_age_numeric)

test_health_numeric <- is.numeric(simulated_data$Health)
print(test_health_numeric)

test_stage_integer <- is.integer(simulated_data$Stage_of_Cancer)
print(test_stage_integer)

test_hospital_factor <- is.character(simulated_data$Hospital)
print(test_hospital_factor)

test_date_date <- is.Date(simulated_data$Date_of_death)
print(test_date_date)

# 6. Test Hospital names
expected_hospital_names <- paste0("Hospital ", 1:5)
test_hospital_names <- all(simulated_data$Hospital %in% expected_hospital_names)
print(test_hospital_names)

# 7. Test Date range
expected_date_range <- seq(as.Date("2004-04-01"), as.Date("2024-04-01"), by = "day")
test_date_range <- all(simulated_data$Date_of_death %in% expected_date_range)
print(test_date_range)

# 8. Test Stage of Cancer values
expected_stages <- 1:4
test_stage_values <- all(simulated_data$Stage_of_Cancer %in% expected_stages)
print(test_stage_values)

# 9. Test Age range
test_age_range <- all(simulated_data$Age >= 0)
print(test_age_range)

# 10. Test Health range
test_health_range <- all(simulated_data$Health >= 1 & simulated_data$Health <= 100)
print(test_health_range)