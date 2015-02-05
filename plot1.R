##Unzipped file household_power_consumption.txt should be places to the R working directory
library(dplyr)   

##reading the table
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors=F)
data <- tbl_df(data)

##converting column Date to date datatype
data$Date <- as.Date(data$Date,"%d/%m/%Y")

##filtering records for two days
data <- filter(data, data$Date >= as.Date("01/02/2007","%d/%m/%Y") & 
                       data$Date <= as.Date("02/02/2007","%d/%m/%Y"))

##converting Global active power to numeric datatype
array <- as.numeric(as.character(data$Global_active_power))

##assigning plot title and x-axe title
title <- "Global Active Power"
xlabel <- "Global Active Power (kilowatts)"

##writing plot to png file
png(file = "plot1.png")
hist(array, xlab = xlabel , col= "red", main = title)
dev.off()

message("Plot was saved as file plot1.png")