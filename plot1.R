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
