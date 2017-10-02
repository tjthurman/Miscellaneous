library(dplyr)


# Make fake data ----------------------------------------------------------
# Species A has < 5 across the three transects, should remove
# Species B has >5 when summed across transects, should keep
# Species C has >5 in one transect, should keep
spp<-c("a","a","a","b","b", "c")
transect<-c(1,2, 3,1, 2, 3)
abund<-c(0,1,1,2,4,10)
# Make the fake data into a data rame that matches the example
data <- data.frame(cbind(spp,transect))
data$abund <- as.numeric(abund)


# Process the data --------------------------------------------------------
# First, doing it step-by step to show how it works
data2 <- data %>%
  group_by(spp) %>% # within each species
  mutate(total.abund = sum(abund)) %>% # make a new column that is the sum of the abundance column
  ungroup()

data3 <- data2 %>%
  filter(total.abund >= 5) %>% # keep only rows where total abundance is >= 5
  select(-total.abund) %>% # get rid of the total abundance column, if you don't need it for later
  droplevels() # get rid of extra species and transect factors that are no longer present. 



# All one line, for ease of use -------------------------------------------
# Change the names of the columns (spp, abund, whatever) as necessary to match your data. 
processed.data <- data %>%
  group_by(spp) %>%
  mutate(total.abund = sum(abund)) %>% 
  ungroup() %>%
  filter(total.abund >= 5) %>%
  select(-total.abund) %>%
  droplevels() 
  

