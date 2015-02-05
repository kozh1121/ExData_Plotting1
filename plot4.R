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



##writing plot to png file
png(file = "plot4.png")
par(mfrow = c(2,2))
xarray <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

##first graph
yarray <- as.numeric(data$Global_active_power)
ylabel <- "Global Active Power (kilowatts)"
plot(xarray,yarray,xlab = "", ylab = ylabel, type= "n")
lines(xarray,yarray)


##second graph
yarray <- as.numeric(data$Voltage)
xlabel <- "datetime"
ylabel <- "Voltage"
plot(xarray,yarray,xlab = xlabel, ylab = ylabel, type= "n")
lines(xarray,yarray)



##third graph
ysm1 <- as.numeric(data$Sub_metering_1)
ysm2 <- as.numeric(data$Sub_metering_2)
ysm3 <- data$Sub_metering_3
ylabel <- "Energy sub metering"

plot(xarray, ysm1, type = "n", xlab = "", ylab = ylabel)
lines(xarray,ysm1,col = "black")
lines(xarray,ysm2,col = "red")
lines(xarray,ysm3,col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 

##fourth graph
yarray <- as.numeric(data$Global_reactive_power)
xlabel <- "datetime"
ylabel <- "Global reactive power"
plot(xarray,yarray,xlab = xlabel, ylab = ylabel, type= "n")
lines(xarray,yarray)



dev.off()

message("Plot was saved as file plot4.png")







