#### Preamble ####
# Purpose: Models the data from Quiz12a.
# Author: Abbass Sleiman
# Date: 2 April 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: This script requires the user to have ran the 00-simulate-data.R 
# script in order to have access to the simulated data.

#### Workspace setup ####
library(rstanarm)

#### Build model ####

# Create a count variable based on the number of observations
simulated_data$count <- 1

# Fit Bayesian Poisson regression model
bayesian_model <- stan_glm(count ~ Age + Health + Stage_of_Cancer, 
                           data = simulated_data, 
                           family = poisson())

# Summary of the model
summary(bayesian_model)

# Save the Bayesian model object as an RDS file
saveRDS(bayesian_model, "models/bayesian_model.rds")