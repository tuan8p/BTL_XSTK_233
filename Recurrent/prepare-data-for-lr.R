#Prepare data for Linear Regression

#Prepare for Pixel Rate
prepareLinear_PixelRate = function(cleanedData) {
  dropCol = c("Manufacturer", "Dedicated", "Memory_Speed(MHz)","Texture_Rate(GTexel/s)",
              "Memory_Bandwidth(GB/sec)","Release_Date")
  cleanedData = cleanedData[, !names(cleanedData) %in% dropCol]
  return (cleanedData)
}

#Prepare for Memory PSeed
prepareLinear_MemorySpeed = function(cleanedData){
  dropCol = c("Manufacturer", "Dedicated", "Pixel_Rate(GPixel/s)","Texture_Rate(GTexel/s)",
              "Memory_Bandwidth(GB/sec)","Release_Date")
  cleanedData = cleanedData[, !names(cleanedData) %in% dropCol]
  return (cleanedData)
}

dataPixelRate = prepareLinear_PixelRate(cleanedData)
View(dataPixelRate)
dataMemorySpeed = prepareLinear_MemorySpeed(cleanedData)
View(dataMemorySpeed)
