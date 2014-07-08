pwr <- read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
pwr$Date <- as.Date(pwr$Date, "%d/%m/%Y")
pwr$Time <- strptime(pwr$Time, "%H:%M:%S")

start_date <- as.Date('02/01/2007', '%m/%d/%Y')
end_date <- as.Date('02/02/2007', '%m/%d/%Y')
pwr <- pwr[pwr$Date >= start_date & pwr$Date <= end_date,]

png('plot1.png', width=480, height=480)
with(pwr, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()

