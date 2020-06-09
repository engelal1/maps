#Mapping Data 
#A. Engel
#6/9/2020
# install.packages(c("tidyverse", "tmap", "sf"))

library(tidyverse)
library(tmap)
library(sf)


mapData <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv", col_name = TRUE, na = "NA")

select(mapData, -X1) -> mapData



#set the map to interactive viewing --so you can click on the points
tmap_mode("view")

#Put data in a format for sf 
datasp <- st_as_sf(mapData, coords = c("Lon", "Lat"), crs = 4326)

#map the data
ggplot(datasp) +
  geom_sf()

#make a pretty map
allDataMap <- tm_shape(datasp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

allDataMap
