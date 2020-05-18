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

#Subsetting the dates needed
file<-subset(file,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#Plotting Graphs
png(filename = "plot1.png", width = 480, height = 480)

hist(file$Global_Active_Power,col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()