# Author: Riku Laine
# Date: Tue Nov 21 12:04:36 2017
# Project name: Riku Laine
# Description
# --------------
# Author:
# Date:
# Modification:
# --------------
# Preparations (source() and library())

library(dplyr)

#### Importing data

# Set working directory
setwd("C:/Users/Riku_L/Documents/GitHub/IODS-project/data/")

# Reading the csv files
stumat <- read.csv("student-mat.csv", sep=";")
stupor <- read.csv("student-por.csv", sep=";")

# Explore structures and dimensions
dim(stumat)
dim(stupor)

# Stumat has 395 rows and stupor has 649 rows, both have 33 columns.

str(stumat)
str(stupor)

# It seems both include some information from the respondents' demographic
# background and alcohol use.

# Check if all column names are the same
all.equal(colnames(stumat), colnames(stupor))

# They are.

#### Merging

join_variables <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")

joined_data <- inner_join(stumat, stupor, by = join_variables, suffix = c("-mat", "-por"))

# Structure and dimensions

str(joined_data)

# It seems that the columns which were used to combine sets haven't
# duplicated while the others have.

# Combining duplicates into the data

notjoined_columns <- colnames(stumat)[!colnames(stumat) %in% join_variables]

alc <- joined_data[colnames(joined_data) %in% join_variables]

for(column_name in notjoined_columns) {
	two_columns <- select(joined_data, starts_with(column_name))
	first_column <- select(two_columns, 1)[[1]]
	if(is.numeric(first_column)) {
		alc[column_name] <- round(rowMeans(two_columns))
	} else {
		alc[column_name] <- first_column
	}
}

alc$alc_use <- rowMeans(alc[, c("Dalc", "Walc")])

alc$high_use <- alc$alc_use > 2

glimpse(alc)

# This is the joined and modified data which seems to be in order.
# There is the desired number of observations and variables.

write.csv(alc, "alc.csv", row.names = F)


# Check if okay

head(read.csv("alc.csv"))

# Is  okay!