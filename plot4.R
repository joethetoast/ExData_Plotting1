pwr <- read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
pwr$Datetime <- paste(pwr$Date, pwr$Time, sep=" ")
pwr$Datetime <- strptime(pwr$Datetime, "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")

start_date <- as.Date('02/01/2007', '%m/%d/%Y')
end_date <- as.Date('02/02/2007', '%m/%d/%Y')
pwr <- pwr[pwr$Date >= start_date & pwr$Date <= end_date,]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(pwr, plot(pwr$Datetime, pwr$Global_active_power, xlab="", ylab="Global Active Power", type="l"))
with(pwr, plot(pwr$Datetime, pwr$Voltage, xlab="datetime", ylab="Voltage", type="l"))

with(pwr, plot(pwr$Datetime, pwr$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l"))
points(pwr$Datetime, pwr$Sub_metering_2, col="red", type="l")
points(pwr$Datetime, pwr$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0, lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))

with(pwr, plot(pwr$Datetime, pwr$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l"))

dev.off()
