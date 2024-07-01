#load package
if(!require("pacman")) install.packages("pacman")
pacman::p_load(pacman, dplyr, rio, tidyverse, stringi, lubridate)

#load data
rawData <- as.data.frame(read.csv("All_GPUs.csv"))

#data inspect
names(rawData) # check field name
str(rawData)  # check data structure
View(rawData) # Overview the data

#examine frequency table
freqTable = apply(rawData, 2, table)
View(freqTable)
