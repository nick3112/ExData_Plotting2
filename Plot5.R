##Assignment 2 - make some more plots - Plot5

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q5.How have emissions from motor vehicle sources changed?
#1999-2008, Baltimore City
NEIfull<-merge(x=NEI, y=SCC, by.x=c("SCC"),by.y=c("SCC")) 
NEIcars<-NEIfull[grepl("VEHICLES", toupper(NEIfull$EI.Sector)),]
q5<-aggregate(NEIcars$Emissions[NEIcars$fips=="24510"], by=list(Category=NEIcars$year[NEIcars$fips=="24510"]), FUN=sum)
names(q5)<-c("Year","PM2_5")
png(filename="Plot5.PNG",width=480, height=480)
barplot(q5$PM2_5,q5$Year,names.arg=q4$Year,xlab="Year", ylab="Total PM2.5 Emmissions in Tonnes", main=paste("Total Tons PM2.5 Produced Each Year","\n","(Vehicle-Related Sources in Baltimore)"), , col="yellow")
dev.off()