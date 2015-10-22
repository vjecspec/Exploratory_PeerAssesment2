#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)
grouped_NEI <- group_by(NEI,year)  #Group the data by year
total_emissions <- summarise(grouped_NEI,total=sum(Emissions)) #And then sum the emissions by group
png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot1.png')
barplot(total_emissions$total,names=total_emissions$year,xlab="YEAR",ylab="PM2.5 emissions",main="Pm2.5 emissions by year")
dev.off()
