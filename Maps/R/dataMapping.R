#Mapping Data 
#A. Engel
#6/9/2020
# install.packages(c("tidyverse", "tmap", "sf"))

library(tidyverse)
library(tmap)
library(sf)

setwd("C:/Users/alex.engel/Documents/GitHub/maps")


mapData <- read_csv("mapData.csv", col_name = TRUE, na = "NA")

mapData2 <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv")

select(mapData2, -X1) -> mapData2

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

tmap_save(tm = allDataMap, filename = "StateAQHab2.html")


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
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

#fixed 
BirdwoodMap

tmap_save(tm = BirdwoodMap, filename = "BirdwoodMap.html")

Birdwood %>% 
  select(ID, Structure, Lat, Lon) %>% 
  rename(Longitude = Lon,
         Latitude = Lat) -> BirdwoodWMA

write_csv(BirdwoodWMA, "BirdwoodWMA.csv")

#####Crystal
mapData %>% 
  filter(Location == "Crystal Lake") %>% 
  # filter(ID != 366) %>% 
  # filter(ID != 367) %>% 
  mutate(Structure = droplevels(Structure)) -> Crystal

Crystalsp <- st_as_sf(Crystal, coords = c("Lon", "Lat"), crs = 4326)

CrystalMap <- tm_shape(Crystalsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
        tm_layout(legend.outside = TRUE) +
        tm_view(symbol.size.fixed = T)

#double check ~ points appear wrong
CrystalMap

#### Gothenburg East
mapData %>% 
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

mapData %>% 
  filter(Location == "Enders") %>% 
  mutate(Structure = droplevels(Structure)) -> Enders
  
Enderssp <- st_as_sf(Enders, coords = c("Lon", "Lat"), crs = 4326)

EndersMap <- tm_shape(Enderssp)+
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

Enders %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> EndersSRA

write_csv(EndersSRA, "EndersSRA.csv")

###FtMcPherson

mapData %>% 
  filter(Location == "Ft. McPherson") %>% 
  mutate(Structure = droplevels(Structure)) -> ftMcpherson

ftMcphersonsp <- st_as_sf(ftMcpherson, coords = c("Lon", "Lat"), crs = 4326)

FtMcphersonMap <- tm_shape(ftMcphersonsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             palette = "Dark2", 
             alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

#double check ~ points appear wrong
FtMcphersonMap


#### Hershey Map

mapData %>% 
  filter(Location == "Hershey") %>% 
  mutate(Structure = droplevels(Structure)) -> Hershey

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
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

HersheyMap
 
#A point is mislabeled as Hershey actually is at Birdwood
#pull out the point
mapData %>% 
  filter(ID == 398) -> b398

#relable location to birdwood
b398$Location = "Birdwood"  

#take it out of the map data
mapData %>% 
  filter(ID != 398) -> mapData

#bring point w/ new label back into map data
rbind(mapData, b398) -> mapData

Hershey %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> HersheyWMA

write_csv(HersheyWMA, "HersheyWMA.csv")

#### Jeffrey Lake

mapData %>% 
  filter(Location == "Jeffrey Lake") %>% 
  mutate(Structure = droplevels(Structure)) -> JeffreyLake

JeffreyLakesp <- st_as_sf(JeffreyLake, coords = c("Lon", "Lat"), crs = 4326)

JeffreyMap <- tm_shape(JeffreyLakesp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

#looks good
JeffreyMap

JeffreyLake %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> JeffreyReservoir

write_csv(JeffreyReservoir, "JeffreyReservoir.csv")

#### Johnson

mapData %>% 
  filter(Location == "Johnson") %>% 
  mutate(Structure = droplevels(Structure)) -> Johnson

Johnsonsp <- st_as_sf(Johnson, coords = c("Lon", "Lat"), crs = 4326)

JohnsonMap <- tm_shape(Johnsonsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

#Looks good
JohnsonMap

Johnson %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> JohnsonReservoir

write_csv(JohnsonReservoir, "JohnsonReservoir.csv")

####Lake Helen

mapData %>% 
  filter(Location == "Lake Helen") %>% 
  mutate(Structure = droplevels(Structure)) -> LakeHelen

LakeHelensp <- st_as_sf(LakeHelen, coords = c("Lon", "Lat"), crs = 4326)

LakeHelenMap <- tm_shape(LakeHelensp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

#One point bad #457
LakeHelenMap

LakeHelen %>% 
  filter(ID != 457)-> LakeHelen

LakeHelen %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> LakeHelenCityPark

write_csv(LakeHelenCityPark, "LakeHelenCityPark.csv")

##### Long Pine Creek

mapData %>% 
  filter(Location == "Long Pine Creek") %>% 
  mutate(Structure = droplevels(Structure)) -> LongPineCreek

LongPineCreeksp <- st_as_sf(LongPineCreek, coords = c("Lon", "Lat"), crs = 4326)

LongPineCreekMap <- tm_shape(LongPineCreeksp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Creek does not show up on the map should remove probably
LongPineCreekMap

### Medicine Creek

mapData %>% 
  filter(Location == "Medicine Creek") %>% 
  mutate(Structure = droplevels(Structure)) -> MedicineCreek

MedicineCreeksp <- st_as_sf(MedicineCreek, coords = c("Lon", "Lat"), crs = 4326)

MedicineCreekMap <- tm_shape(MedicineCreeksp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Looks good
MedicineCreekMap

MedicineCreek %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> MedicineCreekReservoir

write_csv(MedicineCreekReservoir, "MedicineCreekReservoir.csv")

### North Platte I-80 Lake

mapData %>% 
  filter(Location == "North Platte I-80 City Lake") %>% 
  mutate(Structure = droplevels(Structure)) -> NorthPlatte

NorthPlattesp <- st_as_sf(NorthPlatte, coords = c("Lon", "Lat"), crs = 4326)

NorthPlatteMap <- tm_shape(NorthPlattesp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Looks good 
NorthPlatteMap

NorthPlatte %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> NorthPlatteI80Lake

write_csv(NorthPlatteI80Lake, "NorthPlatteI80Lake.csv")

### Red Willow

mapData %>% 
  filter(Location == "Red Willow") %>% 
  mutate(Structure = droplevels(Structure)) -> RedWillow

RedWillowsp <- st_as_sf(RedWillow, coords = c("Lon", "Lat"), crs = 4326)

RedWillowMap <- tm_shape(RedWillowsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Looks good
RedWillowMap

RedWillow %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> RedWillowReservoir

write_csv(RedWillowReservoir, "RedWillowReservoir.csv")

### Swanson

mapData %>% 
  filter(Location == "Swanson") %>% 
  mutate(Structure = droplevels(Structure)) -> Swanson

Swansonsp <- st_as_sf(Swanson, coords = c("Lon", "Lat"), crs = 4326)

SwansonMap <- tm_shape(Swansonsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Looks good
SwansonMap

Swanson %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> SwansonReservoir

write_csv(SwansonReservoir, "SwansonReservoir.csv")

#### West Brady
mapData %>% 
  filter(Location == "West Brady") %>% 
  mutate(Structure = droplevels(Structure)) -> WestBrady

WestBradysp <- st_as_sf(WestBrady, coords = c("Lon", "Lat"), crs = 4326)

WestBradyMap <- tm_shape(WestBradysp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("ID", "Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Point 597 is wrong, needs to be removed
WestBradyMap

WestBrady %>% 
  filter(ID != 597) %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> WestBradyWMa

write_csv(WestBradyWMa, "WestBradyWMA.csv")

### Willow Island

mapData %>% 
  filter(Location == "Willow Island") %>% 
  mutate(Structure = droplevels(Structure)) -> WillowIsland

WillowIslandsp <- st_as_sf(WillowIsland, coords = c("Lon", "Lat"), crs = 4326)

WillowIslandMap <- tm_shape(WillowIslandsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# looks good
WillowIslandMap

WillowIsland %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> WillowIslandWMA

write_csv(WillowIslandWMA, "WillowIslandWMA.csv")

#Lake Glen Cunningham -> need to add the rest of the points (will do tonight!!!)

mapData %>% 
  filter(Location == "Glen Cunningham") %>% 
  mutate(Structure = droplevels(Structure)) -> GlenCunningham

GlenCunninghamsp <- st_as_sf(GlenCunningham, coords = c("Lon", "Lat"), crs = 4326)

GlenCunninghamMap <- tm_shape(GlenCunninghamsp)+
  #Add basemap
  tm_basemap(server = c("OpenStreetMap.Mapnik")) +
  #add points to map with color changing by ID. 
  #"popup.vars" determines what is shown when a location is selected
  tm_symbols(col = "Structure", 
             size = 0.5, palette = "Dark2", alpha = 0.50,
             title.size = "Structure",
             title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year"),
             style = "pretty",
             clustering = T) +
  tm_layout(legend.outside = TRUE) +
  tm_view(symbol.size.fixed = T)

# Looks good
GlenCunninghamMap

GlenCunningham %>% 
  select(ID, Lat, Lon, Structure) %>% 
  rename(Latitude = Lat,
         Longitude = Lon) -> LakeGlenCunningham

write_csv(GlenCunningham, "LakeGlenCunningham.csv")
