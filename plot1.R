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

#Plot 1

png(filename = "plot1.png",width = 480, height = 480)
hist (report.data$global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()