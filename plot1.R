# This script processes the electric power consumption dataset 
# from the UC Irvine Machine Learning Repository and produces 
# a histogram of the Global Active Power

# Load the required rows into a dataframe, only the last 2 days are considered
power <- read.table("household_power_consumption.txt", sep=';', nrows = 24*60*2, skip = 66637)
# Load the first row of the data file. We will use this to name the columns
names <- read.table("household_power_consumption.txt", sep=';', nrows = 1)

# Set column names
names(power) <- as.character(unlist(names))
# Convert the Date and Time columns to a Date and DateTime object, respectively.
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(paste(as.Date(power$Date,"%d/%m/%Y"),power$Time),"%Y-%m-%d %H:%M:%S")

# Open plotting device
png("plot1.png")

# Make plot 1
hist(power$Global_active_power,col='red', main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Close the device
dev.off()

