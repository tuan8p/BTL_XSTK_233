des_data <- cleanedData[,c("Core_Speed(MHz)", "L2_Cache(KB)", "Max_Power(Watts)", 
                           "Memory(MB)", "Memory_Bandwidth(GB/sec)", "Memory_Bus(Bit)",
                           "Memory_Speed(MHz)", "Pixel_Rate(GPixel/s)", "Process(nm)",
                           "TMUs", "Texture_Rate(GTexel/s)")]
mean<-apply(des_data, 2, mean)
sd<-apply(des_data, 2, sd)
median<-apply(des_data, 2, median)
min<-apply(des_data, 2, min)
max<-apply(des_data, 2, max)

t(data.frame(mean, sd, median, min, max))
