data<-read.table('household_power_consumption.txt', sep=';', quote="", stringsAsFactors=F, header=T)
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$time<-paste(data$Date, data$Time)
data$time<-strptime(data$time, '%d/%m/%Y %H:%M:%S')
data[,3:9]<-as.data.frame(apply(data[,3:9], 2, as.numeric))

#plot4
png('plot4.png')
par(mfrow=c(2,2), mar=c(4,4,1,1))
plot(data$time, data$Global_active_power, type='l', xlab='', 
     ylab='Global Active Power (kilowatts)')
plot(data$time, data$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(data$time, data$Sub_metering_1, type='l', xlab='', col='Green',
     ylab='Energy sub metering')
lines(data$time, data$Sub_metering_2, col='Red')
lines(data$time, data$Sub_metering_3, col='Blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('Green', 'Red', 'Blue'), lwd=1, cex=0.5)
plot(data$time, data$Global_reactive_power, type='l', xlab='datetime',
     ylab='Global_reactive_power')
dev.off()

