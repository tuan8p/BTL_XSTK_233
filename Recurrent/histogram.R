# HISTOGRAM
# Core_Speed

hist(cleanedData$`Core_Speed(MHz)`, xlab = "Core_Speed", main = "Histogram of Core_Speed", col = "blue")

# L2_Cache
hist(cleanedData$`L2_Cache(KB)`, xlab = "L2_Cache", main = "Histogram of L2_Cache", col = "blue")

# Max_Power
hist(cleanedData$`Max_Power(Watts)`, xlab = "Max_Power", main = "Histogram of Max_Power", col = "blue")

# Memory
hist(cleanedData$`Memory(MB)`, xlab = "Memory", main = "Histogram of Memory", col = "blue")

# Memory_Bandwidth
hist(cleanedData$`Memory_Bandwidth(GB/sec)`, xlab = "Memory_Bandwidth", main = "Histogram of Memory_Bandwidth", col = "blue")

# Memory_Bus
hist(cleanedData$`Memory_Bus(Bit)`, xlab = "Memory_Bus", main = "Histogram of Memory_Bus", col = "blue")

# Memory_Speed
hist(cleanedData$`Memory_Speed(MHz)`, xlab = "Memory_Speed", main = "Histogram of Memory_Speed", col = "blue")

# Pixel_Rate
hist(cleanedData$`Pixel_Rate(GPixel/s)`, xlab = "Pixel_Rate", main = "Histogram of Pixel_Rate", col = "blue")

# Process
hist(cleanedData$`Process(nm)`, xlab = "Process", main = "Histogram of Process", col = "blue")

# TMUs
hist(cleanedData$TMUs, xlab = "TMUs", main = "Histogram of TMUs", col = "blue")

# Texture_Rate
hist(cleanedData$`Texture_Rate(GTexel/s)`, xlab = "Texture_Rate", main = "Histogram of Texture_Rate", col = "blue")
