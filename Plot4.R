#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)

SCC_coal <- SCC[grep("coal",SCC$Short.Name,ignore.case=TRUE),] #First subset only rows that have "coal" string in Short.Name

NEI_coal <- merge(x=NEI,y=SCC_coal,by='SCC')  #Then merge two datasets

grouped_NEI_coal <- group_by(NEI_coal,year)   #Group the data by year
total_emissions <- summarise(grouped_NEI_coal,total=sum(Emissions)) #Sum by emission
png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot4.png')
barplot(total_emissions$total,names=total_emissions$year,xlab="YEAR",ylab="PM2.5 emissions",main="Pm2.5 emissions from coal combustion-related sources in the United States")
dev.off()
