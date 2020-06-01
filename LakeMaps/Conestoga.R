#Conestoga Map
#5/22/2020
#A. Engel


# install.packages("tmap")
library(tmap)

library(tidyverse)

#Conestoga map data
data <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/Data/Conestoga.csv", col_names = TRUE)

install.packages("sf")
library(sf)

#set the map to interactive viewing --so you can click on the points
tmap_mode("view")

#Put data in a format for sf 
datasp <- st_as_sf(data, coords = c("Lon", "Lat"), crs = 4326)

datasp

#map the data
ggplot(datasp) +
  geom_sf()

#make a pretty map
allDataMap <- tm_shape(datasp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(size = 0.5, palette = "Dark2", alpha = 0.50, col = "Structure Name",
             popup.vars = c("Structure Name")) +
  tm_layout(legend.outside = TRUE)

allDataMap
