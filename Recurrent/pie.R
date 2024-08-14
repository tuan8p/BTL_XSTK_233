#package
if(!require("RColorBrewer")) install.packages("RColorBrewer")
if(!require("seqinr")) install.packages("seqinr")
# PIE CHART

# Manufacturer
ma = table(cleanedData$Manufacturer)
pie(ma, main = "Bieu do tron cua Manufacturer", radius =  1.3)

# Memory_Type
mt = table(cleanedData$Memory_Type)
#swap 2 columns for better visuallization
swap(names(mt)[7], names(mt)[8])
swap(mt[7], mt[8])
pie(mt, main = "Bieu do tron cua Memory_Type", col = brewer.pal(9, 'Set3'), radius = 1.3) 