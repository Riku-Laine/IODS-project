# Author: Riku Laine
# Date: Tue Nov 14 13:15:18 2017
# Project name: IODS week 2
# Description: This is a file for IODS week 2. Hopefully this week
# I'll remember to return the excercises this week.

library(MASS)

url <- "http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt"

lrn14 <- read.table(file = url, sep = '\t', header = T)

## Dimensions of the data

dim(lrn14)

# Data has 183 rows and 60 columns

colnames(lrn14)

# By the names of the columns, it seems that the data contains
# information about the participants' demographics and answers
# to self evaluation questions.

summary(lrn14$Age)

# Participants are 17-55 years old, whilst half of them are
# 21-27 years old (interquartile range).

str(lrn14)

an_data <- dplyr::select(lrn14, gender, Age, Attitude,Points)

an_data$d_sm <- lrn14$D03 + lrn14$D11 + lrn14$D19 + lrn14$D27
an_data$d_ri <- lrn14$D07 + lrn14$D14 + lrn14$D22 + lrn14$D30
an_data$d_ue <- lrn14$D06 + lrn14$D15 + lrn14$D23 + lrn14$D31
an_data$su_lp <- lrn14$SU02 + lrn14$SU10 + lrn14$SU18 + lrn14$SU26
an_data$su_um <- lrn14$SU05 + lrn14$SU13 + lrn14$SU21 + lrn14$SU29
an_data$su_sb <- lrn14$SU08 + lrn14$SU16 + lrn14$SU24 + lrn14$SU32
an_data$st_os <- lrn14$ST01 + lrn14$ST09 + lrn14$ST17 + lrn14$ST25
an_data$st_tm <- lrn14$ST04 + lrn14$ST12 + lrn14$ST20 + lrn14$ST28
an_data$Deep <- an_data$d_sm + an_data$d_ri + an_data$d_ue
an_data$Surf <- an_data$su_lp + an_data$su_um + an_data$su_sb
an_data$Stra <- an_data$st_os + an_data$st_tm
an_data$Deep_adj <- an_data$Deep/12
an_data$Surf_adj <- an_data$Surf/12
an_data$Stra_adj <- an_data$Stra/8

an_data <- an_data[an_data$Points!=0,]

an_data <- an_data[,colnames(an_data) %in% c('gender', 'Age', 'Attitude', 'Points',
                                             'Deep_adj', 'Surf_adj', 'Stra_adj')]
dim(an_data)

setwd(dir = "~/GitHub/IODS-project/data/")

write.csv(an_data, file = "learning2014.csv", row.names = F)

testing<- read.csv("learning2014.csv")

str(testing)
head(testing)

# Analysis