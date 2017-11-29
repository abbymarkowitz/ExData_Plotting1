powerdata <- data.table::fread("~/coursera/power.txt")

#subset to desired dates
subset <-rbind(powerdata[powerdata$Date=="1/2/2007",],powerdata[powerdata$Date=="2/2/2007",])

#convert to date and time formats
powerdata$Date <- as.Date(powerdata$Date, format= "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")

#graph 4
par(mfrow=c(2,2))

with(subset, {
  plot(globalActivePower~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
