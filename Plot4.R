library(plyr)
eps <- read.csv("F:/Coursera/R/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
eps <- eps[eps$Date == "1/2/2007" | eps$Date== "2/2/2007", ]
eps <- mutate(eps, Time = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png("Plot4.png")


op <- par(mfcol = c(2,2), mar = c(5,4,2,2))
plot(eps$Time, eps$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)")

plot(eps$Time, eps$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering", lwd = 2, col = "black")
lines(eps$Time, eps$Sub_metering_2, col = "red", lwd = 2)
lines(eps$Time, eps$Sub_metering_3, col = "blue", lwd = 2)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2, 2), col=c("black", "red", "blue"))

plot(eps$Time, eps$Voltage, type = "l", xlab = "Datetime", ylab = "Voltage")

plot(eps$Time, eps$Global_reactive_power, type = "l", xlab = "Datetime", ylab = "Global Reactive Power (kilowatt)")

par(op)
dev.off()