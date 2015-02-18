download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "ED.zip") ## download file
unzip("ED.zip") ## unzip file
NEI <- readRDS("summarySCC_PM25.rds") ## read NEI file
SCC <- readRDS("Source_Classification_Code.rds") ## read SCC file

## Question 5 ##
NEI5 <- subset(NEI, type == "ON-ROAD", select = c(fips:year)) ## Question 5 - subset motor vehicle data
NEI5 <- subset(NEI5, fips == "24510", select = c(Emissions, year)) ## Question 5 - subset Baltimore City, MD Emissions data by year for motor vehicle data
NEI5 <- aggregate(x = NEI5$Emissions, by = list(NEI5$year), FUN = sum) ## Question 5 - aggregate PM2.5 emissions by year for m. vehicles in Baltimore City, MD for plotting 
png(file = "plot5.png", width = 480, height = 480) ## write to .png
plot(NEI5, type="l", xlab="Year", ylab="Total Annual Emissions", main="Trend of Motor Vehicle Emissions in Baltimore City, MD") ## Question 5 - plot total emissions by year
dev.off() ## turn of graphics device