# plot1.R
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
png(filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px")

# Create histogram
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Close PNG graphics device
dev.off()