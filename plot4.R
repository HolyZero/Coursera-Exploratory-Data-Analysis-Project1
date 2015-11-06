# Read data into table
data <- read.table("data.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
subdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(subdata)
# Convert time into R type
combine <- with(subdata,paste(Date,Time))
dt <- strptime(combine, "%d/%m/%Y %H:%M:%S")
# Plot histogram into png device machine.
png("plot4.png", width = 480, height = 480, units = "px")

# Separate the graph
par(mfrow=c(2,2))
attach(subdata)
plot(dt,subdata$Global_active_power, type="l", 
     ylab="Global Active Power")
plot(dt,subdata$Voltage, type="l", ylab="Voltage",
     xlab="datetime")
plot(dt, Sub_metering_1, type="l", ylab="Energy sub metering")
lines(dt, Sub_metering_2, col="red")
lines(dt, Sub_metering_3, col="blue")
legend("topright",lwd=1,col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
plot(dt, Global_reactive_power, type="l", xlab="datatime")
dev.off()
