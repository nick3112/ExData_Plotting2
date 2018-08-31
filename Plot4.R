##Assignment 2 - make some more plots - Plot4

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment2")

#unzip the file
zipF<- "C:\\Nick\\07 R\\6JohnHopkins\\4 Exploratory Data Analysis\\Assignment2\\exdata%2Fdata%2FNEI_data.zip"
unzip(zipF)

#import the data
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

#Q4.across US changes in Coal combustion sources in 1998-2008? 
#add lookup and filter on Coal combustion
NEIfull<-merge(x=NEI, y=SCC, by.x=c("SCC"),by.y=c("SCC")) 
NEIcoal<-NEIfull[grepl("COAL", toupper(NEIfull$EI.Sector)),]
q4<-aggregate(NEIcoal$Emissions, by=list(Category=NEIcoal$year), FUN=sum)
names(q4)<-c("Year","PM2_5")
png(filename="Plot4.PNG",width=480, height=480)
barplot(q4$PM2_5,q4$Year,names.arg=q4$Year,xlab="Year", ylab="Total PM2.5 Emmissions in Tonnes", main=paste("Total Tons PM2.5 Produced Each Year","\n","(Coal Combustion-Related Sources)"), , col="green")
dev.off()