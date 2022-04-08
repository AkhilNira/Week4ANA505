#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
library(datasets)
data(HairEyeColor)
HEColor <- HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(HairEyeColor,2)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
HEColor <- as_tibble(HEColor)
HEColor %>%  select(Hair, Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
HEColor_2 <- HEColor %>%  select(Hair, Sex)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
HEColor_2 %>% select(!Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
HEColor %>% mutate(Gender = Sex, Sex = NULL)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
HEColor_3 <- HEColor %>% mutate(Gender = Sex, Sex = NULL)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
HEMale <- filter(HEColor_3, Gender =="Male")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
HEColor_3 %>% group_by(Gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here: 592
total=mutate(HEColor_3 , total=cumsum(n))


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
HEFemale <- filter(HEColor_3, Gender =="Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
HEUnion <- union(HEMale, HEFemale)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
