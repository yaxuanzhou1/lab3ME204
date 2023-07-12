
library(tidyverse)
library(xml2)
df <- read_csv("Dec_lsoa_grocery.csv")

selected_cols <- c("area_id",
                    "fat","saturate", "salt", "protein", "sugar",
                    "carb", "fibre", "alcohol")

df[selected_cols]

tesco_data_xml <- xml_new_root("data", .encoding = "UTF-8")
tesco_data_xml

temp <- xml_new_root("data")

row1 <- df %>% slice(1)

area_node <- xml_new_root("area",
                          area_id = row1 %>% pull(area_id))

area_node

for(nutrient_name in selected_cols[-1]){
  xml_add_child(area_node, nutrient_name, row1 %>% pull(nutrient_name))

}
xml_add_child(tesco_data_xml, area_node)

write_xml(tesco_data_xml, "sample_tesco_data.xml")

get_area_node <- function(row) {
  row <- data.frame(row)
  area_node <- xml_new_root("area",
                                    area_id = row %>% pull(area_id))

  for(nutirent_name in selected_cols[-1]){
    xml_add_child(area_node, nutrient_name, row %>% pull(nutirent_name))
  }
  
  return(area_node)
}

tesco_data_xml2 <- xml_new_root("data", .encoding = "UTF-8")
for (i in 1:10) {
  tesco_data_xml2 %>% xml_add_child(get_area_node(df[i, ]))
                                    
}
write_ex

                                    
              