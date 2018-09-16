library(dplyr)
library(readr)
library(lubridate)
household_power_consumption = read_delim("household_power_consumption.txt", 
                                         ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                      Time = col_time(format = "%H:%M:%S")), 
                                         trim_ws = TRUE)


#select the data from the dates 2007-02-01 and 2007-02-02
filteredDate = filter(household_power_consumption, Date >= "2007-02-01", Date <= "2007-02-02")

filteredDate_v2 = mutate(filteredDate, DateTime = as.POSIXct(paste(Date, Time))) %>%
        filter(Global_active_power != "?", Weekday != "?")

#plot3.R
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))
with(filteredDate_v2, plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energey sub metering"))
lines(filteredDate_v2$DateTime, filteredDate_v2$Sub_metering_2, col = "red", type = "l")
lines(filteredDate_v2$DateTime, filteredDate_v2$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()