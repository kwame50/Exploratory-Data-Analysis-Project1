## This file is for loading the large dataset.
## read the data
setwd("C:/Users/Daddy 2/Documents/Data Analysis")
data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   quote="",
                   colClass="character")

## Convert the values in the date column to [R] dates.
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

## Only interested in 2007-02-01 and 2007-02-02
d1 <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"), ]

## grab the times (will want to plot against week days)
datetimes <- strptime(paste(d1$Date,d1$Time),format = "%Y-%m-%d %H:%M:%S")

## Convert the Global Acive Power column into numeric from character
d1$Global_active_power <- as.numeric(d1$Global_active_power)
