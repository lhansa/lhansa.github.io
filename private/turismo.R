library(tidyverse)
library(janitor)

# GDP per capita ---------------------------------------------------------
url_gdp <- "https://data.un.org/_Docs/SYB/CSV/SYB64_230_202110_GDP%20and%20GDP%20Per%20Capita.csv"
df_gdp <- read_csv(url_gdp, 
                   skip = 1, 
                   col_types = cols(Footnotes = col_character())) %>% 
  clean_names() %>% 
  rename(region_id = 1, region_name = 2)

df_gdp %>% 
  distinct(series)

# Population data
url_pop <- "https://data.un.org/_Docs/SYB/CSV/SYB64_1_202110_Population,%20Surface%20Area%20and%20Density.csv"

df_pop <- read_csv(url_pop, 
                   skip = 1, 
                   col_types = cols(Footnotes = col_character())) %>% 
  clean_names() %>% 
  rename(region_id = 1, region_name = 2)

# # El PIB per capita se hace con dólares actuales
# df_gdp %>% 
#   filter(region_id == 1, str_detect(series, "GDP in current|capita")) %>% 
#   select(year, series, value) %>% 
#   mutate(series = if_else(str_detect(series, "current"), "gdp", "gdp_capita")) %>% 
#   pivot_wider(names_from = series, values_from = value) %>% 
#   inner_join(
#     df_pop %>% 
#       filter(series == "Population mid-year estimates (millions)", 
#              region_id == 1) %>% 
#       select(year, population = value), 
#     by = "year"
#   ) %>% 
#   mutate(cosa = gdp / population)

df_gdp %>% 
  filter(str_detect(series, "capita")) %>% 
  distinct(region_name)


# Turismo -----------------------------------------------------------------

## Lectura ---------------------------------------------------------------

url_tourism <- "https://data.un.org/_Docs/SYB/CSV/SYB64_176_202110_Tourist-Visitors%20Arrival%20and%20Expenditure.csv"

df_tourism <- read_csv(url_tourism, 
         skip = 1, 
         col_types = cols(
           `Tourism arrivals series type footnote` = col_character()
         )) %>% 
  clean_names() %>% 
  rename(region_id = 1, region_name = 2)

# Gasto en millones de dólares
# llegadas en miles

df_tourism <- df_tourism %>% 
  select(region_id, region_name, year, series, value) %>% 
  mutate(series = if_else(str_detect(series, "expend"), "gasto", "llegadas")) %>% 
  pivot_wider(names_from = series, values_from = value)

## Tratamiento tur ---------------------------------------------------------
df_tourism <- df_tourism %>% 
  left_join(
    df_pop %>% 
      filter(series == "Population mid-year estimates (millions)") %>% 
      select(region_id, year, population = value), 
    by = c("region_id", "year")
  ) %>% 
  left_join(
    df_gdp %>% 
      filter(str_detect(series, "capita")) %>% 
      select(region_id, year, gdp_capita = value), 
    by = c("region_id", "year")
  )


## Exploración tur -----------------------------------------------------------

df_tourism <- df_tourism %>% 
  arrange(region_name, year) %>% 
  mutate(gasto_por_turista = gasto * 1e6 / (llegadas * 1000))

unique(df_tourism$region_name)

paises_guays <- c("Spain", "Vietnam", "Thailand", 
                  "United Arab Emirates", 
                  "Cuba", "Kenya", "Italy")

df_tourism %>% 
  filter(region_name %in% paises_guays) %>% 
  ggplot() + 
  geom_col(aes(x = year, y = llegadas)) + 
  facet_wrap(~ region_name, scales = "free")

  



# url_energy <- "https://data.un.org/_Docs/SYB/CSV/SYB64_263_202110_Production,%20Trade%20and%20Supply%20of%20Energy.csv"
# url_balances <- "https://data.un.org/_Docs/SYB/CSV/SYB64_125_202110_Balance%20of%20Payments.csv"
