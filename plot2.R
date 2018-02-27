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

with(data_2days, plot(Datetime, Global_active_power, type = "l",
                    ylab = "Global Active Power (kilowatts)",
                    xlab = ""))

dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()








