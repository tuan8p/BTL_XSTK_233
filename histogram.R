data <- read.csv("C:/Users/admin/Documents/Zalo Received Files/All_GPUs.csv")
data$Memory_Bandwidth <- as.numeric(gsub("GB/sec","",data$Memory_Bandwidth))
hist(data$Memory_Bandwidth,
     breaks=50,
     main="Histogram of Memory Bandwidth",
     xlab="Memory Bandwidth (GB/sec)",
     ylab="Frequency",
     col="dodgerblue",
     border="black",
     xlim=c(0,800),
     ylim=c(0,450))