#### Preamble ####
# Purpose: Graphs the sketched graph for Quiz12a.
# Author: Abbass Sleiman
# Date: 2 April 2024
# Contact: abbass.sleiman@mail.utoronto.ca
# License: MIT
# Pre-requisites: This script requires the user to have ran the 00-simulate-data.R 
# script in order to have access to the simulated data.

#### Workspace setup ####
library(dplyr)
library(ggplot2)

#### Plot graph ####

# Extract year from Date_of_death
simulated_data$Year <- as.integer(format(simulated_data$Date_of_death, "%Y"))

# Aggregate data by year and hospital
agg_data <- simulated_data |>
  group_by(Year, Hospital) |>
  summarise(Deaths = n())

# Plot
ggplot(agg_data, aes(x = factor(Year), y = Deaths, fill = Hospital)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Total Number of Deaths by Hospital and Year",
       x = "Year",
       y = "Total Deaths") +
  scale_fill_manual(values = c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00")) +
  theme_minimal()
