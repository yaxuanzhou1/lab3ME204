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

df2 <-df[order(df$alcohol, decreasing=TRUE),]
head(df2,3)

