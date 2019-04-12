library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2days<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

plot(strptime(paste(as.character(data2days$Date), data2days$Time, sep=" "), "%Y-%m-%d %H:%M:%S"),
     as.numeric(data2days$Global_active_power),type = "l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,filename = "plot2.png",
         width = 480, height = 480, units = "px")

dev.off()

