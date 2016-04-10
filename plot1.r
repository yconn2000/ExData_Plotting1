#read in downloaded data
powr <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings='?')

#subset the data to assigned date range
powr1<-subset(powr, powr$Date %in% c("1/2/2007","2/2/2007"))

#plot to png file
png("plot1.png", width=480, height=480)
  hist(powr1$Global_active_power, xlab='Global Active Power (Kilowatts)', ylab = 'Frequency', main='Global Active Power', col='red')
dev.off()