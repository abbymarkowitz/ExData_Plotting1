powerdata <- data.table::fread("~/coursera/power.txt")

#subset to desired dates
subset <-rbind(powerdata[powerdata$Date=="1/2/2007",],powerdata[powerdata$Date=="2/2/2007",])

#convert to date and time formats
powerdata$Date <- as.Date(powerdata$Date, format= "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")


#graph 1 - histogram

subset$globalActivePower <- as.numeric(subset$Global_active_power)

png("plot1.png", width=480, height=480)

hist(subset$globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off() 