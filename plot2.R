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

dat2 <- dat %>% mutate(Date_Time = ymd_hms(paste(as.character(Date), Time, sep = " ")),
                                           Global_active_power = as.numeric(Global_active_power))
png("plot2.png", width = 480, height = 480)
plot2 <- with(dat2, plot(Date_Time, Global_active_power, type = "l", xlab = "",
                         ylab = "Global Active Power (Kilowatts)"))
dev.off()
