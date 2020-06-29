#Alex Engel
#6/29/2020
#Conestoga Structures

library(tidyverse)

Conestoga <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Conestoga.csv", col_name = TRUE)

Conestoga %>% 
  group_by(`Structure Name`) %>% 
  summarise(n = length(`Structure Name`)) -> ConTable

ConTable

sum(ConTable$n)
