## Obtaining data and preparing dataset

##step 1 - check if "PeerGradedproject2data" folder exists, if not create "PeerGradedproject2data" folder
setwd("C:/Users/User/Desktop/Coursera")
if(!file.exists("./PeerGradedproject2data")){dir.create("./PeerGradedproject2data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./PeerGradedproject2data/Dataset.zip")

##step 2 - Unzip the file ( unziped file is "household_power_consumption") and store as "projectdatafiles" object in R
unzip(zipfile="./PeerGradedproject2data/Dataset.zip",exdir="./PeerGradedproject2data")
projectfilespath <- file.path("./PeerGradedproject2data", "household_power_consumption.txt")
projectdatafile <- list.files(projectfilespath, recursive=TRUE)

##step 3 - View "projectfile"
projectdatafile

##step 4 - Read above data from "projectfile" into data frame ("household_power_consumption") selecting only required rows
household_power_consumption  <- read.table(file.path(projectfilespath),header = FALSE, sep = ";", quote = "", skip = 66637,
                                           nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                                                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Step 5 convert Columns "Date" to Date format using as.Date()
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
str(household_power_consumption)

## Step 6 create new column "DateTime" that captures dat/time stamp
household_power_consumption$DateTime <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTime <- strptime(household_power_consumption$DateTime, format = "%Y-%m-%d %H:%M:%S")
str(household_power_consumption)