here::i_am("code/01_make_table1.R")

data_clean <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(kableExtra)

table_one <- data_clean %>% 
  kbl(col.names = c("Mode of Transport", "Race", "Bay Area", "Butte", "Monterrey Bay"),
      digits = 2) %>% 
  collapse_rows(columns = 1, valign = "top") %>% 
  kable_styling(full_width = FALSE) %>% 
  add_header_above(c(" " = 2, "Region" = 3))

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)
