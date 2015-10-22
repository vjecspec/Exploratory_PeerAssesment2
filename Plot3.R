#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)
library(ggplot2)
filtered_NEI <- filter(NEI,fips=="24510")    #First we need to get only the data for Baltimore City
grouped_NEI <- group_by(filtered_NEI,year,type) #Then we use group_by() 
total_emissions <- summarise(grouped_NEI,total=sum(Emissions)) #And summarise() to get the sum of emissions
png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot3.png')
qplot(data=total_emissions,x=year,y=log(total),group=type,color=type,geom=c("point","line"),xlab="YEAR",ylab="Total Emissions,PM2.5",main="Total Emissions in Baltimore City by Pollutant Type")
dev.off()
