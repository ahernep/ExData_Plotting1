
genPlot2 <- function() {
  
  powerData <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
  powerData$DateTime <- paste(powerData$Date, powerData$Time)
  powerData$DateTime <- strptime(as.character(powerData$DateTime), format = "%d/%m/%Y %H:%M:%S")
  powerData$Date <- as.Date(as.character(powerData$Date), "%d/%m/%Y")
  
  powerData <- subset(powerData, powerData$Date >= as.Date("2007-02-01") & 
                        powerData$Date <= as.Date("2007-02-02"))
  powerData$Time <- strptime(as.character(powerData$Time), format = "%H:%M:%S")
  powerData$Global_active_power <- as.integer(powerData$Global_active_power)
  png(filename="Plot2.png", width = 480, height = 480)
  ##plot time
  plot(powerData$DateTime, powerData$Global_active_power, type = "l", 
       xlab="", ylab = "Global Active Power (kilowatts)")
  dev.off()
  
}
