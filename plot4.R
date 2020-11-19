Sys.setlocale(locale = "English")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <-lubridate::dmy(data$Date) 
data$ntime <- lubridate::dmy_hms(paste(data$Date,data$Time))
data$Voltage <- as.numeric(data$Voltage)
data <- data[data$Date ==  "2007-02-01" | data$Date =="2007-02-02",]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(filename = "plot4.png")
par(mfrow =c(2,2))

# 1.
plot(x =data$ntime,
     y = data$Global_active_power,
     type = "l",
     axes = T,
     ylab = "Global Active Power(kilowatts)",
     xlab = ""
)


#2. 
plot(x =data$ntime,
     y = data$Voltage,
     type = "l",
     axes = T,
     ylab = "Voltage",
     xlab = "datetime"
)


#3.

plot(x =data$ntime,
     y = data$Sub_metering_1,
     type = "l",
     axes = T,
     ylab = "Energey Sub Metering",
     xlab = "",
     lwd= 0.2,
)

lines(x =data$ntime,
      y = data$Sub_metering_2, 
      col= "red"
)

lines(x =data$ntime,
      y = data$Sub_metering_3, 
      col= "blue"
)

text =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

legend("topright", legend = c("Sub_metering_1",
                                       "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red","blue"),
       lty = 1, 
       cex = 1.0,
       bty = "n" ,
       )



#4. 
plot(x =data$ntime,
     y = data$Global_reactive_power,
     type = "l",
     axes = T,
     ylab = "Global_Ractive_Power",
     xlab = "datetime"
     
)


dev.off()
