# Data Science Specialization, from Johns Hopkins University, US
# Course: Exploratory Data Analysis
# Lecturers: Dr Roger D Peng, Dr Jeff Leek, Dr Brian Caffo
# Written by: tesknk
# Date: 28 October 2018

# Week 1, Course Project 1
# Script to create Plot 4

# Read data
my_data <- read.delim("C:\\Users\\Tania\\Desktop\\2018 Data Science _ R _ Johns Hopkins University\\2018 Exploratory Data Analysis\\Week 1\\household_power_consumption.txt", header = TRUE, sep = ";")

# Select data
selected <- c("1/2/2007","2/2/2007") 
data_selected <- my_data[my_data$Date %in% selected,] # Subset from factor-type variable

# Convert data to date, time and num formats
data_selected$Time <-format(strptime(data_selected$Time, "%H:%M:%S"),"%H:%M:%S") # Convert to time
data_selected$Date <- as.Date(as.character(data_selected$Date), "%d/%m/%Y") # Convert to date
data_selected$DateTime <- with(data_selected, as.POSIXct(paste(Date, Time),tz="UCT")) # Combine date and time

data_selected$Global_active_power <- as.numeric(as.character(data_selected$Global_active_power)) # Convert to num

data_selected$Voltage <- as.numeric(as.character(data_selected$Voltage))

data_selected$Sub_metering_1 <- as.numeric(as.character(data_selected$Sub_metering_1))
data_selected$Sub_metering_2 <- as.numeric(as.character(data_selected$Sub_metering_2))
data_selected$Sub_metering_3 <- as.numeric(as.character(data_selected$Sub_metering_3))

data_selected$Global_reactive_power <- as.numeric(as.character(data_selected$Global_reactive_power))

# Check variables' type
str(data_selected)

# Plot data
dev.cur()
dev.copy(png, file = "plot4.png", height = 480, width = 480) # Create a png plot

par(mfrow=c(2,2)) # Define number of rows and columns

# 1st plot
plot(data_selected$DateTime, data_selected$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# 2nd plot
plot(data_selected$DateTime, data_selected$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# 3rd plot
plot(data_selected$DateTime, data_selected$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_selected$DateTime, data_selected$Sub_metering_2, col = "red")
lines(data_selected$DateTime, data_selected$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1:1, bty = "n")
# 4th plot
plot(data_selected$DateTime, data_selected$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactiver_power")

dev.off()

