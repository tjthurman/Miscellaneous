library(dplyr)
library(tidyr)

barcodes <- read.delim(file = "Dropbox/pipeline_development/process_radtags/lib1_barcode_sample.txt", header = F) %>%
  select(V1) %>%
  separate(V1, into =  c("pos1", "pos2", "pos3",
                         "pos4", "pos5"), sep = c(1,2,3,4), convert = T)
barcodes$pos1 <- as.factor(barcodes$pos1) 
barcodes$pos2 <- as.factor(barcodes$pos2) 
barcodes$pos3 <- as.factor(barcodes$pos3) 
barcodes$pos4 <- as.factor(barcodes$pos4) 
barcodes$pos5 <- as.factor(barcodes$pos5)
diversity <- barcodes %>%
  count(pos5)
  