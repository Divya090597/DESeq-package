# DESeq-package: Exploring Gene Expression: A Guide to DESeq2 Analysis in R**

This code contains several classes and methods and performs several functions related to differential gene expression analysis using the DESeq2 package. Here's a breakdown of what each part does:
***FUNCTIONS****
1. **Data Loading and Preparation**:
   - Loads the "airway" dataset.
   - Converts the sample information into a data frame and adjusts column names.
   - Writes the sample information to a CSV file ("sample_info.csv").
   - Retrieves the count data from the "airway" dataset and writes it to another CSV file ("counts_data.csv").

2. **Differential Gene Expression Analysis**:
   - Reads the count data and sample information from the CSV files.
   - Checks and ensures that the row names in the sample information match the column names in the count data.
   - Constructs a DESeqDataSet object (`dds`) using the count data and sample information, specifying a design formula.

3. **Data Filtering and Preprocessing**:
   - Filters out rows (genes) with low counts, keeping those with at least 10 reads total.
   - Sets the factor level for "dexamethasone" to "untreated" as the reference level.
   - Runs DESeq analysis (`DESeq(dds)`) to perform differential gene expression analysis.

4. **Analysis and Visualization**:
   - Retrieves and summarizes the results of the DESeq analysis (`results(dds)` and `summary(res)`).
   - Conducts further analysis with a significance level of 0.01 (`results(dds, alpha = 0.01)` and `summary(res0.01)`).
   - Lists the contrasts used in the analysis (`resultsNames(dds)`).
   - Generates an MA plot to visualize the results (`plotMA(res)`).
     The code provided contains several classes and methods from the DESeq2 package in R. Here's a summary of the classes and methods used in the code:

1. **Classes**:
   - **DESeqDataSet**: This class represents a dataset object that is used for analysis with DESeq2. It combines count data (gene expression counts) with sample information, allowing for differential gene expression analysis.
   - **DESeqResults**: This class represents the results of a DESeq analysis, containing information about differential expression statistics, fold changes, p-values, and adjusted p-values.

2. **Methods**:
   - **DESeqDataSetFromMatrix**: This method is used to construct a DESeqDataSet object from count data and sample information. It takes arguments such as countData (matrix of count data), colData (data frame of sample information), and design (formula specifying the experimental design).
   - **rowSums**: This method calculates the row-wise sums of a matrix, which is used in filtering rows (genes) with low counts.
   - **relevel**: This method is used to set the reference level of a factor variable. In the code, it sets the reference level for the "dexamethasone" variable to "untreated."
   - **DESeq**: This method runs the DESeq analysis on a DESeqDataSet object, performing differential gene expression analysis and computing statistics such as fold changes, p-values, and adjusted p-values.
   - **results**: This method extracts the results of a DESeq analysis, allowing for summary and exploration of differential expression results.
   - **resultsNames**: This method retrieves the names of the contrasts used in the DESeq analysis.
   - **plotMA**: This method generates an MA plot, which is commonly used in RNA-Seq analysis to visualize differential expression results.

### Why DESeq2?

DESeq2 is a widely used tool for analyzing RNA-seq data, particularly for identifying differentially expressed genes between experimental conditions. Its robust statistical methods and flexibility make it a preferred choice for researchers in the field of genomics and bioinformatics.

### Conclusion

Gene expression analysis is a fundamental aspect of molecular biology and genetics. By leveraging tools like DESeq2 in R, researchers can unravel the complex interplay of genes and their regulatory mechanisms. This code serves as a primer for conducting differential gene expression analysis, empowering researchers to extract valuable insights from large-scale gene expression datasets.

