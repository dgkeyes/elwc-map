library(tidyverse)
library(readxl)
library(writexl)
library(fs)
library(here)
library(zip)
library(washcomap)

write_data <- function(df) {
  
  file_name <- deparse(substitute(df))
  
  df %>% 
    select(school, district, median_value, median_value_categorical) %>% 
    set_names(c("School", "District", "Median Value", "Tier")) %>% 
    write_xlsx(str_glue("data/{file_name}.xlsx"))
}


write_data(composite_score)
write_data(race_ethnicity_composite)
write_data(race_ethnicity_aian)
write_data(race_ethnicity_asian)
write_data(race_ethnicity_black)
write_data(race_ethnicity_latino)
write_data(race_ethnicity_other)
write_data(race_ethnicity_white)
write_data(disability)
write_data(homeless)
write_data(children_in_poverty_100_fpl)
write_data(children_in_poverty_between_100_200)
write_data(children_in_poverty_200_fpl)
write_data(single_parent)
write_data(snap)

all_spreadsheets <- dir_ls(here("data"),
                           regexp = "xlsx")

zipr(zipfile = here("data/data.zip"),
     files = all_spreadsheets)
