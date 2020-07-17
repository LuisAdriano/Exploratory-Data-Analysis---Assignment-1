## required package
library(dplyr)

## setting working directory
setwd("C:/Disco_D/LAMCD/Coursera/RStudio/programas/Exploratoty-Data-Analysis")

## reading the full data file
arq_dados <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## subsetting file - only the desired period (2 days)
arq_base <- subset(arq_dados, Date %in% c("1/2/2007","2/2/2007"))

## converting dates
arq_base$Date <- as.Date(arq_base$Date, format="%d/%m/%Y")

## plotting histogram on screen
hist(arq_base$Global_active_power, main="Global Active Power", 
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## converting to .png format
png(filename = "plot1.png", width=480, height=480)
hist(arq_base$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## closing device
dev.off()

