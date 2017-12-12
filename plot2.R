library(lubridate)
power <- read.table("C:/BAK/Data Analytics/Data Sets/household_power_consumption.txt", header = TRUE, 
                    sep = ";", stringsAsFactors = FALSE)
power$datetime <- paste(power$Date, power$Time)
power$datetime <- dmy_hms(power$datetime)
power <- power[(power$datetime >= ymd("2007-02-01") 
                & power$datetime < ymd("2007-02-03")),]
power[,3:9] <- sapply(power[,3:9], as.numeric)

png(file = "plot2.png", width = 480, height = 480, units = "px")
with(power, plot(datetime,Global_active_power,type="l",xlab=NA,
                 ylab = "Global active power (kilowatts)"))
dev.off()
