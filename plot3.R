# This script processes the electric power consumption dataset 
# from the UC Irvine Machine Learning Repository and produces 
# a plot of the submetering versus time

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
png("plot3.png")

# Make plot 3
plot(power$Time, power$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
lines(power$Time,power$Sub_metering_1, type="l",col='black')
lines(power$Time,power$Sub_metering_2, type="l",col='red')
lines(power$Time,power$Sub_metering_3, type="l",col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))

# Close the device
dev.off()


