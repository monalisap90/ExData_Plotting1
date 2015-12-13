a <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880,
                sep = ";")
h <- t(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
h <- as.vector(h[,1])
colnames(a) <- h
h <- paste(as.vector(a[,1]),as.vector(a[,2]),sep=" ")
x <- strptime(h, format = "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2,2))
plot(x, a$Global_active_power, type="l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
plot(x, a$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x, a$Sub_metering_1, type="l", xlab = "", 
     ylab = "Energy sub metering", col = "black")
lines(x, a$Sub_metering_2, col = "red")
lines(x, a$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(x, a$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()