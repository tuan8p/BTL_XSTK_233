#Prepare for LinearRegression

#CorPlot
if(!require("corrplot")) install.packages("corrplot")
#Prepare corrlpot

#encoding memory type
correlationPlot = function(cleanedData){
  encodingIndex = 1
  type = names(table(cleanedData$Memory_Type))
  for (i in type){
    cleanedData$Memory_Type[cleanedData$Memory_Type == i] = encodingIndex
    encodingIndex = encodingIndex+1
  }
  cleanedData$Memory_Type = as.numeric(cleanedData$Memory_Type)
  dropCol = c("Manufacturer", "Dedicated")
  cleanedData = cleanedData[, !names(cleanedData) %in% dropCol]
  cleanedData$Release_Date = as.numeric(Sys.Date() - cleanedData$Release_Date)
  corrplot(cor(cleanedData), method = "number", number.cex = 0.7, tl.cex = 0.7)
}
correlationPlot(cleanedData)
