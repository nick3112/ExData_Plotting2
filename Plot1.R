##Assignment 2 - make some more plots - Plot1

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q1. increase in PM2.5 in the US from 1999 to 20089?
#base plotting for total PM2.5 emissions
q1<-aggregate(NEI$Emissions, by=list(Category=NEI$year), FUN=sum)
names(q1)<-c("Year","PM2_5")
png(filename="Plot1.PNG",width=480, height=480)
barplot(q1$PM2_5,q1$Year,xlab="Year", names.arg=q1$Year,ylab="Total PM2.5 Emmissions in Tonnes", main="Total Tons PM2.5 Produced Each Year in the US", col="blue")
dev.off()