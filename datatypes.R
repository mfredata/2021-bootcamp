# This script assumes you have downloaded the 'bootcamp' repository
# https://github.com/mfredata/bootcamp

# Step 1: Make sure you open the bootcamp.Rproj first
# Step 2: Open this script

# Data object types
numeric_var <- 1
character_var <- "one"
factor_var <- factor(1, labels = 'one')
logical_var <- TRUE

class(numeric_var)
class(character_var)
class(factor_var)
class(logical_var)

typeof(numeric_var)
typeof(character_var)
typeof(factor_var)
typeof(logical_var)

str(numeric_var)
str(character_var)
str(factor_var)
str(logical_var)

# convert numeric to character
convert <- as.character(numeric_var)
class(convert)

convert_back <- as.numeric(convert)
class(convert_back)

# vectors
countries <- c("Canada", "Kenya", "United states")
countries
emissions <- c(53700, 14300, 5250000)
emissions

# add China to the countries vector
countries <- c(countries, "China")
countries

# use length() to inspect # of elements in a vector
length(countries)

# use class() to inspect type of elements in a vector
class(countries)

# use str() to inspect the structure of an object and its elements
str(countries)

# mixing different data  types
trythis <- c(1, 2, 3, "a")
class(trythis)

trythis <- c("a", 1, TRUE, "b")
class(trythis)

# converting vectors
emissions <- as.character(emissions)
class(emissions)
emissions <- as.numeric(emissions)
class(emissions)

# subsetting vectors
emissions[1]
emissions[c(1,3)]
emissions[c(2:3)]

# conditional subsetting
emissions[emissions > 100000]
emissions[emissions > 0 & emissions < 55000]

# value matching
emissions %in% c("Canada")
countries %in% c("Canada", "United States")
emissions %in% c(14300, 50000)

# factors
regions <- factor(c("Americas", "Americas", "Europe", "Africa", "Europe"))
levels(regions)
nlevels(regions)

responses <- factor(c("low", "low", "high", "medium", "high", "low"))
responses # current order: high, low medium
plot(responses)

# specify order of levels
responses <- factor(responses, levels = c("low", "medium", "high"))
responses # after reordering
plot(responses)

# recode "medium" to "not sure"
levels(responses)[2] <- "not sure"
responses

# Dates
dates_ymd1 <- c("2021/08/01", "2021/08/02", "2021/08/03")
dates_ymd2 <- c("21/08/01", "21/08/02", "21/08/03")
dates_mdy1 <- c("08/01/2021", "08/02/2021", "08/03/2021")
dates_mdy2 <- c("Aug 1, 2021", "Aug 2, 2021", "Aug 3, 2021")
dates_mdy3 <- c("August 1, 2021", "August 2, 2021", "August 3, 2021")
class(dates_ymd1)
class(dates_ymd2)
class(dates_mdy1)
class(dates_mdy2)
class(dates_mdy3)

# convert dates from character to dates
#big Y for YYYY (2021); "/" because that is the  separator used
convert_dates_ymd1 <- as.Date(dates_ymd1, format = "%Y/%m/%d") 

#small y for YY (21 instead of 2021); "/" because that is the separator used
convert_dates_ymd2 <- as.Date(dates_ymd2, format = "%y/%m/%d") 

#diff format because month first; "/" because that is the separator used
convert_dates_mdy1 <- as.Date(dates_mdy1, format = "%m/%d/%Y")

#small b for abbreviated month (Aug instead of August)
#notice the format - matched with the input above Aug 1, 2021 (b d, Y)
convert_dates_mdy2 <- as.Date(dates_mdy2, format = "%b %d, %Y") 

#capital B for month that is fully spelled out (August instead of Aug)
#notice the format - matched with the input above August 1, 2021 (B d, Y)
convert_dates_mdy3 <- as.Date(dates_mdy3, format = "%B %d, %Y")

convert_dates_ymd1
convert_dates_ymd2
convert_dates_mdy1
convert_dates_mdy2
convert_dates_mdy3

class(convert_dates_ymd1)
class(convert_dates_ymd2)
class(convert_dates_mdy1)
class(convert_dates_mdy2)
class(convert_dates_mdy3)

# dates without a day - January 2021, February 2021, March 2021
dates_noday <- c("01/2021", "02/2021", "03/2021")

# if you use as.Date(), you need to add a day
# use the paste() function to concatenate/append a string
# can use 1 as an arbitrary day
# then convert to date using as.Date()
paste_dates_noday <- paste("01", dates_noday, sep = "/")
paste_dates_noday
convert_dates_noday <- as.Date(paste_dates_noday, format = "%d/%m/%Y")
convert_dates_noday

# can do the above in one step
convert_dates_noday <- as.Date(paste("01", dates_noday, sep = "/"), format = "%d/%m/%Y")
convert_dates_noday

# can also use {lubridate}'s different functions to work with dates
dates_ymd1 <- c("2021/08/01", "2021/08/02", "2021/08/03")
dates_ymd2 <- c("21/08/01", "21/08/02", "21/08/03")
dates_mdy1 <- c("08/01/2021", "08/02/2021", "08/03/2021")
dates_mdy2 <- c("Aug 1, 2021", "Aug 2, 2021", "Aug 3, 2021")
dates_mdy3 <- c("August 1, 2021", "August 2, 2021", "August 3, 2021")

lubridate_convert_dates_ymd1a <- as_date(dates_ymd1)
lubridate_convert_dates_ymd1b <- ymd(dates_ymd1)
lubridate_convert_dates_ymd2 <- ymd(dates_ymd2)

# as_date() only works with ymd format
lubridate_convert_dates_mdy1b <- mdy(dates_mdy1)
lubridate_convert_dates_mdy2 <- mdy(dates_mdy2)
lubridate_convert_dates_mdy3 <- mdy(dates_mdy3)

lubridate_convert_dates_ymd1
lubridate_convert_dates_ymd2
lubridate_convert_dates_mdy1
lubridate_convert_dates_mdy2
lubridate_convert_dates_mdy3

# use parse_date_time() when no day is provided; no need to use paste()
dates_noday <- c("01/2021", "02/2021", "03/2021")
convert_with_lubridate <- parse_date_time(dates_noday, orders = "m/Y")

# use seq() function to create a sequence of dates
dates_seq <- seq(as_date("2021/08/01"), length = 5, by = "days")
dates_seq

# Matrices