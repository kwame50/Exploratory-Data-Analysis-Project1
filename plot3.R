## First check whether it has the file in the current dir.
if (!"Load_data.R" %in% list.files()) {
  setwd("C:/Users/Daddy 2/Documents/Data Analysis")
} 
source("Load_data.R")

## Convert the sub_metering_X columns into numeric from character
d1$Sub_metering_1 <- as.numeric(d1$Sub_metering_1)
d1$Sub_metering_2 <- as.numeric(d1$Sub_metering_2)
d1$Sub_metering_3 <- as.numeric(d1$Sub_metering_3)

## To create a png start the png function -> then plot -> then dev.off
png(filename = "plot3.png", ## the target png
    width = 480,
    height = 480,
    units = "px") 

## produce multiple plots on same axes
plot(datetimes, d1$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering", 
     type = "l" ,
     col = "black")

lines(datetimes,d1$Sub_metering_2, ## metering 2
      col ="red")

lines(datetimes,d1$Sub_metering_3, ## metering 3
      col = "blue")

## Add a legend
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd = 1,
       col = c("black","red","blue") )


## finish to save the plot
dev.off()
