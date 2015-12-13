a <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880,
                sep = ";")
h <- t(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
h <- as.vector(h[,1])
colnames(a) <- h
h <- paste(as.vector(a[,1]),as.vector(a[,2]),sep=" ")
x <- strptime(h, format = "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(x,a$Global_active_power,type="l",xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()