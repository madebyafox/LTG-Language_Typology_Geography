
library(readr)
library(tidyverse)

hum <- read_csv("humidity.csv")
temp <- read_csv("temperature.csv")

# More information: 
# Humidity : http://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NCEP-NCAR/.CDAS-1/.MONTHLY/.Diagnostic/.above_ground/.qa/index.html#info
# Temperature : http://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NCEP-NCAR/.CDAS-1/.MONTHLY/.Diagnostic/.above_ground/.temp/

#Retrieved from NOAA NCEP

## Each observation is the mean a month of observations 
#  conducted since Jan 1949 ~ Oct 2020
#  Columns for both datasets are bins of Longitude, (degree_east) periodic (0) to
#  (1.875W) by 1.875 N = 192pts
#  Rows are (degree_north), ordered latitudes as follows:
  # [ (88.54196N) (86.65315N) (84.75323N) (82.85076N) (80.94736N) (79.04349N) 
###(77.13936N) (75.23506N) (73.33066N) (71.42619N) (69.52167N) (67.6171N) (65.71251N)
###(63.8079N) (61.90326N) (59.99861N) (58.09395N) (56.18928N) (54.28461N) (52.37991N)
###(50.47522N) (48.57052N) (46.66582N) (44.76111N) (42.8564N) (40.95169N) (39.04697N) 
###(37.14225N) (35.23753N) (33.33281N) (31.42808N) (29.52336N) (27.61863N) (25.7139N) 
###(23.80917N) (21.90444N) (19.99971N) (18.09498N) (16.19024N) (14.28551N) (12.38078N)
###(10.47604N) (8.571308N) (6.666573N) (4.761838N) (2.857103N) (0.9523677N) (0.9523677S)
###(2.857103S) (4.761838S) (6.666573S) (8.571308S) (10.47604S) (12.38078S) (14.28551S) 
###(16.19024S) (18.09498S) (19.99971S) (21.90444S) (23.80917S) (25.7139S) (27.61863S) 
###(29.52336S) (31.42808S) (33.33281S) (35.23753S) (37.14225S) (39.04697S) (40.95169S) 
###(42.8564S) (44.76111S) (46.66582S) (48.57052S) (50.47522S) (52.37991S) (54.28461S) 
###(56.18928S) (58.09395S) (59.99861S) (61.90326S) (63.8079S) (65.71251S) (67.6171S) 
###(69.52167S) (71.42619S) (73.33066S) (75.23506S) (77.13936S) (79.04349S) (80.94736S) 
### (82.85076S) (84.75323S) (86.65315S) (88.54196S)]
## Where S is negative.



## Tidy Rows having Dates in them: 
library(dplyr)

clean.hum <- hum %>% filter(hum$`1.87500` != 1.87500)
clean.temp <- temp %>% filter(temp$`1.87500` != 1.87500)

date_of_observation <- data.frame("month" = rep(1:12, times=72), "year" = rep(1949:2020, each=12))
new.date.of.obs <- date_of_observation %>%  slice(rep(1:n(), each=94))
date.of.obs <- new.date.of.obs %>% filter(month != 11 | year != 2020) %>% filter(month != 12 | year != 2020)


dated.hum <- cbind(date.of.obs, clean.hum)
dated.temp <- cbind(date.of.obs, clean.temp)

# Outstanding cleaning: dated.hum and dated.temp currently have latitudes
# in their rows, which we want to incorporate into their respective
# columns of longitudes, in order to create coordinates.
# In doing so we also want to create a wide format for time rather than the
# long format we have for now...

write.csv(dated.hum, 'dated_hum.csv')

write.csv(dated.temp, 'dated_temp.csv')
