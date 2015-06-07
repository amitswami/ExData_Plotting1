
datafile <- "household_power_consumption.txt"
data <- read.table(datafile ,header=TRUE, sep=";" , na.strings = "?")
filtered_data <- data[as.character(data$Date) %in% c('2/2/2007','1/2/2007'),]

# sanitize
filtered_data$DateTime <- strptime(paste(filtered_data$Date,filtered_data$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="plot1.png" ,width=480,height=480 ,units="px" ,bg=NA)
hist(x=filtered_data$Global_active_power ,col="red" ,main="Global Active Power" ,xlab="Global Active Power (kilowatts)")
# close devise
dev.off()

# do source("plot1.r") to run 
