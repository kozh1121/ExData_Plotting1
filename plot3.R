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

##converting arrays
ysm1 <- as.numeric(as.character(data$Sub_metering_1))
ysm2 <- as.numeric(as.character(data$Sub_metering_2))
ysm3 <- data$Sub_metering_3
xarray <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
ylabel <- "Energy sub metering"

##writing plot to png file
png(file = "plot3.png")
plot(xarray, ysm1, type = "n", xlab = "", ylab = ylabel)
lines(xarray,ysm1,col = "black")
lines(xarray,ysm2,col = "red")
lines(xarray,ysm3,col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 
dev.off()

message("Plot was saved as file plot3.png")






