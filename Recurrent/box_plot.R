# BOXPLOT
# Core_Speed
boxplot(cleanedData$`Core_Speed(MHz)`, ylab ="Core_Speed", main = "Boxplot of Core_Speed")
stats <- boxplot.stats(cleanedData$`Core_Speed(MHz)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Core_Speed(MHz)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# L2_Cache
boxplot(cleanedData$`L2_Cache(KB)`, ylab = "L2_Cache", main = "Boxplot of L2_Cache")
stats <- boxplot.stats(cleanedData$`L2_Cache(KB)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`L2_Cache(KB)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Max_Power
boxplot(cleanedData$`Max_Power(Watts)`, ylab = "Max_Power", main = "Boxplot of Max_Power")
stats <- boxplot.stats(cleanedData$`Max_Power(Watts)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Max_Power(Watts)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Memory
boxplot(cleanedData$`Memory(MB)`, ylab = "Memory", main = "Boxplot of Memory")
stats <- boxplot.stats(cleanedData$`Memory(MB)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Memory(MB)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Memory_Bandwidth
boxplot(cleanedData$`Memory_Bandwidth(GB/sec)`,  ylab = "Memory_Bandwidth", main = "Boxplot of Memory_Bandwidth")
stats <- boxplot.stats(cleanedData$`Memory_Bandwidth(GB/sec)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Memory_Bandwidth(GB/sec)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Memory_Bus
boxplot(cleanedData$`Memory_Bus(Bit)`, ylab = "Memory_Bus", main = "Boxplot of Memory_Bus")
stats <- boxplot.stats(cleanedData$`Memory_Bus(Bit)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Memory_Bus(Bit)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Memory_Speed
boxplot(cleanedData$`Memory_Speed(MHz)`, ylab = "Memory_Speed", main = "Boxplot of Memory_Speed")
stats <- boxplot.stats(cleanedData$`Memory_Speed(MHz)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Memory_Speed(MHz)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Pixel_Rate
boxplot(cleanedData$`Pixel_Rate(GPixel/s)`, ylab = "Pixel_Rate", main = "Boxplot of Pixel_Rate")
stats <- boxplot.stats(cleanedData$`Pixel_Rate(GPixel/s)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Pixel_Rate(GPixel/s)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Process
boxplot(cleanedData$`Process(nm)`, ylab = "Process", main = "Boxplot of Process")
stats <- boxplot.stats(cleanedData$`Process(nm)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Process(nm)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# TMUs
boxplot(cleanedData$TMUs, ylab = "TMUs", main = "Boxplot of TMUs")
stats <- boxplot.stats(cleanedData$TMUs)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$TMUs)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")

# Texture_Rate
boxplot(cleanedData$`Texture_Rate(GTexel/s)`, ylab = "Texture_Rate", main = "Boxplot of Texture_Rate")
stats <- boxplot.stats(cleanedData$`Texture_Rate(GTexel/s)`)$stats
text(1.2, stats, labels=round(stats, 2), col="red")
max_outlier <- max(boxplot.stats(cleanedData$`Texture_Rate(GTexel/s)`)$out)
text(1.1, max_outlier, labels=round(max_outlier, 2), col="red")