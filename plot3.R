library(lubridate)
po <- read.table("C:/BAK/Data Analytics/Data Sets/household_po_consumption.txt", header = TRUE, 
                    sep = ";", stringsAsFactors = FALSE)
po$datetime <- paste(po$Date, po$Time)
po$datetime <- dmy_hms(po$datetime)
po <- po[(po$datetime >= ymd("2007-02-01") 
                & po$datetime < ymd("2007-02-03")),]
po[,3:9] <- sapply(po[,3:9], as.numeric)

png(file = "plot3.png", width = 480, height = 480, units = "px")

with(po, plot(datetime,Sub_metering_1,type="l",xlab=NA,
                 ylab = "Eneergy Sub Metering"))
with(po, lines(datetime,Sub_metering_2,type="l",xlab=NA,
                  ylab = "Eneergy Sub Metering",col="red"))
with(po, lines(datetime,Sub_metering_3,type="l",xlab=NA,
                  ylab = "Eneergy Sub Metering",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

dev.off()

