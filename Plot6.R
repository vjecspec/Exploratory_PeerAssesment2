#Reading data and setting the directory
setwd('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#We will use dyplyr package for the analysis
library(dplyr)
library(ggplot2)

SCC_motor <- SCC[grep("motor",SCC$Short.Name,ignore.case=TRUE),]

NEI_motor <- merge(x=NEI,y=SCC_motor,by='SCC') #As in previous assigment

filtered_NEI_motor_BALTIMORE <- filter(NEI_motor,fips=="24510")
filtered_NEI_motor_LA <- filter(NEI_motor,fips=="06037") #Filter data to get Baltimore and LA dataframes

grouped_NEI_motor_BALTIMORE <- group_by(filtered_NEI_motor_BALTIMORE,year)
grouped_NEI_motor_LA <- group_by(filtered_NEI_motor_LA,year)
total_emissions_BALTIMORE <- summarise(grouped_NEI_motor_BALTIMORE,total=sum(Emissions))
total_emissions_LA <- summarise(grouped_NEI_motor_LA,total=sum(Emissions))  #Calculate emissions by County

total_emissions_BALTIMORE$group <- rep("Baltimore County")
total_emissions_LA$group <- rep("Los Angeles County") #Add variable that will indicate city name (neccesary for plot)
total_emissions <- as.data.frame(rbind(total_emissions_LA,total_emissions_BALTIMORE)) #Rbind data frames

png('E:/FER_posao/Coursera_Iversity/Data Scientist Specialization/4 Exploratory data analysis/Peer assesment 2/plot6.png')
qplot(data=total_emissions,x=year,y=log(total),group=group,color=group,geom=c("point","line"),xlab="YEAR",ylab="PM2.5 Emission",main="PM2.5 emission from motor sources\n in Baltimore City and Los Angeles")
dev.off()
