library(plyr)
eps <- read.csv("F:/Coursera/R/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
eps <- eps[eps$Date == "1/2/2007" | eps$Date== "2/2/2007", ]
eps <- mutate(eps, Time = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png("Plot2.png")
plot(eps$Time, eps$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)")

dev.off()