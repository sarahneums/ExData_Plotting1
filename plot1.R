#Plot 1
#reads in the data an subsets

housedata=read.csv("household_power_consumption.txt",sep=";") #Read in data
feb=housedata[housedata$Date=="1/2/2007" | housedata$Date=="2/2/2007",] #subset data for jan to fed
Feb=data.frame(feb)

Feb3=as.numeric(Feb[,3])
feb3<-(Feb3/1000)*2


png("plot1.png")
hist(feb3,main=paste("GLobal Active Power"),xlab="Global Active Power (kilowatts)",col="red")
dev.off()
