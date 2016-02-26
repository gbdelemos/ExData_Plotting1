rm(list=ls(all=T))
dados <-read.csv("household_power_consumption.txt", sep=";",na.strings="?")
dados$Date <- as.Date(dados$Date,"%d/%m/%Y")
sub.dados <- dados[dados$Date>="2007-02-01" & dados$Date<="2007-02-02",]


##Plot 2
##Preciso melhorar ainda este gráfico!
str(sub.dados)
wday <- as.factor(weekdays.Date(sub.dados$Date,abbreviate = T))
sub.dados$Time <- strptime(sub.dados$Time,"%H:%M:%S")
sub.dados <- sub.dados[with(sub.dados,order(Time)),]

png(file = "plot2.png", width = 480,height = 480)
plot(y = sub.dados$Global_active_power,x=sub.dados$Time,t="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
