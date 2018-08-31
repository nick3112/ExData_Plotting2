##Assignment 2 - make some more plots - Plot6
#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q6.motor vehicle sources (Baltimore City vs LA County, California)
#(fips=="06037"). greatest changes over time?
library(ggplot2)
NEIfull<-merge(x=NEI, y=SCC, by.x=c("SCC"),by.y=c("SCC")) 
NEIcars<-NEIfull[grepl("VEHICLES", toupper(NEIfull$EI.Sector)),]
county<-c("24510","06037")
q6<-aggregate(NEIcars$Emissions[NEIcars$fips %in% county], by=list(Category=NEIcars$year[NEIcars$fips %in% county],NEIcars$fips[NEIcars$fips %in% county]), FUN=sum)
names(q6)=c("Year","fips","PM2_5")
q6$County <- ifelse(q6$fips=="06037", "LA, California", ifelse(q6$fips=="24510","Baltimore","Other"))
png(filename="Plot6.PNG",width=480, height=480)
qplot(Year,PM2_5, data=q6, col=County, geom=c("point","line"),main=paste("Total Tons PM2.5 Produced by Vehicles Each Year","\n","(Baltimore vs LA, California)"), ylab="Total PM2.5 Emissions in Tonnes")
dev.off()
