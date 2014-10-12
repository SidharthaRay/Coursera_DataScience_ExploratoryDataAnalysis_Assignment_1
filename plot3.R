#Plot "DateTime" vs (Sub_metering_1, Sub_metering_2 and Sub_metering_3)
plot3 <- function() {
  #load the data
  elPoCons <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
  
  #fetch records only from 1st and 2nd Feb 2007 
  elPoCons <- elPoCons[elPoCons$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #derive the DateTime attribute from the Date and Time columns of the data frame
  elPoCons$Datetime <- strptime(paste(elPoCons$Date, elPoCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  #change globalActivePower, Sub_metering_1, Sub_metering_2 and Sub_metering_3 class to numeric
  elPoCons$globalActivePower <- as.numeric(elPoCons$Global_active_power)
  elPoCons$Sub_metering_1 <- as.numeric(elPoCons$Sub_metering_1)
  elPoCons$Sub_metering_2 <- as.numeric(elPoCons$Sub_metering_2)
  elPoCons$Sub_metering_3 <- as.numeric(elPoCons$Sub_metering_3)
  
  #initiate png graphics device
  png("plot3.png", width = 480, height = 480, units = "px")
    
  #plot DateTime" vs (Sub_metering_1, Sub_metering_2 and Sub_metering_3)
  plot(elPoCons$Datetime, elPoCons$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(elPoCons$Datetime, elPoCons$Sub_metering_2, type="l", col="red")
  lines(elPoCons$Datetime, elPoCons$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  #turn off the png graphics device
  dev.off()
}