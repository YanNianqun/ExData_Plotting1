data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <-lubridate::dmy(data$Date) 
data$ntime <- lubridate::dmy_hms(paste(data$Date,data$Time))
data <- data[data$Date ==  "2007-02-01" | data$Date =="2007-02-02",]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png(filename = "plot3.png")
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

legend("topright", "(x,y)", legend = c("Sub_metering_1",
                                              "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red","blue"),
       lty = 1)

dev.off()
