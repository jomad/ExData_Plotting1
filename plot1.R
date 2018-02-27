# Read dataset from csv file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?',
                 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE,
                 comment.char = "", quote = '\"')
 
# Subset data based on required data needed
data_2days <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert date
data_2days$Date <- as.Date(data_2days$Date, format = "%d/%m/%Y")

par(mfrow = c(1,1))

hist(data_2days$Global_active_power, main = "Global Active Power", 
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
     col = "red")

# Save resulting plot into a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)

dev.off()