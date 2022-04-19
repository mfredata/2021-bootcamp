# This script assumes you have downloaded the 'bootcamp' repository
# https://github.com/mfredata/bootcamp

# Step 1: Make sure you open the bootcamp.Rproj first
# Step 2: Open this script

# Load packages
pacman::p_load(here, readr, readxl, dplyr, readstata13, googlesheets4, cansim)

# read csv file using readr's read_csv() function
carbon <- read_csv(here("data", "yearly_co2_emissions.csv"))
head(carbon)

# read csv file using base's read.csv() function
carbon2 <- read.csv(here("data", "yearly_co2_emissions.csv"))
head(carbon2)

# read txt file using readr's read_tsv() function
province <- read_tsv(here("data", "province.txt"))

# read excel spreadsheet using readr's read_excel() function
gdp <- read_excel(here("data", "gdp_pc.xlsx"))

# reading excel spreadsheets with multiple sheets by sheet number
energy_hist <- read_excel(here("data", "energy_use_per_person.xlsx"), sheet = 1)
energy_new <- read_excel(here("data", "energy_use_per_person.xlsx"), sheet = 2)

# reading excel spreadsheets with multiple sheets by sheet name
energy_hist2 <- read_excel(here("data", "energy_use_per_person.xlsx"), sheet = "hist")
energy_new <- read_excel(here("data", "energy_use_per_person.xlsx"), sheet = "recent")

# use dplyr's full_join function to merge energy_hist and energy_new
energy <- full_join(energy_hist, energy_new, by = c("country"))

energy_basemerge <- merge(energy_hist, energy_new, by = c("country"), all.x = TRUE, all.y = TRUE)

# read Stata dta files 
politics <- read.dta13(here("data", "politics.dta"))
politics <- read.dta13(here("data", "politics.dta"), nonint.factors = TRUE)

# read google sheet files

gs4_deauth() # so no need to sign in to Google

disasters <- read_sheet("https://docs.google.com/spreadsheets/d/17s15o7jdDpGSKgsIboZdnYU2UxHtU9DHKNRmYVVgwJo/edit#gid=0") 
head(disasters)

# skip the first two empty rows
disasters <- read_sheet("https://docs.google.com/spreadsheets/d/17s15o7jdDpGSKgsIboZdnYU2UxHtU9DHKNRmYVVgwJo/edit#gid=0", skip = 2) 

# read Statistics Canada data
ag <- get_cansim('32-10-0359-01') 
