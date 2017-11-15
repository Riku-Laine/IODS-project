# Author: Riku Laine
# Date: Tue Nov 14 13:15:18 2017
# Project name: IODS week 2
# Description: This is a file for IODS week 2. Hopefully this week
# I'll remember to return the excercises this week.

url <- "http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt"

lrn14 <- read.table(file = url, sep = '\t', header = T)

## Structure dimensions of the data
dim(lrn14)

# Data has 183 rows and 60 columns

colnames(lrn14)

# By the names of the columns, it seems that the data contains
# information about the participants' demographics and possibly
# completed excercises.

an_data <- 

d_sm <- D03 + D11 + D19 + D27
d_ri <- D07 + D14 + D22 + D30
d_ue <- D06 + D15 + D23 + D31
su_lp <- SU02 + SU10 + SU18 + SU26
su_um <- SU05 + SU13 + SU21 + SU29
su_sb <- SU08 + SU16 + SU24 + SU32
st_os <- ST01 + ST09 + ST17 + ST25
st_tm <- ST04 + ST12 + ST20 + ST28
Deep <- d_sm + d_ri + d_ue
Surf <- su_lp + su_um + su_sb
Stra <- st_os + st_tm
Deep_adj <- Deep/12
Surf_adj <- Surf/12
Stra_adj <- Stra/8