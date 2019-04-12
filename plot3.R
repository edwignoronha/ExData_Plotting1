library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2days<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

dateTime <- strptime(paste(as.character(data2days$Date), data2days$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

plot(dateTime,as.numeric(data2days$Sub_metering_1),type = "l",xlab="",ylab="Energy sub metering")
lines(dateTime,as.numeric(data2days$Sub_metering_2),type = "l",col="red")
lines(dateTime,as.numeric(data2days$Sub_metering_3),type = "l",col="blue")
par(mai=c(0,0,0,0),mar=c(0,0,0,0))

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"),y.intersp=0.2,x.intersp=0.5, xjust=0, yjust=0,
       inset = 0)


dev.copy(png,filename = "plot3.png",
         width = 480, height = 480, units = "px")

dev.off()

