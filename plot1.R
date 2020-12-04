plot1<-function(){
  house <- read.csv('household_power_consumption.txt', sep = ';')
  house <- subset(house, subset = Date %in% c('1/2/2007','2/2/2007'))
  house[,3:9] = sapply(house[,3:9], as.numeric)
  house$Date <- strptime(house$Date, format = '%d/%m/%Y')
  #house$Date <- as.Date(house$Date, format = '%d/%m/%Y')
  house$Time <- strptime(house$Time, format = '%H:%M:%S')
  png(filename = 'plot1.png')
  hist(house$Global_active_power, col='red', main = 'Global Active Power',
       xlab = 'Global Active Power (kilowatts)')
  dev.off()
}