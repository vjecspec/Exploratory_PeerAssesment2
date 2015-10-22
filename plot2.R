#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)
filtered_NEI <- filter(NEI,fips=="24510") #Get only Baltimore County
grouped_filtered_NEI <- group_by(filtered_NEI,year) #Group data by year
total_emissions <- summarise(grouped_filtered_NEI,total=sum(Emissions)) #Sum the emission bygroup
png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot2.png')
barplot(total_emissions$total,names=total_emissions$year,xlab="YEAR",ylab="PM2.5 in kilotons",main="PM2.5 emissions in Baltimore City")
dev.off()