library(dplyr)
NEI<- readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

totalemissionByYear<-NEI %>% group_by(year)%>% summarize(totalEmissions=sum(Emissions,na.rm=T))
with(totalemissionByYear,barplot(totalEmissions,names.arg=year,xlab="Year",ylab="PM2.5 Emissions(tons)",main="TOtal EMissions from all sources"))
png("Plot1.png")
dev.off()

