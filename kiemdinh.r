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

if (shapiro_pValue > alpha) {
    print("Phân phối chuẩn")
    critical <- qt(1 - alpha, n - 1)
    result <- (memory_speed_mean - lmao) / (memory_speed_sd / sqrt(n))
} else {
    print("Không phải phân phối chuẩn")
    critical <- qnorm(1 - alpha)
    result <- (memory_speed_mean - lmao) / (memory_speed_sd / sqrt(n))
}
print("Kết quả")
print(result)
print("Miền bác bỏ")
print(critical)

if (result > critical) {
    print("Bác bỏ giả thuyết H0")
} else {
    print("Không đủ cơ sở để bác bỏ giả thuyết H0")
}

# Kiểm định 2 mẫu
# Giả thuyết H0: memory_speed của nhà sản xuất Nvidia và AMD bằng nhau
# Giả thuyết H1: memory_speed của nhà sản xuất Nvidia và AMD không bằng nhau

# memory_speed_NVIDIA <- GPU[GPU$Manufacturer == "Nvidia", ]$Memory_Speed
# memory_speed_AMD <- GPU[GPU$Manufacturer == "AMD", ]$Memory_Speed

alpha <- 0.05

memory_speed_NVIDIA_n <- nrow(GPU[GPU$Manufacturer == "Nvidia", ])
memory_speed_AMD_n <- nrow(GPU[GPU$Manufacturer == "AMD", ])

memory_speed_NVIDIA_mean <- mean(memory_speed_NVIDIA)
memory_speed_AMD_mean <- mean(memory_speed_AMD)

memory_speed_NVIDIA_sd <- sd(memory_speed_NVIDIA)
memory_speed_AMD_sd <- sd(memory_speed_AMD)

# Dùng Shapiro–Wilk test để kiểm tra phân phối chuẩn
shapiro_test_NVIDIA <- shapiro.test(memory_speed_NVIDIA)
shapiro_pValue_NVIDIA <- shapiro_test_NVIDIA$p.value
print(shapiro_pValue_NVIDIA)

shapiro_test_AMD <- shapiro.test(memory_speed_AMD)
shapiro_pValue_AMD <- shapiro_test_AMD$p.value
print(shapiro_pValue_AMD)

if (shapiro_pValue_NVIDIA > alpha & shapiro_pValue_AMD > alpha) {
    print("Phân phối chuẩn")
    var_pValue <- memory_speed_NVIDIA_sd / memory_speed_AMD_sd
    if (var_pValue > 0.5 & var_pValue < 2) {
        print("Phương sai bằng nhau")

        critical <- qt(1 - alpha / 2, memory_speed_NVIDIA_n + memory_speed_AMD_n - 2)
        sp_square <- ((memory_speed_NVIDIA_n - 1) * memory_speed_NVIDIA_sd ^ 2 + (memory_speed_AMD_n - 1) * memory_speed_AMD_sd ^ 2) / (memory_speed_NVIDIA_n + memory_speed_AMD_n - 2)
        result <- (memory_speed_NVIDIA_mean - memory_speed_AMD_mean) / sqrt(sp_square * (1 / memory_speed_NVIDIA_n + 1 / memory_speed_AMD_n))
    } else {
        print("Phương sai không bằng nhau")

        v <- (memory_speed_NVIDIA_sd ^ 2 / memory_speed_NVIDIA_n + memory_speed_AMD_sd ^ 2 / memory_speed_AMD_n) ^ 2 / ((memory_speed_NVIDIA_sd ^ 2 / memory_speed_NVIDIA_n) ^ 2 / (memory_speed_NVIDIA_n - 1) + (memory_speed_AMD_sd ^ 2 / memory_speed_AMD_n) ^ 2 / (memory_speed_AMD_n - 1))
        critical <- qt(1 - alpha / 2, round(v))

        result <- (memory_speed_NVIDIA_mean - memory_speed_AMD_mean) / sqrt(memory_speed_NVIDIA_sd ^ 2 / memory_speed_NVIDIA_n + memory_speed_AMD_sd ^ 2 / memory_speed_AMD_n)
    }
} else {
    print("Không phải phân phối chuẩn")
    critical <- qnorm(1 - alpha / 2)
    result <- (memory_speed_NVIDIA_mean - memory_speed_AMD_mean) / sqrt(memory_speed_NVIDIA_sd ^ 2 / memory_speed_NVIDIA_n + memory_speed_AMD_sd ^ 2 / memory_speed_AMD_n)
}

print("Kết quả")
print(result)
print("Miền bác bỏ")
print(critical)

if (result > critical | result < -critical) {
    print("Bác bỏ giả thuyết H0")
} else {
    print("Không đủ cơ sở để bác bỏ giả thuyết H0")
}


########################################################################################
# Tài liệu tham khảo
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/shapiro.test
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/TDist
# https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/Normal
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/nrow
########################################################################################