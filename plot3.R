Sys.setenv(LANG = "en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

library(data.table)
table<-fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))[(Date=="1/2/2007" | Date=="2/2/2007"),list(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3)]
table<-as.data.frame(table)

table$Datetime<-strptime(paste(table$Date, table$Time), format = "%d/%m/%Y %H:%M:%S")
table$Sub_metering_1<-as.numeric(table$Sub_metering_1)
table$Sub_metering_2<-as.numeric(table$Sub_metering_2)
table$Sub_metering_3<-as.numeric(table$Sub_metering_3)


## PLOT 3
par(mfrow = c(1, 1))
plot(table$Datetime,table$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(table$Datetime,table$Sub_metering_2,col="red")
lines(table$Datetime,table$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png",res=50,width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()