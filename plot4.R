library(lubridate)

#reading data
file<-read.table("./household_power_consumption.txt",
                 header = TRUE,sep = ";",
                 col.names = c("Date","Time","Global_Active_Power",
                               "Global_Reactive_Power","Voltage",
                               "Global_Intensity","Sub_Metering_1",
                               "Sub_Metering_2","Sub_Metering_3"),
                 colClasses = c("character","character","numeric",
                                "numeric","numeric","numeric","numeric",
                                "numeric","numeric"),
                 na.strings = "?")

file$Date<-dmy(file$Date)

#Subsetting the Dates needed
file<-subset(file,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Plotting Graphs
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))

#plot at (1,1)
plot(file$Global_Active_Power,
     ylab = "Global Active Power", type = "l", xaxt="n",xlab = " ")
axis(side = 1, at = c(1, which(file$Date==as.Date("2007-02-02"))[1], nrow(file)), 
     labels = c("Thu","Fri","Sat"))

#plot at (1,2)
plot(file$Voltage,
     ylab = "Voltage", type = "l", xaxt="n",xlab = "datetime")
axis(side = 1, at = c(1, which(file$Date==as.Date("2007-02-02"))[1], nrow(file)), 
     labels = c("Thu","Fri","Sat"))

#plot at (2,1)
plot(file$Sub_Metering_1,col="black",type = "l", xaxt="n",xlab = " ", 
     ylab = "Energy sub metering")
lines(file$Sub_Metering_2,col="red")
lines(file$Sub_Metering_3,col="blue")
axis(side = 1, at = c(1, which(file$Date==as.Date("2007-02-02"))[1], nrow(file)), 
     labels = c("Thu","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, lwd = 1, col = c("black","red","blue"),cex = 0.6, bty = "n")

#plot at (2,2)
plot(file$Global_Reactive_Power,
     ylab = "Global_reactive_power", type = "l", xaxt="n",xlab = "datetime")
axis(side = 1, at = c(1, which(file$Date==as.Date("2007-02-02"))[1], nrow(file)), 
     labels = c("Thu","Fri","Sat"))

dev.off()