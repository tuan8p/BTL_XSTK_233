#Linear Regression for Max Power
LRMaxPower=  lm(dataMaxPower$`Max_Power(Watts)`  ~ 
                   dataMaxPower$`Memory_Bandwidth(GB/sec)`)
summary(LRMaxPower)
#Tính toán khoảng tin cậy 'Memory_Bandwidth(GB/sec)`
confint(LRMaxPower, level=0.95)

#Residual checking
par(mfrow = c(2, 2))
plot(LRMaxPower)

#Linear Regression for Texture Rate
LRTextureRate=  lm(dataTextureRate$`Texture_Rate(GTexel/s)`  ~ 
                     dataTextureRate$`Pixel_Rate(GPixel/s)`)
summary(LRTextureRate)
#Tính toán khoảng tin cậy Pixel_Rate(GPixel/s)
confint(LRTextureRate, level=0.95)

#Residual checking
par(mfrow = c(2, 2))
plot(LRTextureRate)

#visualization
drawPlot <- function(x, y, xn, yn, line){
  plot(x, y,
       main = sprintf("Duong hoi quy %s theo %s", yn, xn),
       xlab = xn,
       ylab = yn)
  
  abline(line, col = "red")
}

drawPlot(dataMaxPower$`Memory_Bandwidth(GB/sec)`,
         dataMaxPower$`Max_Power(Watts)`,
         names(dataMaxPower)[2], names(dataMaxPower)[1], LRMaxPower)
drawPlot(dataTextureRate$`Pixel_Rate(GPixel/s)`,
         dataTextureRate$`Texture_Rate(GTexel/s)`,
         names(dataTextureRate)[1], names(dataTextureRate)[2], LRTextureRate)

#find confidence interval for y predict of Max Power
MaxPower_predictions <- predict(LRMaxPower, interval = "confidence", level = 0.95)
print(MaxPower_predictions)

#find confidence interval for y predict of LRTextureRate
TextureRate_predictions <- predict(LRTextureRate, interval = "confidence", level = 0.95)
print(TextureRate_predictions)
