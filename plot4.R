data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]
data$DateTime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

#plot4
par(mfrow=c(2,2), mar=c(4,5,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power", xlab="")
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
