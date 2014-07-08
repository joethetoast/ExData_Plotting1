pwr <- read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
pwr$Datetime <- paste(pwr$Date, pwr$Time, sep=" ")
pwr$Datetime <- strptime(pwr$Datetime, "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")

start_date <- as.Date('02/01/2007', '%m/%d/%Y')
end_date <- as.Date('02/02/2007', '%m/%d/%Y')
pwr <- pwr[pwr$Date >= start_date & pwr$Date <= end_date,]

png("plot2.png", width=480, height=480)
with(pwr, plot(pwr$Datetime, pwr$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
