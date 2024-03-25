# setting working directory 
here::i_am("code/00_clean_data.R")

# defining the path to the raw data
absolute_path_to_data <- here::here("raw_data", "transportation_to_work.xlsx")

# load libraries
library(readxl)
library(dplyr)
library(tidyverse)

# read in the raw data
data <- read_excel(absolute_path_to_data)

# clean the data
data_clean <- data %>%
  filter(reportyear == "2006-2010",
         geotype == "RE") %>%
  select(5,11,13,15:17, 23) %>%
  select(3, 1, 2, 7) %>%
  filter(region_name %in% c("Bay Area", "Butte", "Monterey Bay")) %>% 
  filter(race_eth_name %in% c("AIAN", "Asian", "AfricanAm", "Latino", "NHOPI", "White")) %>%
  filter(mode %in% c("ATHOME", "BICYCLE", "CARTOTAL", "PUBLICTR", "WALK")) %>%
  pivot_wider(names_from = region_name, values_from = CA_RR)

# saving the clean data as an RDS in output folder
saveRDS(
  data_clean,
  file = here::here("output/data_clean.rds")
)
