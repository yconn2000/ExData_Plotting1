#read in downloaded data
powr <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings='?')

#subset the data to assigned date range
powr1<-subset(powr, powr$Date %in% c("1/2/2007","2/2/2007"))

powr1$Timestamp <-paste(powr1$Date, powr1$Time)
Sub_metering_1 <- as.numeric(as.character(powr1$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(powr1$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(powr1$Sub_metering_3))
volt<-as.numeric(powr1$Voltage)
grp1<-as.numeric(powr1$Global_active_power)
 

r_time<-strptime(powr1$Timestamp, "%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##Plot1
plot(r_time, powr1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##Plot2
plot(r_time, volt1, type="l", xlab="datetime", ylab="Voltage")

##Plot3
plot(r_time, Sub_metering_1, type = "l", ylab="Energy Submetering", xlab="")
lines(r_time, powr1$Sub_metering_2, type = "l", col = "red" )
lines(r_time, powr1$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot4
plot(r_time, grp1, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()