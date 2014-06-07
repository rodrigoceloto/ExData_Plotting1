Sys.setenv(LANG = "en")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

library(data.table)
table<-fread("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c('?'))[(Date=="1/2/2007" | Date=="2/2/2007"),list(Date,Time,Global_active_power)]
table<-as.data.frame(table)

table$Datetime<-strptime(paste(table$Date, table$Time), format = "%d/%m/%Y %H:%M:%S")
table$Global_active_power<-as.numeric(table$Global_active_power)



## PLOT 1
par(mfrow = c(1, 1))
hist(table$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png",width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()