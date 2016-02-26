rm(list=ls(all=T))
dados <-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
dados$Date <- as.Date(dados$Date,"%d/%m/%Y")
sub.dados <- dados[dados$Date>="2007-02-01" & dados$Date<="2007-02-02",]

##Plot 4
png(file = "plot3.png", width = 480,height = 480)
par(mfrow=c(2,2))
plot(y = sub.dados$Global_active_power,x=sub.dados$Time,t="l",
     ylab="Global Active Power (kilowatts)",xlab="")

plot(y = sub.dados$Voltage,x=sub.dados$Time,t="l",
     ylab="Voltage",xlab="datetime")

plot(x=sub.dados$Time,y = sub.dados$Sub_metering_1,t="l",
     ylab="Energy sub metering",xlab="")
lines(x=sub.dados$Time,y=sub.dados$Sub_metering_2,col="red")
lines(x=sub.dados$Time,y=sub.dados$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(y = sub.dados$Global_reactive_power,x=sub.dados$Time,t="l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()
