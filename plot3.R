# Read dataset from csv file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?',
                 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE,
                 comment.char = "", quote = '\"')
 
# Subset data based on required data needed
data_2days <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Change date format
data_2days$Date <- as.Date(data_2days$Date, format = "%d/%m/%Y")

date_time <- paste(as.Date(data_2days$Date), data_2days$Time)

# Create Datetime column
data_2days$Datetime <- as.POSIXct(date_time)

par(mfrow = c(1,1))

with(data_2days, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering",
                      xlab = "",col = "black") )
with(data_2days, lines(Datetime, Sub_metering_2, col = "red"))
with(data_2days, lines(Datetime, Sub_metering_3, col = "blue"))

legend("topright", lty=1, lwd =3, 
       col=c("black","red","blue") ,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()