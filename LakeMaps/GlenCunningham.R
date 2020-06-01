#Glen Cunningham Lake
#5/27/2020    

#6/1/2020
#Trying to modify dates and added popup vars
#A. Engel


# install.packages("tmap")
library(tmap)

library(tidyverse)

#Conestoga map data
data <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/Data/Cunningham.csv", col_names = TRUE)

# install.packages("sf")
library(sf)

data %>% 
  mutate(Latitude = Lat,
         Longitude = Lon) -> data

as.factor(data$`Year Installed`) -> data$`Year Installed`

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
  tm_symbols(col = "Structure", 
              size = 0.5, palette = "Dark2", alpha = 0.50,
              title.size = "Structure",
              title.col = "Structure", id = "Structure",
             popup.vars = c("Structure", "Latitude", "Longitude", "Year Installed")) +
  tm_layout(legend.outside = TRUE)


allDataMap

setwd("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Lakes/Glen_Cunningham")


tmap_save(tm = allDataMap, filename = "Glen_Cunningham.html")

###### Example ######

# ttm()
# tm_shape(metro) +
#   tm_bubbles("pop2010", col = "growth", 
#              border.col = "black", border.alpha = .5, 
#              style="fixed", breaks=c(-Inf, seq(0, 6, by=2), Inf),
#              palette="-RdYlBu", contrast=1, 
#              title.size="Metro population", 
#              title.col="Growth rate (%)", id="name", 
#              popup.vars=c("Population (2010)"="pop2010", "Population (2020)"="pop2020", "Growth (%)"="growth"),
#              popup.format=list(growth=list(digits=4)))
