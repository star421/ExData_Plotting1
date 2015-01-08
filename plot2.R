# read data table
fn = "household_power_consumption.txt"
d = read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# select required vectors
period = d$Date == "1/2/2007" | d$Date == "2/2/2007"
d = d[period, 1:3]
d$x = strptime(paste(d$Date,d$Time), "%d/%m/%Y %H:%M:%S")
d$y = as.numeric(d[,3])

# draw and save the picture
par(mfrow = c(1, 1), mar = c(4,4,3,1), oma = c(0,0,0,0), ps = 14) 
plot(d$x,d$y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()