plot4<-function(){
  house <- read.csv('household_power_consumption.txt', sep = ';')
  house <- subset(house, subset = Date %in% c('1/2/2007','2/2/2007'))
  house[,3:9] = sapply(house[,3:9], as.numeric)
  
  datetime <- paste(house$Date, house$Time)
  datetime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')
  
  png(filename = 'plot4.png')
  
  par(mfcol=c(2,2))
  plot(x=datetime, y= house$Global_active_power, type = 'l', 
       ylab='Global Active Power (kilowatts)', xlab='')
  
  plot(x=datetime, y=house$Sub_metering_1, type = 'l', col='black', lwd=1, 
       ylab = 'Energy sub metering', xlab = '')
  lines(x=datetime, y=house$Sub_metering_2, type = 'l', col='red', lwd=1)
  lines(x=datetime, y=house$Sub_metering_3, type = 'l', col='blue', lwd=1)
  legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
         ,col = c('black', 'red','blue'),lwd = c(1,1,1))
  
  plot(x=datetime, y=house$Voltage,type ='l', ylab='Voltage', xlab='datetime')
  
  plot(x=datetime, y=house$Global_reactive_power, type='l',
       ylab='Global_reactive_power', xlab='datetime')
  dev.off()
}