options("digits" = 16)
options("scipen" = 999)
library(lubridate)
setwd("C:/Users/VA5005/Documents/R/R Exercises/Coursera/Course4")

data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data$Date2<-as.Date(as.character(data$Date), format = "%d/%m/%Y")

data2<-subset(data, Date2 == '2007-02-01' | Date2 == '2007-02-02')

data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$Global_active_power_kw<-data2$Global_active_power/1000

png(filename="plot1.png", width = 480, height = 480)
hist(data2$Global_active_power_kw, col = 'red', #breaks = seq(from = 0, to = 6, by = 0.5),
            ylab = 'Frequency', xlab = 'Global Active Power (kilowatts)', 
            main = "Global Active Power"
            #axis(side=1, at=c(0,2,4,6))
            )

dev.off()




