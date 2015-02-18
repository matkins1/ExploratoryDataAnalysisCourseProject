download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "ED.zip") ## download file
unzip("ED.zip") ## unzip file
NEI <- readRDS("summarySCC_PM25.rds") ## read NEI file
SCC <- readRDS("Source_Classification_Code.rds") ## read SCC file

## Question 1 ##
NEI1 <- aggregate(x = NEI$Emissions, by = list(NEI$year), FUN = sum) ## Question 1 - aggregate PM2.5 emissions by year for plotting 
png(file = "plot1.png", width = 480, height = 480) ## write to .png
plot(NEI1, type="l", xlab="Year", ylab="Total Annual Emissions", main="Trend of Emissions") ## Question 1 - plot total emissions by year
dev.off() ## turn of graphics device