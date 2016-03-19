
genPlot4 <- function() {
  
  powerData <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
  powerData$DateTime <- paste(powerData$Date, powerData$Time)
  powerData$DateTime <- strptime(as.character(powerData$DateTime), format = "%d/%m/%Y %H:%M:%S")
  powerData$Date <- as.Date(as.character(powerData$Date), "%d/%m/%Y")
  
  powerData <- subset(powerData, powerData$Date >= as.Date("2007-02-01") & 
                        powerData$Date <= as.Date("2007-02-02"))
  powerData$Time <- strptime(as.character(powerData$Time), format = "%H:%M:%S")
  powerData$Global_active_power <- as.integer(powerData$Global_active_power)
  powerData$Global_reactive_power <- as.integer(powerData$Global_reactive_power)
  powerData$Voltage <- as.integer(powerData$Voltage)
  powerData$Sub_metering_1 <- as.integer(powerData$Sub_metering_1)
  powerData$Sub_metering_2 <- as.integer(powerData$Sub_metering_2)
  powerData$Sub_metering_3 <- as.integer(powerData$Sub_metering_3)
  ##plot time
  png(filename="Plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  
  #plot top left graph
  plot(powerData$DateTime, powerData$Global_active_power, type = "l", 
       xlab="", ylab = "Global Active Power (kilowatts)")
  
  #plot top right graph
  plot(powerData$DateTime, powerData$Voltage, type = "l", 
       xlab="Date time", ylab = "Voltage")
  
  #plot bottom left graph
  plot(powerData$DateTime, powerData$Sub_metering_1, type="l",
       xlab="", ylab="Energy sub metering")
  lines(powerData$DateTime, powerData$Sub_metering_2, col="red")
  lines(powerData$DateTime, powerData$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1),
         lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"))
  
  #Plot bottom right graph
  plot(powerData$DateTime, powerData$Global_reactive_power, type = "l", 
       xlab="Day", ylab = "Global Reactive Power")
  dev.off()
  
}