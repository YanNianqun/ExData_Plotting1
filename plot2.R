
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <-lubridate::dmy(data$Date) 
data$ntime <- lubridate::dmy_hms(paste(data$Date,data$Time))
data <- data[data$Date ==  "2007-02-01" | data$Date =="2007-02-02",]
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot2.png")
plot(x =data$ntime,
     y = data$Global_active_power,
     type = "l",
     axes = T,
     ylab = "Global Active Power(kilowatts)",
     xlab = ""
     )
dev.off()

