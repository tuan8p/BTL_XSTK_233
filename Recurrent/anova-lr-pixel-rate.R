#anova for Linear Regression of Pixel Rate
# model with full features and VS model with no Memory Type
LRPixelRate=  lm(dataPixelRate$`Pixel_Rate(GPixel/s)`  ~ 
                   dataPixelRate$`Core_Speed(MHz)` + dataPixelRate$`L2_Cache(KB)`
                 +dataPixelRate$`Max_Power(Watts)`+ dataPixelRate$`Memory(MB)`
                 + dataPixelRate$Memory_Type
                 + dataPixelRate$`Process(nm)` + dataPixelRate$TMUs)
summary(LRPixelRate)
LRPixelRate_noMemType = lm(dataPixelRate$`Pixel_Rate(GPixel/s)`  ~ 
                             dataPixelRate$`Core_Speed(MHz)` + dataPixelRate$`L2_Cache(KB)`
                           +dataPixelRate$`Max_Power(Watts)`+ dataPixelRate$`Memory(MB)`
                           + dataPixelRate$`Process(nm)` + dataPixelRate$TMUs)

summary(LRPixelRate_noMemType)
anova(LRPixelRate,LRPixelRate_noMemType)