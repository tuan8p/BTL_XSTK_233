library(BSDA)

GPU <- read.csv("./All_GPUs.csv")

GPU[GPU == ""] <- NA
GPU[GPU == "N/A"] <- NA
GPU[GPU == "\n- "] <- NA
GPU[GPU == "\n"] <- NA
GPU[GPU == "None "] <- NA
GPU[GPU == "None  "] <- NA
GPU[GPU == "\nUnknown Release Date "] <- NA

print(colMeans(is.na(GPU)))

#     Memory_Speed        Manufacturer
#      0.030827951         0.000000000

# Điền khuyết Memory_Speed bằng giá trị trung vị
GPU$Memory_Speed <- as.numeric(gsub("[^0-9.]", "", GPU$Memory_Speed))
Memory_Speed_median_value <- median(GPU$Memory_Speed, na.rm = TRUE)
GPU$Memory_Speed <- ifelse(is.na(GPU$Memory_Speed), Memory_Speed_median_value, GPU$Memory_Speed)

########################################################################################
# Kiểm định 1 mẫu
# Giả thuyết H0: memory_speed bé hơn hoặc bằng 1200
# Giả thuyết H1: memory_speed lớn hơn 1200

lmao <- 1200
alpha <- 0.05
n <- length(GPU$Memory_Speed)
memory_speed_mean <- mean(GPU$Memory_Speed)
memory_speed_sd <- sd(GPU$Memory_Speed)

# Dùng Shapiro–Wilk test để kiểm tra phân phối chuẩn
shapiro_test <- shapiro.test(GPU$Memory_Speed)
shapiro_pValue <- shapiro_test$p.value
print(shapiro_pValue)
# 3.948443e-22 < 0.05 => Không phải phân phối chuẩn => Sử dụng z test

z_test <- z.test(GPU$Memory_Speed, mu = lmao, sigma.x = memory_speed_sd, conf.level = 1 - alpha, alternative = "greater")
print(z_test)

# 	One-sample z-Test

# data:  GPU$Memory_Speed
# z = -3.3371, p-value = 0.9996
# alternative hypothesis: true mean is greater than 1200
# 95 percent confidence interval:
#  1162.476       NA
# sample estimates:
# mean of x 
#  1174.865

# p-value = 0.9996 > 0.05 => Không đủ cơ sở để bác bỏ giả thuyết H0

########################################################################################
# Kiểm định 2 mẫu
# Giả thuyết H0: memory_speed của nhà sản xuất Nvidia và AMD bằng nhau
# Giả thuyết H1: memory_speed của nhà sản xuất Nvidia và AMD không bằng nhau

memory_speed_NVIDIA <- GPU[GPU$Manufacturer == "Nvidia", ]$Memory_Speed
memory_speed_AMD <- GPU[GPU$Manufacturer == "AMD", ]$Memory_Speed

alpha <- 0.05

memory_speed_NVIDIA_n <- nrow(GPU[GPU$Manufacturer == "Nvidia", ])
print(memory_speed_NVIDIA_n)
# 1743
memory_speed_AMD_n <- nrow(GPU[GPU$Manufacturer == "AMD", ])
print(memory_speed_AMD_n)
# 1317

# Vì 1743 != 1317 nên 2 mẫu độc lập

memory_speed_NVIDIA_sd <- sd(memory_speed_NVIDIA)
memory_speed_AMD_sd <- sd(memory_speed_AMD)

# Dùng Shapiro–Wilk test để kiểm tra phân phối chuẩn
shapiro_test_NVIDIA <- shapiro.test(memory_speed_NVIDIA)
shapiro_pValue_NVIDIA <- shapiro_test_NVIDIA$p.value
print(shapiro_pValue_NVIDIA)
# 3.338881e-21

shapiro_test_AMD <- shapiro.test(memory_speed_AMD)
shapiro_pValue_AMD <- shapiro_test_AMD$p.value
print(shapiro_pValue_AMD)
# 1.69264e-08

# 3.338881e-21 < 0.05 & 1.69264e-08 < 0.05 => Không phải phân phối chuẩn => Sử dụng z test

z_test <- z.test(x = memory_speed_NVIDIA, y = memory_speed_AMD, sigma.x = memory_speed_NVIDIA_sd, sigma.y = memory_speed_AMD_sd, conf.level = 1 - alpha, alternative = "two.sided")
print(z_test)

# 	Two-sample z-Test

# data:  memory_speed_NVIDIA and memory_speed_AMD
# z = 7.2601, p-value = 3.868e-13
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   80.84935 140.64476
# sample estimates:
# mean of x mean of y 
#  1232.705  1121.957 

# p-value = 3.868e-13 < 0.05 => Bác bỏ giả thuyết H0


########################################################################################
# Tài liệu tham khảo
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/shapiro.test
# https://www.rdocumentation.org/packages/BSDA/versions/1.2.2/topics/z.test
########################################################################################