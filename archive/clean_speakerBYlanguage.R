

#######
#Pre-requisite: set your working directory to be the directory where the data file is located
#setwd("~/Google Drive File Stream/Shared drives/PSYCH 201a project/Data/speakers_by_language")

#LOAD LIBRARIES
library(tidyverse)
library(readxl)


#LOAD SPEAKERS BY LANGUAGE DATA
raw <- read_excel("raw_FOX_rsos181274_si_002.xlsx", 
 sheet = "data", col_types = c("text", "text", "text", "text", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "text"))


#INSPECT DATAFRAME
#str(df) #console

#CREATE FACTORS
#some of the columns are clearly categorical factors

df_speakersBYlang <- raw %>% mutate(  
  #RENAME COLS
  lang_iso = ISO, #ISO 639-3 code
  lang_name = Language, #Language name
  lang_entropy = H, #Entropy rates
  lang_unigram = H_unigram, #Unigram entropy
  lang_L2_proportion = L2prop, #Proportion of L2 speakers
  lang_MC = MC, #Morophological Complexity
  lang_nChapters = NumChap, #Number of included WALS features/chapters
  lang_pop = Population, #Speaker population size
  lang_geoRange = Rangesize, #Range size in km2
  #CREATE FACTORS
  lang_family = as.factor(Family), #Language family
  lang_area = as.factor(Area), #Language area
  lang_veh = as.factor(vehicularity) #Vehicularity
) %>% select(
  #DROP OLD COLS
  - ISO,
  - Language,
  - H, 
  - H_unigram,
  - L2prop, 
  - MC,
  - NumChap,
  - Population,
  - Rangesize,
  - Family,
  - Area,
  - vehicularity
)





