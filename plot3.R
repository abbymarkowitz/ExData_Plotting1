powerdata <- data.table::fread("~/coursera/power.txt")

#subset to desired dates
subset <-rbind(powerdata[powerdata$Date=="1/2/2007",],powerdata[powerdata$Date=="2/2/2007",])

#convert to date and time formats
powerdata$Date <- as.Date(powerdata$Date, format= "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
