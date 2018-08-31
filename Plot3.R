##Assignment 2 - make some more plots - Plot3

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q3. look at "type" {point, nonpoint, onroad, nonroad}, 
#decreases/increases in emmissions..baltimore city
qb<-NEI[NEI$fips=="24510",]
q3<-aggregate(qb$Emissions, by=list(Category=qb$year,qb$type), FUN=sum)
names(q3)=c("Year","type","PM2_5")
library(ggplot2)
png(filename="Plot3.PNG",width=480, height=480)
qplot(Year,PM2_5, data=q3, col=type, geom=c("point","line"),main=paste("Total Tons PM2.5 Produced Each Year","\n","(Baltimore City, Maryland)"), ylab="Total PM2.5 Emissions in Tonnes")
dev.off()