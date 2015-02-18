download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "ED.zip") ## download file
unzip("ED.zip") ## unzip file
NEI <- readRDS("summarySCC_PM25.rds") ## read NEI file
SCC <- readRDS("Source_Classification_Code.rds") ## read SCC file

## Question 2 ##
NEI2 <- subset(NEI, fips == "24510", select = c(Emissions, year)) ## Question 2 - subset Baltimore City, MD Emissions data by year
NEI2 <- aggregate(x = NEI2$Emissions, by = list(NEI2$year), FUN = sum) ## Question 2 - aggregate PM2.5 emissions by year in Baltimore City, MD for plotting 
png(file = "plot2.png", width = 480, height = 480) ## write to .png
plot(NEI2, type="l", xlab="Year", ylab="Total Annual Emissions", main="Trend of Emissions in Baltimore City, MD") ## Question 2 - plot total emissions by year
dev.off() ## turn of graphics device