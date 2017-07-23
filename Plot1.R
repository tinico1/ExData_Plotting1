library(plyr)
eps <- read.csv("F:/Coursera/R/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
eps <- eps[eps$Date == "1/2/2007" | eps$Date== "2/2/2007", ]
eps <- mutate(eps, Time = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png("Plot1.png")
hist(as.numeric(eps$Global_active_power), col = "red",  main = "Global Active Power", xlab = "Global Active Power (kilowatt)")

dev.off()