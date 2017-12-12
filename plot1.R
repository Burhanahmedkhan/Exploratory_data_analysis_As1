library(data.table)
library(lubridate)

power<-read.table('C:/BAK/Data Analytics/Data Sets/household_power_consumption.txt',
                header=TRUE,sep=";",stringsAsFactors = FALSE)

power[, 3:9] <- sapply(power[,3:9],as.numeric)
hist(power$Global_active_power,col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

png(file="Plot1.png",width = 480, height = 480, units = "px")

hist(power$Global_active_power,col="red",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()

