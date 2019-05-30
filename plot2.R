data <- read.table("data.txt", header=TRUE, sep=";")

# convert dates
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- format(strptime(data$Time, format="%H:%M:%S"), "%H:%M:%S")

#Filter data by dates
filtered <- subset(data, select=c(Global_active_power, Date, Time), subset=((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))))


filtered$DateTime <- paste(filtered$Date, filtered$Time)
filtered$DateTimeConv <- strptime(filtered$DateTime, format="%Y-%m-%d %H:%M:%S")

#convert to numeric
numeric <- as.numeric(as.vector(filtered$Global_active_power))

plot(filtered$DateTimeConv, numeric, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")
dev.off()