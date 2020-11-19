data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <-lubridate::dmy(data$Date) 
data <- data[data$Date ==  "2007-02-01" | data$Date =="2007-02-02",]
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot1.png")
hist(x = data$Global_active_power, 
     freq = T,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     axes = F
      )
axis(1, at = seq(0,6, by = 2))
axis(2, at = seq(0,1200, by = 200))
dev.off()
