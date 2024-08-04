# Linear Regression of Pixel Rate with no Memory Bus
LRPixelRate=  lm(dataPixelRate$`Pixel_Rate(GPixel/s)`  ~ 
                   dataPixelRate$`Core_Speed(MHz)` + dataPixelRate$`L2_Cache(KB)`
                 +dataPixelRate$`Max_Power(Watts)`+ dataPixelRate$`Memory(MB)`
                 + dataPixelRate$Memory_Type
                 + dataPixelRate$`Process(nm)` + dataPixelRate$TMUs)
summary(LRPixelRate)