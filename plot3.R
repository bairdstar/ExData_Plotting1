data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]
data$DateTime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

#plot3
with(data, {
  plot(Sub_metering_1~DateTime, col='Black', type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# export the plot to file:plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
# close device to finalize the file
dev.off()
