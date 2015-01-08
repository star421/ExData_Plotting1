# read data table
fn = "household_power_consumption.txt"
d = read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# select required vectors
period = d$Date == "1/2/2007" | d$Date == "2/2/2007"
d = d[period, ]
d$x = strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")

# draw and save the picture
par(mfrow = c(1, 1), mar = c(4,4,3,1), oma = c(0,0,0,0), ps = 12) 
plot (d$x, d[,7], type="l", pch=".", xlab="", ylab="Energy sub metering")
lines(d$x, d[,8], col="red")
lines(d$x, d[,9], col="blue")
legend("topright", lty=1, 
  col    = c("black",         "blue",           "red"),
  legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()