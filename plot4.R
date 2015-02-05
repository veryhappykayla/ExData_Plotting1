# plot4.R
# Course Project 1
# Coursera JHU "Exploratory Data Analysis" - February 2015
#----------------

# Download data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_filename <- "exdata-data-household_power_consumption.zip"
if(!file.exists(data_filename)){
    download.file(data_url, data_filename)
}

# Read data
data_all <- read.table(file = unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),
                       sep = ";",
                       na.strings = "?",
                       header = TRUE)

# Select only relevant dates
data <- data_all[which(data_all$Date == "1/2/2007" | data_all$Date == "2/2/2007"), ]

# Prepare PNG graphics device
png(filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px")

# Set up 2x2 plots:
par(mfrow = c(2,2)) #left then right >> top then bottom

#----------------

# Top left plot ("plot2")
plot(data$Global_active_power,
     type = "l",
     xaxt = "n", xlab = "", # Suppress x-axis
     ylab = "Global Active Power (kilowatts)")
axis(side = 1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))

#----------------

# Top right plot
plot (data$Voltage,
    type = "l",
    xaxt = "n", xlab = "datetime",
    ylab = "Voltage")
axis(side = 1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))

#----------------
# Bottom left plot ("plot3")

plot(data$Sub_metering_1, col="black",
     type = "l",
     xaxt = "n", xlab="", # Suppress x-axis
     ylab = "Energy sub metering")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
axis(side=1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#----------------

# Bottom right plot
plot (data$Global_reactive_power,
      type = "l",
      xaxt = "n", xlab = "datetime",
      ylab = "Global_reactive_power")
axis(side = 1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))

#----------------

# Close PNG graphics device
dev.off()