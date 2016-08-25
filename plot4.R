rm(list = ls())

workdir <- "/Users/RXP/Documents/Data Science Coursera Course/4. Exploratory Data Analysis/Week 1"
setwd(workdir)

library(dplyr)
dat <- tbl_df(read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                         stringsAsFactors = FALSE))
dim(dat)

library(lubridate)
dat <- dat %>% mutate(Date = dmy(Date)) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02") 

dat4 <- dat %>% mutate(Date_Time = ymd_hms(paste(as.character(Date), Time, sep = " ")),
                       Global_active_power = as.numeric(Global_active_power),
                       Voltage = as.numeric(Voltage),
                       Sub_metering_1 = as.numeric(Sub_metering_1),
                       Sub_metering_2 = as.numeric(Sub_metering_2),
                       Sub_metering_3 = as.numeric(Sub_metering_3),
                       Global_reactive_power = as.numeric(Global_reactive_power))
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(dat4, plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(dat4, plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(dat4, plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dat4, lines(Date_Time, Sub_metering_2, type = "l", col = "red"))
with(dat4, lines(Date_Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2,
       col = c("black", "red", "blue"), bty = "n")
with(dat4, plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
