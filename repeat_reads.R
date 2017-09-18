####
## Using simulation to try to figure out 
## how the spike-in can tell us the
## number of fragments


rm(list = ls())

## Let's simulate a spike-in (or any sequencing project more generally).
## This function will generate a list of fragments (basically, a vector of numbers
## which each identify one fragment), then sample with replacement from this list 
## to simulate SINGLE-END sequencing those fragments. It then summarizes the results, 
## giving the mean # of unique fragments/reads per individual, the mean %unique reads 
## per individual, the total # of unique fragments that were sequenced 
## across all individuals, and the percentage of the total fragments that were sequenced.


## This Function has three arguments:
## assumed.fragments = the number of fragments in the library.
## n.reads = the number of reads the sequencing lane gives you. For reference,
## a 1% MiSeq spike-in should be ~250000 reads.
## n.ind = the number of individuals in the library. 


simulateSpikein <- function(assumed.fragments, n.reads, n.ind) {
  # get the reads per infividual.
  reads.per.ind<- n.reads/n.ind 
  # set up the matrix which will hold the "results" of the sequencing. 
  # each column represents an individual, and each row represents a
  # read. The number in [i,j] is the identity of the fragment which
  # was sequenced in the ith read of individual j.
  which.frag.seq <- matrix(NA, nrow = reads.per.ind, ncol = n.ind)
  # A for loop to simulate sequencing. 
  for (individual in 1:n.ind) {
    # for each individual, sample with replacement from the vector of assumed fragments
    # and put the sampled #s into our results matrix. 
    which.frag.seq[,individual] <- sample(1:assumed.fragments, size = reads.per.ind, replace = T)
  }
  
  # From this matrix, summarize the results to get the number of unique reads per 
  # individual
  # make a vector of the # of unique rads in each individual
  unique.per.Ind <- vector("numeric", length = n.ind)
  for (individual in 1:n.ind) {
    unique.per.Ind[individual] <- length(unique(which.frag.seq[,individual]))
  }
  
  # The final summary of all the data, in a data frame. 
  # hopefully the column names are self-explanatory. 
  results <- data.frame(meanUniqueInd = mean(unique.per.Ind),
                        meanPercentUni = mean(unique.per.Ind)/reads.per.ind,
                        totalUniqueFrags = length(unique(as.vector(which.frag.seq))),
                        percentFragssequenced = length(unique(as.vector(which.frag.seq)))/assumed.fragments)
  return(results)
}

# With this function, simulate some spike-ins

# The one we did, if it were single-end. 
# Shows that our number of reads would have been insufficient if we'd done single-end
# even more insufficieint with paired-end
simulateSpikein(130000, 250000, 14)

# The new proposed spike-in
simulateSpikein(130000, 200000000, 48)
