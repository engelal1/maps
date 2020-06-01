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

as.factor(mapData$Type) -> mapData$Type

levels(mapData$Type)
