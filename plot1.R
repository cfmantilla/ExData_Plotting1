data <- read.csv("household_power_consumption.txt",sep=";",
		na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sdata<-data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "transparent",  res = NA)

hist(sdata$Global_active_power,col="red",
		xlab="Global Active Power (kilowatts)",
		ylab="Frequency",main="Global Active Power")

dev.off()

