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
png("plot2.png")
plot(data$Time, data$Global_active_power, xlab = "", ylab="Global Active Power(kilowatts)", type = "l")
dev.off()