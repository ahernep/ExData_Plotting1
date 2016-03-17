genPlot1 <- function() {
  
powerData <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
powerData$Date <- as.Date(as.character(powerData$Date), "%d/%m/%Y")
powerData <- subset(powerData, powerData$Date >= as.Date("2007-02-01") & 
                      powerData$Date <= as.Date("2007-02-02"))
png(filename="Plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(powerData$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatss)",
     col="red")
dev.off()
}