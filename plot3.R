download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "ED.zip") ## download file
unzip("ED.zip") ## unzip file
NEI <- readRDS("summarySCC_PM25.rds") ## read NEI file
SCC <- readRDS("Source_Classification_Code.rds") ## read SCC file
install.packages("ggplot2") ## install ggplot 2 package
library(ggplot2) ## load ggplot2 package

## Question 3 ##
NEI3 <- subset(NEI, fips == "24510", select = c(fips:year)) ## Question 3 - subset Baltimore City, MD data
NEI3$type <- as.factor(NEI3$type) ## convert type column from character to factor
NEI3 <- aggregate(cbind(Emissions)~type+year, data=NEI3, sum) ## aggregate total Emissions by type and year
png(file = "plot3.png", width = 480, height = 480) ## write to .png
qplot(year, Emissions, data=NEI3, facets = .~type) ## Question 3 - plot total emissions by factor
dev.off() ## turn of graphics device