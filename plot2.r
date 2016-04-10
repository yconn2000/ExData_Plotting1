#read in downloaded data
powr <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings='?')

#subset the data to assigned date range
powr1<-subset(powr, powr$Date %in% c("1/2/2007","2/2/2007"))


powr1$Timestamp <-paste(powr1$Date, powr1$Time)
# Creates graph of date/time vs global active power data
#plot to png file
png("plot2.png", width=480, height=480)
  plot(strptime(powr1$Timestamp, "%d/%m/%Y %H:%M:%S"), powr1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()  

