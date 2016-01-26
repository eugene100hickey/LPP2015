setwd("C:/Academic/Science1/LPP/2015")
library(plyr)
library(dplyr)

data = read.csv2("LPP Grades.csv", sep=",")
data = data[,-c(4,5,6)]

DNAF = read.csv2("DNAF.csv", sep=",")
PHARMA = read.csv2("PHARMA.csv", sep=",")
BIO = read.csv2("BIO.csv", sep=",")


names = c("First Name", "Surname", "StudentID", 
          "01 Intro", "02 Units", "03 MSDS", "04 Moles", 
          "05 ChemColl", "06 Dilutions", "07 Midterm")

data.pharma = filter(data, data$ID.number %in% PHARMA$StudentID)
data.bio = filter(data, data$ID.number %in% BIO$StudentID)
data.dnaf = filter(data, data$ID.number %in% DNAF$StudentID)

names(data.pharma) = names
names(data.bio) = names
names(data.dnaf) = names

data.pharma = data.pharma[,-c(1,2)]
data.bio = data.bio[,-c(1,2)]
data.dnaf = data.dnaf[,-c(1,2)]

data.pharma[data.pharma == "-"] <- NA
data.bio[data.bio == "-"] <- NA
data.dnaf[data.dnaf == "-"] <- NA
View(data.dnaf)
