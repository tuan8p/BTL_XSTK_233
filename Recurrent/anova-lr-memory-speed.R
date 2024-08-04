# Linear Regression of Memory Speed with no Memory
LRMemorySpeed_noMemory = lm(dataMemorySpeed$`Memory_Speed(MHz)` ~
                              dataMemorySpeed $`Core_Speed(MHz)` + dataMemorySpeed $`L2_Cache(KB)`
                            +dataMemorySpeed$`Max_Power(Watts)`
                            +dataMemorySpeed$`Memory_Bus(Bit)` + dataMemorySpeed$Memory_Type
                            + dataMemorySpeed$`Process(nm)` + dataMemorySpeed$TMUs)

#Linear Regression of Memory Speed with no Memory & Memory Type
LRMemorySpeed_noMemory_Memory_Type = lm(dataMemorySpeed$`Memory_Speed(MHz)` ~
                                          dataMemorySpeed $`Core_Speed(MHz)` + dataMemorySpeed $`L2_Cache(KB)`
                                        +dataMemorySpeed$`Max_Power(Watts)`
                                        +dataMemorySpeed$`Memory_Bus(Bit)`
                                        + dataMemorySpeed$`Process(nm)` + dataMemorySpeed$TMUs)

#Compare two model
anova(LRMemorySpeed_noMemory_Memory_Type, LRMemorySpeed_noMemory)