#Reading the data
d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

#Creating a new column 'DateTime' and converting the Date and Time variables to Date/Time classes
d$DateTime <- paste(d$Date, d$Time, sep=" ")
d$DateTime <- strptime(d$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Creating a subset of desirable rows since the data is huge
sub <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

#Plotting the desirable graph and saving it as a png file.
dev.copy(png, file="plot2.png", width=480, height=480)
plot(sub$DateTime, sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

