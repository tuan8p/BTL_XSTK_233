# Linear Regression of Memory Speed with no Memory

#Linear Regression for Pixel Rate 
LRMemorySpeed_noMemory = lm(dataMemorySpeed$`Memory_Speed(MHz)` ~
                   dataPixelRate$`Core_Speed(MHz)` + dataPixelRate$`L2_Cache(KB)`
                 +dataPixelRate$`Max_Power(Watts)`
                 # + dataPixelRate$`Memory(MB)`
                 +dataPixelRate$`Memory_Bus(Bit)`  + dataPixelRate$Memory_Type
                 + dataPixelRate$`Process(nm)` + dataPixelRate$TMUs)
summary(LRPixelRate)

#Linear Regression for Memory speed
LRMemorySpeed_noMemory_Memory_Type=  lm(dataMemorySpeed$`Memory_Speed(MHz)`  ~ 
                     dataMemorySpeed$`Core_Speed(MHz)` + dataMemorySpeed$`L2_Cache(KB)`
                   +dataMemorySpeed$`Max_Power(Watts)`
                   # + dataMemorySpeed$`Memory(MB)`
                   +dataMemorySpeed$`Memory_Bus(Bit)`  + dataMemorySpeed$Memory_Type
                   + dataMemorySpeed$`Process(nm)` + dataMemorySpeed$TMUs)
#Compare two model
anova(LRMemorySpeed_noMemory_Memory_Type, LRMemorySpeed_noMemory)