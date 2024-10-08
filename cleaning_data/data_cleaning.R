# FUNC: Clean blank value
blankToNA = function(rawData){
  # Clear unwanted value
  unwantedCharacters <- c("", " ", "\n", "\n- ", "\n ", "\nUnknown Release Date ")
  for(ch in unwantedCharacters){
    rawData[rawData == ch] = NA
  }
  afterRemove = rawData
  return(afterRemove)
}

# FUNC: Drop unwanted columns and rows
droppingData = function(blankToNAData) {
  # Drop row: Only keep Nvidia and AMD
  keepRow <- c("AMD", "Nvidia")
  afterDropping = blankToNAData[blankToNAData$Manufacturer %in% keepRow,]
  
  # Drop non-related column
  dropCol <- c("Architecture", "Best_Resolution", "Boost_Clock", "Direct_X",
               "DVI_Connection", "DisplayPort_Connection", "HDMI_Connection", 
               "Integrated", "Name", "Notebook_GPU", "Open_GL", "PSU", 
               "Power_Connector", "ROPs", "Release_Price", "SLI_Crossfire", 
               "Shader", "VGA_Connection", "Resolution_WxH")
  #Drop column with number of values <= 50%
  numberOfValue <-nrow(afterDropping)
  for(col in 1:ncol(afterDropping)){
    if(colSums(!is.na(afterDropping[col])) <= 0.5*numberOfValue){
      dropCol <- append(dropCol, colnames(afterDropping[col]))
    }
  }
  make.unique(dropCol) # Make sure that there's no repetitive column names while dropping
  afterDropping = afterDropping[,!(names(afterDropping) %in% dropCol)] # Drop columns
  afterDropping = na.omit(afterDropping) # Remove every rows has NAs
  return(afterDropping)
}

# FUNC: Transform data
transformingData = function(droppedData){
  # List all columns with unwanted value to clean
  originColName <- c("Core_Speed","L2_Cache", "Max_Power","Memory", "Memory_Bandwidth",
                     "Memory_Bus", "Memory_Speed", "Pixel_Rate", "Process", "Texture_Rate")
  
  # List all of their patterns to remove
  patterns <- c(" MHz", "KB|x2|x3|x4|\\(|\\)", " Watts", " MB", "GB/sec",
                " Bit", " MHz", " GPixel/s", "nm", " GTexel/s")
  
  # Add units to column names since we've removed them while removing patterns: "stringi": package
  # We can utilize the pattern list above to add units to names
  naming <- stri_replace_all_regex(patterns, pattern = " ", replacement = "")
  naming[2] <- "KB" # Give L2_cache its own unit
  
  # Start removing unwanted values
  for(i in 1:length(patterns)){
    # Turn each column into atomic vector, since "stri_replace_all_regex" requires so.
    data <- deframe(droppedData[as.vector(originColName[i])])
    droppedData[originColName[i]] <- stri_replace_all_regex(data, 
                                                            pattern=c(patterns[i]), 
                                                            replacement=c(""))
    atomic_vector <- unlist(droppedData[originColName[i]]) # Flatten list to atomic vector 
    droppedData[originColName[i]] <- as.numeric(atomic_vector) # Convert to numeric value
    if(originColName[i] != "Memory_Bandwidth")
      droppedData[originColName[i]] <- as.integer(atomic_vector) # Convert to integer value
    
    # Renaming columns: adding units
    names(droppedData)[names(droppedData) == originColName[i]] <- paste(originColName[i], "(", naming[i], ")", sep="")
  }
  month_mapping <- c("Jan" = "01", "Feb" = "02", "Mar" = "03", "Apr" = "04", 
                     "May" = "05", "Jun" = "06", "Jul" = "07", "Aug" = "08", 
                     "Sep" = "09", "Oct" = "10", "Nov" = "11", "Dec" = "12")
  for (month_name in names(month_mapping)) {
    droppedData$Release_Date <- gsub(month_name, month_mapping[month_name], droppedData$Release_Date)
  }
  droppedData$Release_Date <- as.Date(droppedData$Release_Date, format="\n%d-%m-%Y ") #Date form
  transformedData = droppedData
  return(transformedData)
}

# Process data
cleanedData <- blankToNA(rawData)
cleanedData <- droppingData(cleanedData)
cleanedData <- transformingData(cleanedData)

#View cleaned data
View(cleanedData)
str(cleanedData)

#Freq table
freqCleanedTable = apply(cleanedData, 2, table)
View(freqCleanedTable)