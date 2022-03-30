library(dplyr)
library(ggplot2)
NEI<- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

totalEmissionInBaltimore<-NEI %>% subset(NEI$fips == "24510") %>% group_by(year,type)%>%summarise(totalEmission=sum(Emissions,na.rm=T))
totalEmissionInBaltimore$year<-as.factor(totalEmissionInBaltimore$year)
ggplot(totalEmissionInBaltimore,aes(x=year,y=totalEmission))+geom_bar(stat = "identity")+facet_grid(.~type)+labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("Baltimore City PM2.5 Emissions by Type")


png("Plot3.png")
dev.off(0)