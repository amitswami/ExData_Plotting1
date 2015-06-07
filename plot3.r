datafile <- "data/household_power_consumption.txt"

data <- read.table(inputfilename ,header=TRUE , sep=";", na.strings = "?" )

filtered_data <- data[as.character(data$Date) %in% c('2/2/2007','1/2/2007'),]  
filtered_data$datetime <- strptime(paste(filtered_data$Date,filtered_data$Time) ,format="%d/%m/%Y %H:%M:%S")


png(filename="plot3.png" ,width=480 ,height=480 ,units="px" ,bg=NA)

# submeter1
plot(x=filtered_data$datetime ,y=filtered_data$Sub_metering_1 ,type="l" ,col="black" ,xlab="" ,ylab="Energy sub metering" )

# submeter2
lines(x=filtered_data$datetime
      ,y=filtered_data$Sub_metering_2
      ,type="l"
      ,col="red")

# submeter3
lines(x=filtered_data$datetime ,y=filtered_data$Sub_metering_3 ,type="l" ,col="blue")

legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3') ,lwd=1 ,col=c("black","red","blue"))
dev.off()
