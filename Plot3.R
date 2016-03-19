
genPlot3 <- function() {
  
  powerData <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
  powerData$DateTime <- paste(powerData$Date, powerData$Time)
  powerData$DateTime <- strptime(as.character(powerData$DateTime), format = "%d/%m/%Y %H:%M:%S")
  powerData$Date <- as.Date(as.character(powerData$Date), "%d/%m/%Y")
  
  powerData <- subset(powerData, powerData$Date >= as.Date("2007-02-01") & 
                        powerData$Date <= as.Date("2007-02-02"))
  powerData$Time <- strptime(as.character(powerData$Time), format = "%H:%M:%S")
  powerData$Global_active_power <- as.integer(powerData$Global_active_power)
  powerData$Sub_metering_1 <- as.double(powerData$Sub_metering_1)
  powerData$Sub_metering_2 <- as.double(powerData$Sub_metering_2)
  powerData$Sub_metering_3 <- as.double(powerData$Sub_metering_3)
  ##plot time
  png(filename="Plot3.png", width = 480, height = 480)
  plot(powerData$DateTime, powerData$Sub_metering_1, type="l",
       xlab="", ylab="Energy sub metering")
  lines(powerData$DateTime, powerData$Sub_metering_2, col="red")
  lines(powerData$DateTime, powerData$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1),
         lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"))
  dev.off()
  
}