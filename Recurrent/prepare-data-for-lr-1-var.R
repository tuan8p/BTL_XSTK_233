#Prepare data for Linear Regression

#Prepare for Max power
prepareLinear_MaxPower = function(cleanedData) {
  getCol = c("Max_Power(Watts)", "Memory_Bandwidth(GB/sec)")
  cleanedData = cleanedData[, names(cleanedData) %in% getCol]
  return (cleanedData)
}

#Prepare for texture_rate
prepareLinear_TextureRate = function(cleanedData){
  getCol = c("Texture_Rate(GTexel/s)", "Pixel_Rate(GPixel/s)")
  cleanedData = cleanedData[, names(cleanedData) %in% getCol]
  return (cleanedData)
}

dataMaxPower = prepareLinear_MaxPower(cleanedData)
View(dataMaxPower)
# calculate Covariance of Max_Power(Watts) and Memory_Bandwidth(GB/sec)
sprintf("Covariance cua Max_Power(Watts) va Memory_Bandwidth(GB/sec) la: %s", cov(dataMaxPower$`Max_Power(Watts)`, dataMaxPower$`Memory_Bandwidth(GB/sec)`))
dataTextureRate = prepareLinear_TextureRate(cleanedData)
View(dataTextureRate)
# calculate Covariance of Pixel_Rate(GPixel/s) and Texture_Rate(GTexel/s)
sprintf("Covariance cua Pixel_Rate(GPixel/s) va Texture_Rate(GTexel/s) la: %s",cov(dataTextureRate$`Pixel_Rate(GPixel/s)`, dataTextureRate$`Texture_Rate(GTexel/s)`))
