## First check whether it has the file in the current dir.
if (!"Load_data.R" %in% list.files()) {
  setwd("C:/Users/Daddy 2/Documents/Data Analysis")
} 
source("Load_data.R")
## Convert the sub_metering_X columns into numeric from character
d1$Sub_metering_1 <- as.numeric(d1$Sub_metering_1)
d1$Sub_metering_2 <- as.numeric(d1$Sub_metering_2)
d1$Sub_metering_3 <- as.numeric(d1$Sub_metering_3)

## Convert the Voltage column into numeric from character
d1$Voltage <- as.numeric(d1$Voltage)

## Convert the Global reactive Power column into numeric from character
d1$Global_reactive_power <- as.numeric(d1$Global_reactive_power)

## To create a png start the png function -> then plot -> then dev.off
png(filename = "plot4.png", ## the target png
    width = 480,
    height = 480,
    units = "px") 

## produce 4 plots on a 2x2 grid
par(mfcol = c(2,2)) ## 2rows 2cols fill column-wise

plot(datetimes, d1$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power", 
     type = "l" )

{
  plot(datetimes, d1$Sub_metering_1, 
       xlab = "",
       ylab = "Energy sub metering", 
       type = "l" ,
       col = "black")
  
  lines(datetimes,d1$Sub_metering_2, ## metering 2
        col = "red")
  
  lines(datetimes,d1$Sub_metering_3, ## metering 3
        col = "blue")
  
  ## Add a legend
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lwd = 1,
         col = c("black","red","blue"),
         bty = "n") ## bty="n" removes the boundary
}

plot(datetimes, d1$Voltage , 
     xlab = "datetime",
     ylab = "Voltage", 
     type = "l" )

plot(datetimes, d1$Global_reactive_power , 
     xlab = "datetime",
     ylab = "Global_reactive_power", 
     type = "l" )

## finish to save the plot
dev.off()
