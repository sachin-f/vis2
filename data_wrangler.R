library(tidyverse)

df <- read.csv("data/new_data.csv") %>%
  rename(Airport = ï..Airport)

df_pre_covid <- df %>%
  filter(Year != 2020)

avg_pre_covid <- df_pre_covid %>%
  group_by(Airport, Month) %>%
  summarise_each(mean, Dom_Pax_In, Dom_Pax_Out, Int_Pax_In, Int_Pax_Out, Pax_In, Pax_In)

avg_post_covid <- df %>%
  filter(Year == 2020) %>%
  select(Airport, Month, Dom_Pax_In, Dom_Pax_Out, Int_Pax_In, Int_Pax_Out, Pax_In, Pax_In)

test <- df %>%
  filter(Airport=="ADELAIDE", Year != 2020, Month == 1)
  
mean(test$Dom_Pax_In)

write.csv(avg_pre_covid, "C:\\Users\\Orson\\Desktop\\DataVis\\Assignment 2\\vis2\\data\\airport_pre_avg.csv", row.names = FALSE)

write.csv(avg_post_covid, "C:\\Users\\Orson\\Desktop\\DataVis\\Assignment 2\\vis2\\data\\airport_post_avg.csv", row.names = FALSE)
