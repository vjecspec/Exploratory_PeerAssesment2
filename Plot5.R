#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)
SCC_motor <- SCC[grep("motor",SCC$Short.Name,ignore.case=TRUE),] #As in previous, filter by motor

NEI_motor <- merge(x=NEI,y=SCC_motor,by='SCC')   #Merge data

filtered_NEI_motor <- filter(NEI_motor,fips=="24510")  #Get only Baltimore City
grouped_NEI_motor <- group_by(filtered_NEI_motor,year) #Group by year
total_emissions <- summarise(grouped_NEI_motor,total=sum(Emissions)) #Sum by emission
png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot5.png')
barplot(total_emissions$total,names=total_emissions$year,xlab="YEAR",ylab="PM2.5 emissions",main="Pm2.5 emissions from motor sources in the Baltimore City")
dev.off()