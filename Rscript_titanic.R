rm(list = ls())
library(dplyr)
library(tidyr)
titanicnew = read.csv("titanic_original.csv", header = T, check.names = T, stringsAsFactors = T)
str(titanicnew)
titanic1 = titanicnew
#find out number of blanks in Embarked column
summary(titanicnew$embarked)
titanicnew$embarked = sub("^$", "S",titanicnew$embarked)
factor(titanicnew$embarked)
summary(titanicnew$age)
titanicnew$age[is.na(titanicnew$age)] = mean(titanicnew$age,trim = 0, na.rm = TRUE)
summary(titanicnew$age)
summary(titanicnew$boat)
str(titanicnew$boat)
levels(titanicnew$boat)
titanicnew$boat[which(grepl("^$",titanicnew$boat))] <- NA
levels(as.factor(titanicnew$boat))
str(titanicnew$cabin)
titanicnew$has_cabin_number = titanicnew$cabin
titanicnew$has_cabin_number = ifelse(grepl("[[:alnum:]]",titanicnew$has_cabin_number),1,0)
titanicnew$has_cabin_number
write.csv(titanicnew, file ="titanic_clean.csv")
