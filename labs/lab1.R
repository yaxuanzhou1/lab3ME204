#### SETUP ####
library(tidyverse)
df <- read_csv("Dec_lsoa_grocery.csv")


#### Filter ####
a=df[df["area_id"] == "E01004735",]

#let's view the data
View(a)

selected_cols <- c("area_id”,
                    “fat”,“saturate”, “salt”, “protein”, “sugar”,
                    “protein”, “carb”, “fibre”, “alcohol”,
                    “population”, “male”,  “female”,
                    “age_0_17",  "age_18_64”, “age_65+“,  “avg_age”,
                   “area_sq_km”,  “people_per_sq_km"
)

# Order the data by average alcohol consumption (in decreasing order)
df3 <- df[order(df$alcohol, decreasing=TRUE),]

# Print the top 3 regions with the highest average alcohol consumption
head(df3, 3)

# Print the bottom 3 regions with the lowest average alcohol consumption
tail(df3, 3)


# Order the data by average sugar consumption (in decreasing order)
df4 <- df[order(df$sugar, decreasing=TRUE),]

# Print the top 3 regions with the highest average sugar consumption
head(df4, 3)

# Print the bottom 3 regions with the lowest average sugar consumption
tail(df4, 3)

# Load the dplyr package
library(dplyr)

# Assuming that the column name for population size is 'population'
df %>%
  summarise(
    average_population = mean(population, na.rm = TRUE),
    sd_population = sd(population, na.rm = TRUE)
  )

# Load the ggplot2 package
library(ggplot2)

# ggplot2
library(ggplot2)

ggplot(df, aes(x = alcohol, y = sugar)) +
  geom_point() +
  ggtitle("Alcohol vs Sugar") +
  xlab("Alcohol Consumption") +
  ylab("Sugar Consumption")
