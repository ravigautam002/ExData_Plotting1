data<-read.table('household_power_consumption.txt', sep=';', quote="", stringsAsFactors=F, header=T)
data<-data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$time<-paste(data$Date, data$Time)
data$time<-strptime(data$time, '%d/%m/%Y %H:%M:%S')
data[,3:9]<-as.data.frame(apply(data[,3:9], 2, as.numeric))

#plot2
png('plot2.png')
plot(data$time, data$Global_active_power, type='l', xlab='', 
     ylab='Global Active Power (kilowatts)')
dev.off()