#Plot 3

#Read in the data, subset data into required data
housedata=read.csv("household_power_consumption.txt",sep=";") #Read in data
feb=housedata[housedata$Date=="1/2/2007" | housedata$Date=="2/2/2007",] #subset data for jan to fed
Feb=data.frame(feb)

Feb$Sub_metering_1<-as.numeric(as.character(Feb[,7]))
Feb$Sub_metering_2<-as.numeric(as.character(Feb[,8]))
Feb$Sub_metering_3<-as.numeric(as.character(Feb[,9]))
#Plot data
png("plot3.png")
plot(Feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt='n')
lines(Feb$Sub_metering_2,type="l",col="red") #add lines for the other submeterings
lines(Feb$Sub_metering_3,type="l",col="blue")
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
