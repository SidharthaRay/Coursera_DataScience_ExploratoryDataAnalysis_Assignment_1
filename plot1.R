#Histogram of "Global Active Power"
plot1 <- function() {
  #load the data
  elPoCons <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
  
  #change Date column class to Date type
  elPoCons$Date <- as.Date(elPoCons$Date, format="%d/%m/%Y")
  
  #fetch records only from 1st and 2nd Feb 2007 
  elPoCons <- elPoCons[(elPoCons$Date == as.Date("01/02/2007", format="%d/%m/%Y") | elPoCons$Date == as.Date("02/02/2007", format="%d/%m/%Y")),]
  
  #initiate png graphics device
  png("plot1.png", width = 480, height = 480)

  #plot the histogram
  hist(elPoCons$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  #turn off the png graphics device
  dev.off()
}