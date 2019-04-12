library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2days<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

dateTime <- strptime(paste(as.character(data2days$Date), data2days$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

dev.off()

par(mfrow=c(2,2))

plot(dateTime,as.numeric(data2days$Global_active_power),type = "l",xlab="",ylab="Global Active Power")

plot(dateTime,as.numeric(data2days$Voltage),type = "l",xlab="datetime",ylab="Voltage")

plot(dateTime,as.numeric(data2days$Sub_metering_1),type = "l",xlab="",ylab="Energy sub metering")
lines(dateTime,as.numeric(data2days$Sub_metering_2),type = "l",col="red")
lines(dateTime,as.numeric(data2days$Sub_metering_3),type = "l",col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n",cex = 0.9,pt.cex=2,
       text.width=c(2,3,3,3),inset = c(0.4, -0.2),
       xjust=0.5,yjust=0.5,x.intersp = 0.4,y.intersp=0.1, 
       seg.len = 0.5)

plot(dateTime,as.numeric(data2days$Global_reactive_power),type = "l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,filename = "plot4.png",
         width = 480, height = 480, units = "px")

dev.off()

