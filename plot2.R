plot2<-function(){
  house <- read.csv('household_power_consumption.txt', sep = ';')
  house <- subset(house, subset = Date %in% c('1/2/2007','2/2/2007'))
  house[,3:9] = sapply(house[,3:9], as.numeric)
  
  datetime <- paste(house$Date, house$Time)
  datetime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')
  
  png(filename = 'plot2.png')
  plot(x=datetime, y= house$Global_active_power, type = 'l', 
       ylab='Global Active Power (kilowatts)', xlab='')
  dev.off()
}