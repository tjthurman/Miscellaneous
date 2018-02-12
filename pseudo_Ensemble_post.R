pseudoEnsemblePost <- function(..., nDraws, pars) {
  # A function that takes in a set of Rstan models
  # and returns pseudo-ensemble posterior distribution.
  # That is, it generates a new posterior didtribution by
  # drawing samples from the posterior distributions of each of the included models
  # and the probability that we draw from any given model is equal to it's Akaike weight,
  # calculated from WAIC. 
  
  # The other arguments are nDraws, the number of samples used for the new ensemble posterior distribution,
  # and pars, a list of the parameters for which you want to construct the posterior.
  
  # Output: A matrix containing the ensemble posterior distribution. 
  # It will have nDraws rows and pars columns. Also prints a diagnostic table
  # giving the models considered, the calculate Akaike weight, and the empirical weight
  # in the ensemble (which should be close to the AW, but may be slightly different due to simulation variance)
  # Required packages: rethinking, 
  
  # After making this, it turns out that this method is OK, but not really the ideal solution
  # to doing model averaging or ensemble prediction. So, I've abandoned the idea for now, but
  # i thought the code was a nice bit of work and I learned a lot making it, 
  # so thought I'd keep it in case the ideas come in handy.
  
  
  x <- list(...) # turn the model arguments into one list
  n.models <- length(x)
  weights <- rethinking::compare(...)@output$weight # calculate the Akaike weights from WAIC using
  # the rethinking package. 
  # Then, figure out how many times we're going to draw from each model
  choose.from <- sample(x = 1:n.models, size = nDraws, replace =T, prob = weights)
  # Initialize the diagnostics table and resutls matrix
  diagnostics <- as.data.frame(matrix(data = NA, nrow = n.models, ncol = 3))
  colnames(diagnostics) <- c("model", "Ak.weight", "emp.weight")
  results <- matrix(nrow = 0, ncol = length(pars))
  for (model in 1:n.models) { # for each model
    num.draws <- sum(choose.from == model) # figure out how many times we're drawing from it
    rows.to.sample <- sample(x = 1:dim(x[[model]])[1], size = num.draws,replace = T) # randomly select that many rows
    samples <- as.data.frame(x[[model]], pars = pars)[rows.to.sample,] # select those rows
    diagnostics[model,] <- c(model, weights[model], num.draws/nDraws) # add diagnostics
    results <- rbind(results, samples) # and append the model's results to the results matrix
  }
  print(diagnostics)
  return(results)
}