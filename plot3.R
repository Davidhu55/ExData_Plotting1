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

dat3 <- dat %>% mutate(Date_Time = ymd_hms(paste(as.character(Date), Time, sep = " ")),
                       Sub_metering_1 = as.numeric(Sub_metering_1),
                       Sub_metering_2 = as.numeric(Sub_metering_2),
                       Sub_metering_3 = as.numeric(Sub_metering_3))
png("plot3.png", width = 480, height = 480)
with(dat3, plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dat3, lines(Date_Time, Sub_metering_2, type = "l", col = "red"))
with(dat3, lines(Date_Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2,
       col = c("black", "red", "blue"))
dev.off()
