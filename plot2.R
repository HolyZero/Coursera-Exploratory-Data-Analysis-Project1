# Read data into table
data <- read.table("data.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses=c("character","character",rep("numeric",7)))
subdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(subdata)
# Convert time into R type
combine <- with(subdata,paste(Date,Time))
dt <- strptime(combine, "%d/%m/%Y %H:%M:%S")
# Plot histogram into png device machine.
png("plot2.png", width = 480, height = 480, units = "px")
plot(dt,subdata$Global_active_power, type="l", 
     ylab="Global Active Power (killowatts)")
dev.off()
