## First check whether it has the file in the current dir.
if (!"Load_data.R" %in% list.files()) {
  setwd("C:/Users/Daddy 2/Documents/Data Analysis")
} 
source("Load_data.R")

## To create a png start the png function -> then plot -> then dev.off
png(filename = "plot2.png", ## the target png
    width = 480,
    height = 480,
    units = "px",
    bg = "transparent") 

## plot is a line plot of global active power Vs. weekdat
plot(datetimes, d1$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "l" )

## finish to save the plot
dev.off()
