# Read data into table
data <- read.table("data.txt", sep=";", header=TRUE, na.strings="?",
                  colClasses=c("character","character",rep("numeric",7)))
subdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
head(subdata)
# Plot histogram into png device machine.
png("plot1.png", width = 480, height = 480, units = "px")
hist(subdata$Global_active_power,col="red", 
     main="Global Active Power",xlab="Global Active Power (killowatts)",
     breaks=12, ylim=c(0,1200))
dev.off()