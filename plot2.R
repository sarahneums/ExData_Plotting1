#Plot 2
#Reads in data. Subsets data that we want to analyze. converts necessary Columns
housedata=read.csv("household_power_consumption.txt",sep=";") #Read in data
feb=housedata[housedata$Date=="1/2/2007" | housedata$Date=="2/2/2007",] #subset data for jan to fed

Feb=data.frame(feb)
Feb[,3]=as.numeric(as.character(Feb[,3]))

#Plots data as line and then sends in to png
png("plot2.png")
plot(Feb[,3],type="l",ylab="Global Active Power(kilowatts)",xlab="",xaxt='n')
axis(side=1,at=c(0,1450,2900),labels=c("Thu","Fri","Sat"))
dev.off()
