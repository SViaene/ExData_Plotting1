# This script processes the electric power consumption dataset 
# from the UC Irvine Machine Learning Repository and produces 
# a composite plot of global active power, voltage, and submetering

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
png("plot4.png")

# Make plot 4
# Set frames
par(mfrow = c(2,2))

# subplot 1
plot(power$Time, power$Global_active_power, type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(power$Time,power$Global_active_power, type="l")

# subplot 2
plot(power$Time, power$Voltage, type="n",ylab="Voltage",xlab="Datetime")
lines(power$Time,power$Voltage, type="l")

# subplot 3
plot(power$Time, power$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
lines(power$Time,power$Sub_metering_1, type="l",col='black')
lines(power$Time,power$Sub_metering_2, type="l",col='red')
lines(power$Time,power$Sub_metering_3, type="l",col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col=c("black","red","blue"), bty = "n")

# subplot 4
plot(power$Time, power$Global_reactive_power, type="n",ylab="Global_reactive_power",xlab="Datetime")
lines(power$Time,power$Global_reactive_power, type="l")

# Close the device
dev.off()


