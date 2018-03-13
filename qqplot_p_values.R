# http://www.gettinggeneticsdone.com/2010/07/qq-plots-of-p-values-in-r-using-base.html

ggd.qqplot = function(pvector, main=NULL, ...) {
  o = -log10(sort(pvector,decreasing=F))
  e = -log10( 1:length(o)/length(o) )
  plot(e,o,pch=19,cex=1, main=main, ...,
       xlab=expression(Expected~~-log[10](italic(p))),
       ylab=expression(Observed~~-log[10](italic(p))),
       xlim=c(0,max(e)), ylim=c(0,max(o)))
  lines(e,e,col="red")
}

#Generate some fake data that deviates from the null
set.seed(42)
pvalues=runif(10000)
pvalues[sample(10000,10)] <- pvalues[sample(10000,10)]/5000

# pvalues is a numeric vector
pvalues[1:10]

# Using the ggd.qqplot() function
ggd.qqplot(pvalues)

# Add a title
ggd.qqplot(pvalues, "QQ-plot of p-values using ggd.qqplot")
