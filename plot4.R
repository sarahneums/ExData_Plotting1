#Plot 4
housedata=read.csv("household_power_consumption.txt",sep=";") #Read in data
feb=housedata[housedata$Date=="1/2/2007" | housedata$Date=="2/2/2007",] #subset data for jan to fed
Feb=data.frame(feb)


#efficient way to set all the data in specified columns to proper format
for (i in 4:9){
  Feb[,i]=as.numeric(as.character(Feb[,i]))
}

#sets the labels for the 4th plot
ymarks<-seq(.1,.5,.1)

png("plot4.png")
par(mfrow=c(2,2)) #adds all four plots to the same picture

#Plot 1
plot(Feb[,3],type="l",ylab="Global Active Power(kilowatts)",xlab="",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))

#Plot 2:voltage plot
plot(Feb[,5],type="l",ylab="Voltage",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))

#Plot 3
plot(Feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt='n')
lines(Feb$Sub_metering_2,type="l",col="red")
lines(Feb$Sub_metering_3,type="l",col="blue")
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#Plot 4: global reactive power plot
plot(Feb[,4],type="l",ylab="Global_reactive_power",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
axis(2,at=ymarks,labels=ymarks)

dev.off()
