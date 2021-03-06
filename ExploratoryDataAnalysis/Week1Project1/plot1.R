setwd("C:/Users/HP/Desktop/R/R Programming/Week1")
data<-read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",comment.char = "")
data1<-subset(data,Date %in% c("1/2/2007","2/2/2007"))
data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")
hist(data1$Global_active_power,col="red",ylab = "Frequency",xlab = "Global Active Power(Kilowatts)",main="Global Active Power")
png("plot1.png",width =  480,height= 480)
