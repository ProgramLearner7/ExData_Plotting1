library(dplyr)
library(readr)
library(lubridate)
household_power_consumption = read_delim("household_power_consumption.txt", 
                                         ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                      Time = col_time(format = "%H:%M:%S")), 
                                         trim_ws = TRUE)


#select the data from the dates 2007-02-01 and 2007-02-02
filteredDate = filter(household_power_consumption, Date >= "2007-02-01", Date <= "2007-02-02")


#plot1.R
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
with(filteredDate, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()