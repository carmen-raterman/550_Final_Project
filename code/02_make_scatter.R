here::i_am("code/02_make_scatter.R")

data_clean <- readRDS(
  file = here::here("output/data_clean.rds")
)

# Reshape data to long format
library(dplyr)
library(tidyverse)
data_scatter <- data_clean %>%
  pivot_longer(cols = c("Bay Area", "Butte", "Monterey Bay"), names_to = "Region", values_to = "Risk_Ratio")

library(ggplot2)

scatterplot <- ggplot(data_scatter, aes(x = race_eth_name, y = Risk_Ratio, color = mode)) +
  geom_point() +
  labs(title = "Risk Ratio of Transportation Mode and Race/Ethnicity by Region",
       x = "Race/Ethnicity",
       y = "Risk Ratio",
       color = "Mode of Transportation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_wrap(~Region, scales = "free_y")

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png"
)
