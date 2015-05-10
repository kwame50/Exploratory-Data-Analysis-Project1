## First check whether it has the file in the current dir.
if (!"Load_data.R" %in% list.files()) {
  setwd("C:/Users/Daddy 2/Documents/My Documents/Data Analysis")
} 
source("Load_data.R")
## To create a png start the png function -> then plot -> then dev.off
png(filename = "plot1.png", ## the target png
    width = 480,
    height = 480,
    units = "px") 

## plot is a red histogram of global active power
hist(d1$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     breaks = 12,
     ylim = c(0, 1200))

## finish to save the plot
dev.off()
