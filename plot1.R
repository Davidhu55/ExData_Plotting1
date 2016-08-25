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

dat1 <- dat %>% mutate(Global_active_power = as.numeric(Global_active_power))
png("plot1.png", width = 480, height = 480)
plot1 <- hist(dat1$Global_active_power, col = "red", main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)")
dev.off()
