data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?',
                 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE,
                 comment.char = "", quote = '\"')

data_2days <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data_2days$Date <- as.Date(data_2days$Date, format = "%d/%m/%Y")

date_time <- paste(as.Date(data_2days$Date), data_2days$Time)

data_2days$Datetime <- as.POSIXct(date_time)

par(mfrow = c(2,2), cex = 0.8)

# plot 1
with(data_2days, plot(Datetime, Global_active_power, type = "l",
                      ylab = "", xlab = ""))
title(ylab = "Global Active Power", line=2.75)

# plot 2
with(data_2days, plot(Datetime, Voltage, type = "l", ylab = ""))
title(ylab="Voltage", line=2.75)

# plot 3
with(data_2days, plot(Datetime, Sub_metering_1, type = "l", ylab = "",
                      xlab = "",col = "black") )
with(data_2days, lines(Datetime, Sub_metering_2, col = "red"))
with(data_2days, lines(Datetime, Sub_metering_3, col = "blue"))
title(ylab="Energy Sub Metering", line=2.75)

legend("topright", lty=1, lwd =1, 
       col=c("black","red","blue") ,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n")
 

# plot 4
with(data_2days, plot(Datetime, Global_reactive_power, type = "l", 
                      ylab = ""))
title(ylab = "Global_reactive_power", line=2.75)

# Save resulting plot into a PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

dev.off()
