library(data.table)
data<-fread("household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2days<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

hist(as.numeric(data2days$Global_active_power),col = "red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png,filename = "plot1.png",
         width = 480, height = 480, units = "px")
#png(filename = "plot1.png",
#    width = 480, height = 480, units = "px")
dev.off()
