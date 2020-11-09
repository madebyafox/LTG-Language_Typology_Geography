autotyp_1_ <- read_csv("C:/Users/cathe/Downloads/autotyp (1).csv")

autotyp <- autotyp_1_

#what the variables mean
#from documentation: http://www.autotyp.uzh.ch/download/release_2013/autotyp-release_2013.pdf
# LID = 
# ISO639.3 = 3-letter language code
# language = full language name
# alt.language.name  = alternative language name
# language.search = all possible names for the language
# lsbranch = lowest sub-branch (of language family)
# ssbranch = sub-subbranch (of language family)
# sbranch = sub-branch (of language family)
# mbranch = major branch (of language family)
# stock = highest-level language family
# alt.stock.name = all possible names for the language family/group
# stock.search = all possible names for highest-level language family
# longitude = in degrees
# latitude = in degrees
# area = smaller sub-divisions: N Africa, Greater Abyssinia, African Savannah, S Africa, Europe, Greater Mesopotamia, Indic, Inner Asia, Southeast Asia, N Coast Asia, 
#N Coast New Guinea, Interior New Guinea, S New Guinea, Oceania, N Australia, S Australia, Alaska-Oregon, California, Basin and Plains, E North America, Mesoamerica,
#NE South America, Andean, SE South America
# continent = continent


write.csv(autotyp,'autotyp.csv')