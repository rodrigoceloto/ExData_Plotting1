## Set regional formats
Sys.setenv(LANG = "en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

## Import data using data.table 
library(data.table)
table<-fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))[(Date=="1/2/2007" | Date=="2/2/2007"),list(Date,Time,Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3)]

## Transform dataset to data.frame and set numerical collumns
table<-as.data.frame(table)
table$Datetime<-strptime(paste(table$Date, table$Time), format = "%d/%m/%Y %H:%M:%S")
table$Global_active_power<-as.numeric(table$Global_active_power)
table$Global_reactive_power<-as.numeric(table$Global_reactive_power)
table$Voltage<-as.numeric(table$Voltage)
table$Sub_metering_1<-as.numeric(table$Sub_metering_1)
table$Sub_metering_2<-as.numeric(table$Sub_metering_2)
table$Sub_metering_3<-as.numeric(table$Sub_metering_3)


## PLOT 4
par(mfrow = c(2, 2))
  ## Plot 4.1
  plot(table$Datetime,table$Global_active_power,col="black",type="l",xlab="",ylab="Global Active Power")
  ## Plot 4.2
  plot(table$Datetime,table$Voltage,col="black",type="l",xlab="datetime",ylab="Voltage")
  ## Plot 4.3
  plot(table$Datetime,table$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
  lines(table$Datetime,table$Sub_metering_2,col="red")
  lines(table$Datetime,table$Sub_metering_3,col="blue")
  legend("topright", lty=1, bty="n",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  ## Plot 4.4
  plot(table$Datetime,table$Global_reactive_power,col="black",type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.copy(png, file = "plot4.png",res=50,width = 480, height = 480) ## Copy my plot to a PNG file
  dev.off()