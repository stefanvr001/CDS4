options("digits" = 16)
options("scipen" = 999)
library(lubridate)
setwd("C:/Users/VA5005/Documents/R/R Exercises/Coursera/Course4")

data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data$Date2<-as.Date(as.character(data$Date), format = "%d/%m/%Y")

data2<-subset(data, Date2 == '2007-02-01' | Date2 == '2007-02-02')

data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$Global_active_power_kw<-data2$Global_active_power/1000

data2$Date2_full<-paste(data2$Date2, data2$Time)
data2$Date2_full<-as.POSIXct(data2$Date2_full)

png(filename="plot3.png", width = 480, height = 480)
plot(x = data2$Date2_full, y = data2$Sub_metering_1, ylab = 'Energy sub metering', xlab = '', 
     main = '', #xaxt = 'n', 
     typ = 'l' , col = 'black')
lines(x = data2$Date2_full, y = data2$Sub_metering_2, #ylab = 'Energy sub metering', xlab = '', 
      main = '', #xaxt = 'n', 
      typ = 'l' , col = 'red')
lines(x = data2$Date2_full, y = data2$Sub_metering_3, #ylab = 'Energy sub metering', xlab = '', 
      main = '', #xaxt = 'n', 
      typ = 'l' , col = 'blue')
legend("topright", pch = 150, 
       col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
