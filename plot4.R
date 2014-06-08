#Reading the data
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

#Creating a new column 'DateTime' and converting the Date and Time variables to Date/Time classes
d$DateTime <- paste(d$Date, d$Time, sep=" ")
d$DateTime <- strptime(d$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Creating a subset of desirable rows since the data is huge
sub <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

#Plotting the desirable chart and saving it as a png file.
dev.copy(png, file="plot4.png", width=480, height=480)
par(mfrow = c(2,2)) #changes the default format of the positioning of the plots (2 x 2 plot)

#Plotting the Global Active Power chart
plot(sub$DateTime, sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plotting the voltage chart
plot(sub$DateTime, sub$Voltage, type="l", xlab="", ylab="Voltage")

#Plotting the Energy Sub Metering chart
with(data, {
  plot(sub$DateTime, sub$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
  lines(sub$DateTime, sub$Sub_metering_2, type="l", xlab="", ylab="Energy Sub Metering", col="red")
  lines(sub$DateTime, sub$Sub_metering_3, type="l", xlab="", ylab="Energy Sub Metering", col="blue") 
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1)
})#Using the legend function to in order to add on information in the chart

#Plotting the Global reactive power chart
plot(sub$DateTime, sub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()


