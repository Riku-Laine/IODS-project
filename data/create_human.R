# Author: Riku Laine
# Date: Tue Nov 28 11:49:59 2017
# Project name: Riku Laine
# Description
# --------------
# Author:
# Date:
# Modification:
# --------------
# Preparations (source() and library())
# Importing data
# Functions
# Statements

library(plyr)

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd); str(gii)

summary(hd); summary(gii)

colnames(hd) <- c("HDIr", "Country", "HDI", "LEAB", "ExpYEd", "MeanYEd", "GNICapita", "GNI-HDI")
colnames(gii) <- c("GII", "Country", "GII", "MatMortRatio", "ABR", "ParlRep", "edu2F", "edu2M", "LabourF", "LabourM")

gii <- mutate(gii, FMratio = edu2F / edu2M)
gii <- mutate(gii, labourRatio = LabourF / LabourM)

human <- inner_join(x = hd, y = gii, by = "Country")

write.csv(human, "~/GitHub/IODS-project/data/human.csv")

###################

# Week 5

library(dplyr)
library(stringr)

# 1

human$GNICapita <- str_replace(human$GNICapita, pattern=",", replace ="") %>% as.numeric

human <- human[, colnames(human) %in% c( "Country", "edu2F", "LabourF", "ExpYEd", "LEAB", "GNICapita", "MatMortRatio", "ABR", "ParlRep")]

human <- human[complete.cases(human), ]

# Regions out

notRegions <- nrow(human) - 7

human <- human[1:notRegions, ]

# Define row names with country name

rownames(human) <- human$Country

human$Country <- NULL

write.csv(human, "~/GitHub/IODS-project/data/human.csv", row.names = rownames(human))
