datafile <- "data/household_power_consumption.txt"

data <- read.table(inputfilename ,header=TRUE , sep=";", na.strings = "?" )

filtered_data <- data[as.character(data$Date) %in% c('2/2/2007','1/2/2007'),]  
filtered_data$datetime <- strptime(paste(filtered_data$Date,filtered_data$Time) ,format="%d/%m/%Y %H:%M:%S")


png(filename="plot2.png" ,width=480 ,height=480 ,units="px" ,bg=NA)
plot(x=filtered_data$datetime ,y=filtered_data$Global_active_power ,type="l" ,xlab="" ,ylab="Global Active Power (kilowatts)" ,axes=TRUE)
dev.off()
