data <- read.csv("household_power_consumption.txt",sep=";",
		    na.strings="?")

data$Date.Time <- strptime(paste(data$Date, data$Time, sep = " "),
		                        format="%d/%m/%Y %H:%M:%S")

sdata <- data[data$Date.Time >= strptime("01-02-2007", format ="%d-%m-%Y")
	          & data$Date.Time < strptime("03-02-2007", format ="%d-%m-%Y"),]

## This makes the plot show english weekdays
## (my locale is Spanish)
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "transparent",  res = NA)

plot(sdata$Date.Time, sdata$Global_active_power, 
	type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
