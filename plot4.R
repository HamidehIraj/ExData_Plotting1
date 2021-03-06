# Loading Data

if(!(exists("data"))){
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")}

names(data) <- tolower(names(data))

#creating a backup
backup <- data

#preparing report data
if(!(exists("report.data"))){
report.data <- data[data$date %in% c("2/2/2007", "1/2/2007"), ]}

report.data$fulldate <- strptime(paste(report.data$date,report.data$time), "%d/%m/%Y %H:%M:%S")

# Plot 4
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))

#Plot1
plot (report.data$global_active_power ~ as.POSIXct( report.data$fulldate), type="l",
      xlab="",ylab="Global Active Power")

#Plot2
plot (report.data$voltage ~ as.POSIXct( report.data$fulldate), type="l",
      xlab="datetime",ylab="Voltage")

#Plot 3
plot(sub_metering_1 ~ as.POSIXct( fulldate),data=report.data, xlab="",ylab = "Energy Sub Metering", 
     type = "l")

lines(sub_metering_2 ~ as.POSIXct(fulldate),data= report.data,col = "red")

lines(sub_metering_3 ~ as.POSIXct(fulldate),report.data, col = "blue")

legend("topright", col = c("black", "red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3")
       
       ,pch=19,text.font=3,cex=1)

# Plot 4
plot (report.data$global_reactive_power ~ as.POSIXct( report.data$fulldate), type="l",
      xlab="datetime",ylab="global_reactive_power")

dev.off()