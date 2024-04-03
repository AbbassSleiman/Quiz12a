#### Preamble ####
# Purpose: Simulates hospital deaths due to cancer across 20 years in 5 hospitals.
# Note that here we randomly select 1000 dates out of the days throughout the 20 year
# period for each of the 5 hospitals during which 1-5 deaths will occur.
# Author: Abbass Sleiman
# Date: 2 April 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
set.seed(9)

#### Simulate data ####
# Create a vector of hospital names
hospital_names <- paste0("Hospital ", 1:5)

# Create a vector of dates from April 1, 2004, to April 1, 2024
dates <- seq(as.Date("2004-04-01"), as.Date("2024-04-01"), by = "day")

# Initialize an empty data frame to store the simulated data
simulated_data <- data.frame(Hospital = character(),
                             Date_of_death = as.Date(character(), format = "%Y-%m-%d"),
                             Age = numeric(),
                             Health = numeric(),
                             Stage_of_Cancer = integer(),
                             stringsAsFactors = FALSE)

# Randomly select 1000 dates for each hospital
selected_dates <- lapply(hospital_names, function(hospital) {
  sample(dates, 1000)
})

# Simulate data for each hospital and selected dates
for (i in seq_along(hospital_names)) {
  hospital <- hospital_names[i]
  selected_dates_hospital <- selected_dates[[i]]
  
  for (date in selected_dates_hospital) {
    # Generate a random number of deaths for the current hospital and date
    num_deaths <- sample(1:5, 1)
    
    # Simulate data for each death
    for (j in 1:num_deaths) {
      # Generate random values for age, health, and stage of cancer
      age <- min(105, max(1, round(rnorm(1, mean = 60, sd = 15))))
      health <- min(100, max(1, round(rnorm(1, mean = 45, sd = 15))))
      stage <- sample(1:4, 1, prob = c(0.02, 0.08, 0.3, 0.6))
      
      # Create a data frame for the current death and append it to the simulated data
      death_data <- data.frame(Hospital = hospital,
                               Date_of_death = as.Date(date),
                               Age = as.integer(age), # Ensure Age is an integer
                               Health = as.integer(health), # Ensure Health is an integer
                               Stage_of_Cancer = stage)
      
      simulated_data <- rbind(simulated_data, death_data)
    }
  }
}

# Display the first few rows of the simulated data
head(simulated_data)




