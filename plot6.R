download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "ED.zip") ## download file
unzip("ED.zip") ## unzip file
NEI <- readRDS("summarySCC_PM25.rds") ## read NEI file
SCC <- readRDS("Source_Classification_Code.rds") ## read SCC file
install.packages("ggplot2") ## install ggplot 2 package
library(ggplot2) ## load ggplot2 package

## Question 6 ##
NEI6 <- subset(NEI, type == "ON-ROAD", select = c(fips:year)) ## Question 6 - subset motor vehicle data
NEI6$fips <- as.numeric(NEI6$fips) ## convert fips column from character to numeric 
NEI6 <- subset(NEI6, fips == 24510 | fips == 06037, select = c(Emissions, fips, year)) ## Question 6 - subset city Emissions data by year for motor vehicle data for two cities ("fips")
NEI6$fips <- as.factor(NEI6$fips) ## convert fips column from numeric to factor
NEI6 <- aggregate(cbind(Emissions)~fips+year, data=NEI6, sum) ## aggregate total Emissions by type and year
png(file = "plot6.png", width = 480, height = 480) ## write to .png
qplot(year, Emissions, data=NEI6, facets = .~fips) ## Question 6 - plot total emissions of motor vehicles by factor (two cities)
dev.off() ## turn of graphics device