a <- read.table("household_power_consumption.txt", skip = 66637, nrows = 2880,
                sep = ";")
h <- t(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
h <- as.vector(h[,1])
colnames(a) <- h
png("plot1.png")
hist(a$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()