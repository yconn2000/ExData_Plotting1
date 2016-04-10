#read in downloaded data
powr <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings='?')

#subset the data to assigned date range
powr1<-subset(powr, powr$Date %in% c("1/2/2007","2/2/2007"))
powr1$Timestamp <-paste(powr1$Date, powr1$Time)

Sub_metering_1 <- as.numeric(as.character(powr1$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(powr1$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(powr1$Sub_metering_3))


png("plot3.png", width=480, height=480)
  plot(strptime(powr1$Timestamp, "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", ylab="Energy Submetering", xlab="")

  #Adds line graph for date/time v Sub metering in red
  lines(strptime(powr1$Timestamp, "%d/%m/%Y %H:%M:%S"), powr1$Sub_metering_2, type = "l", col = "red" )

  #Adds line graph for date/time v Sub metering in blue
  lines(strptime(powr1$Timestamp, "%d/%m/%Y %H:%M:%S"), powr1$Sub_metering_3, type = "l", col = "blue" )

  #Adds legend to graph
  legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 