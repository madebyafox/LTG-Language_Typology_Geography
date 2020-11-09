library(readr)
 summary_by_country <- read_csv("summary_by_country.csv")
 
 #find more info here: http://www.ethnologue.com/sites/default/files/Ethnologue-21-Global%20Dataset%20Doc.pdf 
 
 #What the columns mean
 #lang.count = number of languages per country
 #lang.percent = percent of the world's languages spoken in that country
 #established.langs = languages more or less "native" to that country
 #immigrant.langs = immigrant languages
 #total.speakers = population of country
 #mean.speakers = mean number of speakers of each language in that country
 #median.speakers = median number of speakers of each language in that country
 #diversity.index = range 0-1 how diverse the languages spoken in each country (0 being the lowest, 1 being the highest)
 #https://www.nationalgeographic.org/maps/language-diversity-index/ 
 #div.coverage
 
 
 View(summary_by_country)
 glimpse(summary_by_country)
 
 summary_by_country <- as.data.frame(summary_by_country)
 
#change the div.coverage to a proportion and get rid of percent sign 
 summary_by_country$div.coverage = as.numeric(gsub("[\\%,]", "", summary_by_country$div.coverage))
 
 summary_by_country <- summary_by_country %>%
  mutate(div.coverage = div.coverage/100)
 
 summary_by_country$diversity.index <- as.numeric(as.character(summary_by_country$diversity.index))

 
 write.csv(summary_by_country,'summary_by_country_tidied.csv')
 