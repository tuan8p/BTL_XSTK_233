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
# Giả thuyết H0: memory_speed lớn hơn 1200
memory_speed <- GPU$Memory_Speed
pValue = t.test(memory_speed, mu = 1200, alternative = "greater")$p.value
print(pValue)

# p = 0.9995722 > 0.05 => Không có cơ sở để bác bỏ giả thuyết H0

# Kiểm định 2 mẫu
# Giả thuyết H0: memory_speed của nhà sản xuất Nvidia và AMD không khác nhau

memory_speed_NVIDIA <- GPU[GPU$Manufacturer == "Nvidia", ]$Memory_Speed
memory_speed_AMD <- GPU[GPU$Manufacturer == "AMD", ]$Memory_Speed

pValue = t.test(memory_speed_NVIDIA, memory_speed_AMD)$p.value
print(pValue)

# p = 4.887e-13 < 0.05 => Bác bỏ giả thuyết H0