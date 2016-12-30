data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]
data$DateTime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

#plot2
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# export the plot to file:plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
# close device to finalize the file
dev.off()
