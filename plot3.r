data<-read.table('household_power_consumption.txt', sep=';', quote="", stringsAsFactors=F, header=T)
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$time<-paste(data$Date, data$Time)
data$time<-strptime(data$time, '%d/%m/%Y %H:%M:%S')
data[,3:9]<-as.data.frame(apply(data[,3:9], 2, as.numeric))

#plot3
png('plot3.png')
plot(data$time, data$Sub_metering_1, type='l', xlab='', col='Green',
     ylab='Energy sub metering')
lines(data$time, data$Sub_metering_2, col='Red')
lines(data$time, data$Sub_metering_3, col='Blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('Green', 'Red', 'Blue'), lwd=1)
dev.off()