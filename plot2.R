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

#plotting graphs
png(filename = "plot2.png", height = 480, width = 480)
plot(file$Global_Active_Power,
     ylab = "Global Active Power (kilowatts)", type = "l", xaxt="n",xlab = " ")
axis(side = 1, at = c(1, which(file$Date==as.Date("2007-02-02"))[1], nrow(file)), 
     labels = c("Thu","Fri","Sat"))

dev.off()