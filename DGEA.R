#'Script to get data from airway package
#'load libraries

library(DESeq2)
library(tidyverse)
library(airway)

data("airway")
airway

sample_info <- as.data.frame(colData(airway))
sample_info <- sample_info[,c(2,3)]
sample_info$dex <- gsub('trt','treated',sample_info$dex)
sample_info$dex <- gsub('untrt','untreated',sample_info$dex)
names(sample_info) <- c('cellLine','dexamethasone')
write.table(sample_info,file = "sample_info.csv",sep = ',',col.names = T,quote = F)

countsData <- assay(airway)
write.table(countsData,file = "counts_data.csv",sep = ',',col.names = T,quote = F)

#'Script to perform Differential gene expression analysis using DESeq2 package
#'Step 1 : preparing count data
#'read in counts data
counts_data <- read.csv('counts_data.csv')
head(counts_data)

#'read in sample info
colData <- read.csv('sample_info.csv')

#'making sure the row names in colData matches to column names in counts_data
all(colnames(counts_data)%in% rownames(colData))

#'are they in the same order?
all(colnames(counts_data) == rownames(colData))

#'Step 2 : construct a DESeqDataset object
#'
dds <- DESeqDataSetFromMatrix(countData = counts_data,
                              colData = colData,
                              design =  ~dexamethasone)
dds

#'prefiltering : removing rows with low gene counts
#'keeping rows that have atleast 10 reads total
#'
keep <- rowSums(counts(dds)) >=10
dds <- dds[keep,]
dds

#' set the factor level
dds$dexamethasone <- relevel(dds$dexamethasone, ref = "untreated")

#'NOTE: Collapse technical replicates
#'
#'Step 3: Run DESeq
dds <- DESeq(dds)
res <- results(dds)
res

#' Explore results
summary(res)

res0.01 <- results(dds, alpha = 0.01)
summary(res0.01)

#'contrasts
resultsNames(dds)

#'MA plot
plotMA(res)
