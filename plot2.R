# plot2.R
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
png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px")

# Create plot, with suppressed x-axis
plot(data$Global_active_power,
     type = "l",
     xaxt = "n", xlab="", # Suppress x-axis
     ylab = "Global Active Power (kilowatts)")

# x-axis:
axis(side = 1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))

# Close PNG graphics device
dev.off()