# read data table
fn = "household_power_consumption.txt"
d = read.table(fn, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# select required vector
period = d$Date == "1/2/2007" | d$Date == "2/2/2007"
x = as.numeric(d[period, "Global_active_power"]) 

# draw hitogram and save the picture to file
par(mfrow = c(1, 1), mar = c(4,4,3,1), oma = c(1,1,0,0), ps = 14) 
hist(x, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()