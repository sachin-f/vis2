df <- read.csv("data/flight_data.csv") %>%
  rename(Airport = ï..Airport)

df_pre_covid <- df %>%
  filter(Year != 2020)

avg_pre_covid <- df_pre_covid %>%
  group_by(Airport, Month) %>%
  summarise_each(mean, Dom_Pax_In, Dom_Pax_Out, Int_Pax_In, Int_Pax_Out)

test <- df %>%
  filter(Airport=="ADELAIDE", Year != 2020, Month == 1)
  
mean(test$Dom_Pax_In)
