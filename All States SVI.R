library(findSVI)
library(dplyr)



# all the states
state_codes <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
                 "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
                 "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
                 "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", 
                 "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")

# initalizing an empty list
all_svi_data <- list()

# finding svi for all states 
for (state in state_codes) {
  cat("Fetching data for state:", state, "\n")
  state_svi_data <- find_svi(year = 2020, state = state, geography = "zcta", key = "7d0426bd9ba4ebbfdc75634324a878b655493afc")
  all_svi_data[[state]] <- state_svi_data
}

# combining all the states in a df
combined_svi_data <- bind_rows(all_svi_data)

# Display the first 10 rows of the combined data
head(combined_svi_data, 10)


write.csv(combined_svi_data, file = "combined_svi_data_2020.csv", row.names = FALSE)

