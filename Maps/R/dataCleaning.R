#Map Data Cleaning and Importing
#A. Engel
#5/14/2020

library(tidyverse)

#Bringet all the data in
BirdwoodCreek <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/BirdwoodCreek.csv", col_name = TRUE)

BirdwoodCreek %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> BirdwoodCreek

Conestoga <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Conestoga.csv", col_name = TRUE)

Conestoga %>% 
  rename(Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> Conestoga

Crystal <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Crystal.csv", col_names = TRUE)

Crystal %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> Crystal

EastHershey <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/East_Hershey.csv", col_names = TRUE)

EastHershey %>% 
  select(`Waterbody Name`, `Waterbody Code`, Lat, Lon, `Structure Name`, `Year Installed`) %>% 
  filter(!is.na(Lat)) -> EastHershey

EastHershey %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> EastHershey

Enders <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Enders.csv", col_names = TRUE)

Enders %>% 
  select(`Waterbody Name`, `Waterbody Code`, Lat, Lon, `Structure Name`, `Year Installed`) %>% 
  filter(!is.na(Lat)) -> Enders

Enders %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> Enders

FtMcPherson <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/FtMcPherson.csv", col_names = TRUE)

FtMcPherson %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> FtMcPherson

HersheyLake <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Hershey_Lake.csv", col_names = TRUE)

HersheyLake %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> HersheyLake

JeffreyLake <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Jeffrey_Lake.csv", col_names = TRUE)

JeffreyLake %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> JeffreyLake

Johnson <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Johnson.csv", col_names = TRUE)

Johnson %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> Johnson

LakeHelen <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Lake_Helen.csv", col_names = TRUE)

LakeHelen %>% 
  mutate(`Waterbody Code` = 6705) -> LakeHelen

LakeHelen %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> LakeHelen

LongPineCreek <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Long_Pine_CreekSRA.csv", col_names = TRUE)

LongPineCreek %>% 
  filter(`Structure Name` == "BLDER") %>% 
  mutate(`Year Installed` = 2018) -> LongPineCreek1

LongPineCreek %>% 
  filter(`Structure Name` != "BLDER") %>% 
  mutate(`Year Installed` = 2019) -> LongPineCreek2

rbind(LongPineCreek1, LongPineCreek2) -> LongPineCreek

LongPineCreek %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> LongPineCreek

MedicineCreek <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/MedicineCreek.csv", col_names = TRUE)

MedicineCreek %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> MedicineCreek

NorthPlatte <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/North_Platte.csv", col_names = TRUE)

NorthPlatte %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> NorthPlatte

RedWillow <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Red_Willow.csv", col_name = TRUE)

RedWillow %>% 
  mutate(`Year Installed` = "2004, 2012") -> RedWillow

RedWillow %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> RedWillow

Swanson <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Swanson.csv", col_names = TRUE)

Swanson %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> Swanson

WestBrady <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/West_Brady.csv", col_names = TRUE)

WestBrady %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> WestBrady

WestGothenburg <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/West_Gothenburg.csv", col_names = TRUE)

WestGothenburg %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> WestGothenburg

WillowIsland <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Willow_Island.csv", col_names = TRUE)

WillowIsland %>% 
  rename(Location = `Waterbody Name`,
         Code = `Waterbody Code`, 
         Type = `Structure Name`,
         Year = `Year Installed`) -> WillowIsland


rbind(BirdwoodCreek, Conestoga, Crystal, EastHershey, Enders, FtMcPherson, HersheyLake, JeffreyLake, Johnson, LakeHelen, LongPineCreek, MedicineCreek, NorthPlatte, RedWillow, Swanson, WestBrady, WestGothenburg, WillowIsland) -> mapData

# write_csv(mapData, "C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv")

mapData %>% 
  mutate(Type2 = case_when(Type == "PVC structures" ~ "ARTIFICIAL STRUCTURE",
                           Type == "Brush Piles" ~ "BRUSH PILE",
                           Type == "Trees" ~ "TREE",
                           Type == "Unknown" ~ "STRUCTURE",
                           Type == "Brush Pile" ~ "BRUSH PILE",
                           Type == "UPRIGHT TREE" ~ "TREES",
                           Type == "Mossbacks" ~ "ARTIFICIAL STRUCTURE",
                           Type == "Cedar Tree" ~ "CEDAR",
                           
                            
                           
                                Structure == "UPRIGHT TREE" ~ "TREES",
                                Structure == "TREE" ~ "Tree")) -> data

# mutate(Str = case_when(Structure == "CEDAR" ~ "Tree",
# Structure == "BOAT RAMP" ~ "Ramp",
# TRUE ~ "NotTree"))

#5/27/2020
library(tidyverse)

mapData <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv", col_names = TRUE, na = "NA")

Cunningham <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/Cunningham.csv", col_names = TRUE, na = "NA")

head(Cunningham)

Cunningham %>% 
  rename(Code = `Waterbody Code`, 
         Type = `Structure`,
         Year = `Year Installed`) -> Cunningham

rbind(mapData, Cunningham) -> mapData

tail(mapData)
head(mapData)

write_csv(mapData, "C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv")

##### 6/2/2020
library(tidyverse)

mapData <- read_csv("C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv", col_names = TRUE, na = "NA")

as.factor(mapData$Type) -> mapData$Type

levels(mapData$Type)

###### 6/9/2020

mapData %>% 
  mutate(Structure = case_when(Type == "Artifical Structures" ~ "FISH ATTRACTOR",
                           Type == "PVC structures" ~ "FISH ATTRACTOR",
                           Type == "BLDER" ~ "BOULDER",
                           Type == "CEDAR" ~ "CEDAR",
                           Type == "CRIB" ~ "CRIB",
                           Type == "DEFLECT" ~ "DEFLECT",
                           Type == "DLB WING" ~ "WING",
                           Type == "GRAVEL" ~ "GRAVEL",
                           Type == "ISLAND" ~ "ISLAND",
                           Type == "ROOT WAD" ~ "ROOT WAD",
                           Type == "LUNKER" ~ "LUNKER",
                           Type == "ROCK PILE" ~ "ROCK PILE",
                           Type == "VORTEX" ~ "VORTEX",
                           Type == "WEIR" ~ "WEIR",
                           Type == "WING" ~ "WING",
                           Type == "Brush Pile" ~ "BRUSH PILE",
                           Type == "Brush Piles" ~ "BRUSH PILE",
                           Type == "Cedar Tree" ~ "CEDAR",
                           Type == "edge of tree pile" ~ "BRUSH PILE",
                           Type == "LOG CRIB" ~ "CRIB",
                           Type == "GRAVEL" ~ "SHOAL",
                           Type == "Gravel Shoals" ~ "SHOAL",
                           Type == "Large Tree Pile" ~ "BRUSH PILE",
                           Type == "Mossbacks & Trees" ~ "FISH ATTRACTOR",
                           Type == "O'Dell Structures (reused)" ~ "FISH ATTRACTOR",
                           Type == "PVC Structures" ~ "FISH ATTRACTOR",
                           Type == "Rip Rap Piles" ~ "ROCK PILE",
                           Type == "Mossbacks" ~ "FISH ATTRACTOR",
                           Type == "Rock Shoal" ~ "SHOAL",
                           Type == "Stump" ~ "TREE",
                           Type == "STUMP" ~ "TREE",
                           Type == "Trees" ~ "TREE",
                           Type == "Unknown" ~ "STRUCTURE",
                           Type == "UPRIGHT TREE" ~ "TREE",
                           Type == "TREE" ~ "TREE",
                           Type == "SHOAL" ~ "SHOAL",
                           Type == "Rocks" ~ "ROCK PILE",
                           Type == "ROOT WAD" ~ "ROOT WAD",
                           TRUE ~ "STRUCTURE")) -> mapData

as.factor(mapData$Type2) -> mapData$Type2

levels(mapData$Type2)

mapData %>% 
  filter(Type != "MOTOR") %>% 
  filter(Type != "BOAT RAMP") -> mapData

mapData %>% 
  mutate(Latitude = Lat,
         Longitude = Lon) -> mapData

select(mapData, -X1) -> mapData
select(mapData, -Type2) -> mapData

#Rewrite csv

### #not in
notIn = negate(`%in%`)


mapData %>% 
  filter(notIn(ID, c(4, 7, 364, 365, 366, 367, 
                     368, 380, 381, 382, 383, 
                     384, 385, 457, 597))) -> mapData

mapData %>% 
  filter(Location != "Long Pine Creek") -> mapData

write_csv(mapData, "mapData.csv")

write.csv(mapData, "C:/Users/alex.engel/Documents/Coding/R_stuff/mapping/Maps/data/mapData.csv")
