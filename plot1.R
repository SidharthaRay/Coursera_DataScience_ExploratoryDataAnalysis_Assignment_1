#Histogram of "Global Active Power" 
plot1 <- function() {
  #load the data
  elPoCons <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
  
  #fetch records only from 1st and 2nd Feb 2007 
  elPoCons <- elPoCons[elPoCons$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #derive the DateTime attribute from the Date and Time columns of the data frame
  elPoCons$Datetime <- strptime(paste(elPoCons$Date, elPoCons$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  #change globalActivePower class to numeric
  elPoCons$GlobalActivePower <- as.numeric(elPoCons$Global_active_power)
  
  #initiate png graphics device
  png("plot1.png", width = 480, height = 480, units = "px")
  
  #plot the histogram
  hist(elPoCons$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  #turn off the png graphics device
  dev.off()
}
