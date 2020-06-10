#Mapping Data 
#A. Engel
#6/9/2020
# install.packages(c("tidyverse", "tmap", "sf"))

library(tidyverse)
library(tmap)
library(sf)


mapData <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv", col_name = TRUE, na = "NA")

select(mapData, -X1) -> mapData

as.factor(mapData$Structure) -> mapData$Structure
levels(mapData$Structure)

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

#### Birdwood Map

mapData %>% 
  filter(Location == "Birdwood") -> Birdwood

select(Birdwood, -X1) -> Birdwood

Birdwoodsp <- st_as_sf(Birdwood, coords = c("Lon", "Lat"), crs = 4326)

BirdwoodMap <- tm_shape(Birdwoodsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 1, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

#2 points wrong
BirdwoodMap

#####Crystal
datasp %>% 
  filter(Location == "Crystal Lake") -> Crystal


CrystalMap <- tm_shape(Crystal)+
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

#double check ~ points appear wrong
CrystalMap

datasp %>% 
  filter(Location == "East Gothenburg") -> GothenburgE

GothenburgMap <- tm_shape(GothenburgE)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 2, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

#double check ~ points are too small
GothenburgMap

datasp %>% 
  filter(Location == "Enders") -> Enders

EndersMap <- tm_shape(Enders)+
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

#Looks good
EndersMap

datasp %>% 
  filter(Location == "Ft. McPherson") -> ftMcpherson

FtMcphersonMap <- tm_shape(ftMcpherson)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 1, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

#double check ~ points appear wrong
FtMcphersonMap


#### Hershey Map

mapData %>% 
  filter(Location == "Hershey") -> Hershey

Hersheysp <- st_as_sf(Hershey, coords = c("Lon", "Lat"), crs = 4326)

HersheyMap <- tm_shape(Hersheysp)+
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

HersheyMap
 
#### 

mapData %>% 
  filter(Location == "Jeffrey Lake") -> JeffreyLake

select(JeffreyLake, -X1) -> JeffreyLake

JeffreyLakesp <- st_as_sf(Hershey, coords = c("Lon", "Lat"), crs = 4326)

JeffreyMap <- tm_shape(JeffreyLakesp)+
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

JeffreyMap
