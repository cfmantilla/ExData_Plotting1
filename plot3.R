data <- read.csv("household_power_consumption.txt",sep=";",
                 na.strings="?")

data$Date.Time <- strptime(paste(data$Date, data$Time, sep = " "),
                           format="%d/%m/%Y %H:%M:%S")

sdata <- data[data$Date.Time >= strptime("01-02-2007", format ="%d-%m-%Y")
              & data$Date.Time < strptime("03-02-2007", format ="%d-%m-%Y"),]

## This makes the plot show english weekday names
## (my locale is Spanish)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent",  res = NA)

plot(sdata$Date.Time, sdata$Sub_metering_1, type="n", 
     ylab="Energy sub metering", fg="black", xlab="")

lines(sdata$Date.Time, sdata$Sub_metering_1, fg="black")
lines(sdata$Date.Time, sdata$Sub_metering_2, col="red")
lines(sdata$Date.Time, sdata$Sub_metering_3, col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),
       col=c("black","red","blue"))

dev.off()
