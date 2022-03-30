library(dplyr)
library(ggplot2)
NEI<- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

totalemissionByYear <- NEI %>% subset(fips == "24510" & type == "ON-ROAD") %>% group_by(year) %>% summarize(totalemissions = sum(Emissions,na.rm=T))
totalemissionByYear$year <- as.factor(totalemissionByYear$year)

ggplot(totalemissionByYear, aes(x=year, y=totalemissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions from Vehicle Related Sources")



png("Plot5.png")
dev.off()