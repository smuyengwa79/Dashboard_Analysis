library(haven); 
library(knitr);
library(dplyr);
library(car)
# Read in the SPSS file using the read_spss function from the package haven

data1 <- read_spss("Dashboard Namibia 2009.sav") 

# select the key variables for analyis. This depends on the hypothesis 
#you need to test

data2 <- select(data1, QUESTIONNAIRENO: Q3_10, Q7_1A:Q8_14)
# Recoding the columns 41:51 using the recode function in package "car"

data2[ , 41:51]  <- lapply(data2[ ,41:51] ,
                           FUN = function(x) recode(x, "1=1;2=0;NA =0"))

#Still work on the dataset to create a new variable called "rightsIndex", 
#the mutate function in package dplyr does the work for you
data2 <- data2 %>% 
  mutate(rightsIndex = Q2_7A + Q2_7B + Q2_7C + Q2_7D +  
           Q2_7E+ Q2_7F+ Q2_7G+ Q2_7H+  Q2_7I +  Q2_7J +  Q2_7K)
data2$CONSERVANCY <- as_factor(data2$CONSERVANCY)
