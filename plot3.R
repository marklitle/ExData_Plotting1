#20150112
#marklittle
#setwd("D:\\RÑ§Ï°±Ê¼Ç\\Exploratory Data Analysis\\week 1")
#fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL,destfile="./t1.zip",method="curl",extra="-k")

library(dplyr)
print("--------------")
d1<-read.table("household_power_consumption.txt",colClasses=c("character","character","character","character","character","character","character","character","character"),header=TRUE,sep=";")#


c1<-paste(d1$Date, d1$Time)

c2<-strptime(c1, "%d/%m/%Y %H:%M:%S")

d1<-cbind(d1,rDate=as.Date(c2),rTime=c2)

d2<-subset(d1,subset=(rDate =="2007-02-01" |rDate =="2007-02-02" ))


png("plot3.png",width=480,height=480)

with(d2,plot(rTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black"))
with(d2,lines(rTime,Sub_metering_2,type="l",col="red"))
with(d2,lines(rTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()


