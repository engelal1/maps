#Mapping Data 
#A. Engel
#6/9/2020
# install.packages(c("tidyverse", "tmap", "sf"))

library(tidyverse)
library(tmap)
library(sf)

setwd("C:/Users/alex.engel/Documents/GitHub/maps")


mapData <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv", col_name = TRUE, na = "NA")

select(mapData, -X1) -> mapData
select(datasp, -X1) -> datasp

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
             palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             #size = 10,
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)
  

allDataMap

tmap_save(tm = allDataMap, filename = "StateAQHab.html")


#### Birdwood Map

mapData %>% 
  filter(Location == "Birdwood",
         ID != c("7","4")) %>% 
  mutate(Structure = droplevels(Structure)) -> Birdwood

Birdwoodsp <- st_as_sf(Birdwood, coords = c("Lon", "Lat"), crs = 4326)

BirdwoodMap <- tm_shape(Birdwoodsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

#fixed 
BirdwoodMap

tmap_save(tm = BirdwoodMap, filename = "BirdwoodMap.html")



#####Crystal
datasp %>% 
  filter(Location == "Crystal Lake") %>% 
  filter(ID != 366) %>% 
  filter(ID != 367) %>% 
  mutate(Structure = droplevels(Structure)) -> Crystal

CrystalMap <- tm_shape(Crystal)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

#double check ~ points appear wrong
CrystalMap

#### Gothenburg East
datasp %>% 
  filter(Location == "East Gothenburg") %>% 
  mutate(Structure = droplevels(Structure)) -> GothenburgE

GothenburgMap <- tm_shape(GothenburgE)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             size = 20) +
  tm_layout(legend.outside = TRUE)

#double check ~ points are too small
GothenburgMap

###Enders

str(datasp)

datasp %>% 
  filter(Location == "Enders") -> Enders
  # mutate(Structure = droplevels(Structure)) -> Enders

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
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year")) +
  tm_layout(legend.outside = TRUE)

HersheyMap
 
datasp %>% 
  filter(ID == 398) %>% 
  
%>% 
  # mutate(Location == "Birdwood") -> datasp


#### 

mapData %>% 
  filter(Location == "Jeffrey Lake") %>% 
  mutate() -> JeffreyLake

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


### #not in
notIn = negate(`%in%`)