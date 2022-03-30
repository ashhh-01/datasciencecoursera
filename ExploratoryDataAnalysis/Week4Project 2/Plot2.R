library(dplyr)
NEI<- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

totalEmissionInBaltimore<-NEI %>% subset(NEI$fips == "24510") %>% group_by(year)%>%summarise(totalEmission=sum(Emissions,na.rm=T))
with(totalEmissionInBaltimore,barplot(totalEmission,names.arg=year,xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from Baltimore City Sources"))
png("Plot2.png")
dev.off()