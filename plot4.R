#downloading and reading data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./electricpowdercon.zip" )
unziped<-unzip("electricpowdercon.zip")
data<-read.csv(unziped, sep = ";", stringsAsFactors = F, na.strings = "?")

#formating and subseting
data$Date<-as.Date(data$Date , format="%d/%m/%Y")
library(dplyr)
data<-filter(data, Date=="2007-02-01"| Date=="2007-02-02")
data$Time<-strptime(paste(data$Date,data$Time),"%F %T")

#plot

png("plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1))
#1
plot(data$Time, data$Global_active_power, xlab = "", ylab="Global Active Power(kilowatts)", type = "l")
#2
plot(data$Time, data$Voltage, xlab = "datetime", type="l")
#3
plot(data$Time, data$Sub_metering_1, xlab = "", ylab="Energy sub metering", type = "l")
lines(data$Time, data$Sub_metering_2, col="red", type = "l")
lines(data$Time, data$Sub_metering_3, col="blue", type = "l")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
#4
plot(data$Time, data$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")
dev.off()
