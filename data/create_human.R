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

write.csv(human, "human.csv")
