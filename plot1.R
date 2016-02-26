rm(list=ls(all=T))
dados <-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
dados$Date <- as.Date(dados$Date,"%d/%m/%Y")
sub.dados <- dados[dados$Date>="2007-02-01" & dados$Date<="2007-02-02",]

## Plot 1
png(file = "plot1.png", width = 480,height = 480)
hist(sub.dados$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
