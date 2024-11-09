
# Load necessary library
library(dplyr)
library(here)

# Read the original dataset
data <- read_csv(here::here("data", "CaffeineTaps.csv"))

# Separate data by group
caffeine_data <- data %>% filter(Group == "Caffeine")
nocaffeine_data <- data %>% filter(Group == "NoCaffeine")

# Determine original ranges and extend by 2-3 taps
set.seed(42564) # For reproducibility

# Generate new data points
new_caffeine_taps <- round(rnorm(n=25, mean = mean(caffeine_data$Taps), sd = sd(caffeine_data$Taps))) 
new_nocaffeine_taps <- round(rnorm(n=25, mean = mean(nocaffeine_data$Taps), sd = sd(nocaffeine_data$Taps))) 

# Create new rows for the dataset
new_data_caffeine <- data.frame(Taps = new_caffeine_taps, Group = "Caffeine")
new_data_nocaffeine <- data.frame(Taps = new_nocaffeine_taps, Group = "NoCaffeine")

# Combine original and new data
extended_data <- bind_rows(data, new_data_caffeine, new_data_nocaffeine)

# Save the extended dataset
write.csv(extended_data, here("data", "CaffeineTaps_n35.csv"), row.names = FALSE)


