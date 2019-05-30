data <- read.table("data.txt", header=TRUE, sep=";")

#Filter data by dates
filtered <- subset(table, select=Global_active_power, subset=((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))))

numeric <- as.numeric(as.vector(filtered$Global_active_power))
hist(numeric, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file="plot1.png")

dev.off()
