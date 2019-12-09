library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)

# df_list <- list(composite_score,
#                 race_ethnicity_composite,
#                 race_ethnicity_aian,
#                 race_ethnicity_asian,
#                 race_ethnicity_black,
#                 race_ethnicity_latino,
#                 race_ethnicity_other,
#                 race_ethnicity_white,
#                 disability,
#                 homeless,
#                 children_in_poverty_100_fpl,
#                 children_in_poverty_200_fpl,
#                 single_parent,
#                 snap)

write_data <- function(df, sheet_name) {
  
  file_name <- deparse(substitute(df))
  
  print(file_name)
  
  df %>% 
    select(school, district, median_value, median_value_categorical) %>% 
    set_names(c("School", "District", "Median Value", "Tier")) %>% 
    write.xlsx(str_glue("data/{file_name}.xlsx"))
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
write_data(children_in_poverty_200_fpl)
write_data(single_parent)
write_data(snap)