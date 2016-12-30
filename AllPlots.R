data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]
data$DateTime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

#plot1
par(mfrow=c(1,1),mar=c(4,4,2,1))
#with(data,hist(Global_active_power) )
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# export the plot to file:plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
# close device to finalize the file
dev.off()hist()

#plot2
#plot(data$Global_active_power~as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S"), type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# export the plot to file:plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
# close device to finalize the file
dev.off()

#plot3
with(data, {
  plot(Sub_metering_1~DateTime, col='Black', type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),y.leg[45])
# export the plot to file:plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
# close device to finalize the file
dev.off()

#plot4
par(mfrow=c(2,2), mar=c(4,5,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~DateTime, col='Black',type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", ylab="Global_Rective_Power",xlab="")
})
# export the plot to file:plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
# close device to finalize the file
dev.off()
