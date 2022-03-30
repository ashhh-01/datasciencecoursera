library(dplyr)
library(ggplot2)
NEI<- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

coal <- SCC %>% filter(grepl("coal", EI.Sector, ignore.case=TRUE)) %>% select(SCC)
totalemissionByYear <- NEI %>% subset(SCC %in% coal$SCC) %>% group_by(year) %>% summarize(totalemissions = sum(Emissions,na.rm=T))
totalemissionByYear$year <- as.factor(totalemissionByYear$year)

ggplot(totalemissionByYear, aes(x=year, y=totalemissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("US PM2.5 Emissions from Coal Related Sources")
png("Plot4.png")
dev.off()