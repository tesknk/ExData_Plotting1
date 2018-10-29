# Data Science Specialization, from Johns Hopkins University, US
# Course: Exploratory Data Analysis
# Lecturers: Dr Roger D Peng, Dr Jeff Leek, Dr Brian Caffo
# Written by: tesknk
# Date: 28 October 2018

# Week 1, Course Project 1
# Script to create Plot 2

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

# Check variables' type
str(data_selected)

# Plot data
dev.cur()
dev.copy(png, file = "plot2.png", height = 480, width = 480) # Create a png plot
plot(data_selected$DateTime, data_selected$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
