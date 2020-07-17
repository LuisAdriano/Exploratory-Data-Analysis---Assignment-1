
## setting working directory
setwd("C:/Disco_D/LAMCD/Coursera/RStudio/programas/Exploratoty-Data-Analysis")

## reading the full data file
arq_dados <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## subsetting file - only the desired period (2 days)
arqbase <- subset(arq_dados, Date %in% c("1/2/2007","2/2/2007"))

## converting dates
arq_base$Date <- as.Date(arq_base$Date, format="%d/%m/%Y")

## merging date+time and converting format
data_aux <- paste(as.Date(arq_base$Date), arq_base$Time)
arq_base$Datetime <- as.POSIXct(data_aux)

## Plot to screen
with(arq_base, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## Inserting legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## copying plot to .png file
dev.copy(png, file="plot3.png", height=480, width=480)

## closing device
dev.off()

