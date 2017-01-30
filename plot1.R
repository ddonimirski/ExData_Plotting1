library(dplyr)

data_file <- "./household_power_consumption.txt"
data_file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_file_zip = "./exdata_data_household_power_consumption.zip"

if(!file.exists(data_file))
{
    download.file(data_file_url, destfile=data_file_zip)
    unzip(data_file_zip)
}

data <- read.csv(data_file, sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

filtered_data <- filter(data, Date %in% c("1/2/2007","2/2/2007")) 

png("plot1.png")

hist(filtered_data$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))

dev.off()
