##Assignment 2 - make some more plots - Plot2

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q2. have total emissions decreased in Baltimore City, Maryland (fips=24510)
qb<-NEI[NEI$fips=="24510",]
q2<-aggregate(qb$Emissions, by=list(Category=qb$year), FUN=sum)
names(q2)<-c("Year","PM2_5")
png(filename="Plot2.PNG",width=480, height=480)
barplot(q2$PM2_5,q2$Year,names.arg=q2$Year,xlab="Year", ylab="Total PM2.5 Emmissions in Tonnes", main=paste("Total Tons PM2.5 Produced Each Year","\n","(Baltimore City, Maryland)"), , col="blue")
dev.off()