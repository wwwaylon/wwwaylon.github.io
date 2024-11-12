Below is a structured work instruction for handling missing data in an FDA-sponsored clinical trial. This document follows best practices for pharmaceutical companies and includes technical detail, standard operating procedures, and code.

Work Instruction for Handling Missing Data in FDA-Sponsored Clinical Trials

Document ID: WI-CLIN-005
Version: 1.0
Effective Date: [Insert Date]
Reviewed By: [Reviewer’s Name]
Approved By: [Approver’s Name]
Department: Biostatistics & Data Management
Purpose: To outline procedures for handling missing data in FDA-sponsored clinical trials in accordance with ICH E9 and ICH E10 guidance on statistical principles for clinical trials and missing data best practices.

Table of Contents

	1.	Scope
	2.	Definitions
	3.	Responsibilities
	4.	Procedure
	5.	References
	6.	Appendices

1. Scope

This document applies to all clinical trials sponsored by [Company Name] that are subject to FDA regulations. It covers the identification, classification, handling, and documentation of missing data in study datasets used for efficacy, safety, and exploratory analyses.

2. Definitions

	•	Missing Data: Data not recorded or captured in the dataset due to various reasons such as patient dropout, non-response to specific items, or data entry errors.
	•	MAR (Missing at Random): The probability of missingness is related to observed data but not the missing data itself.
	•	MCAR (Missing Completely at Random): Missingness is unrelated to both observed and unobserved data.
	•	MNAR (Missing Not at Random): Missingness is related to the missing data itself, often due to dropout or treatment failure.

3. Responsibilities

	•	Principal Investigator: Ensure data collection protocols minimize missing data.
	•	Clinical Data Manager: Identify and log all missing data instances for resolution.
	•	Biostatistician: Determine appropriate handling and imputation methods based on missing data patterns and perform analyses.
	•	Statistical Programmer: Implement and validate missing data handling and imputation methods using R or SAS software.

4. Procedure

4.1 Identification and Classification of Missing Data

	1.	Identify Missing Data: Import the raw data into R or SAS and run initial checks to identify missing values across variables.
R Code Example:

# Load necessary packages
library(dplyr)
library(mice)

# Load data
study_data <- read.csv("clinical_trial_data.csv")

# Identify missing data
missing_summary <- study_data %>%
    summarise_all(~ sum(is.na(.))) %>%
    pivot_longer(everything(), names_to = "Variable", values_to = "MissingCount")

print(missing_summary)


	2.	Classify Missing Data Mechanism:
	•	Conduct statistical tests to classify missing data mechanism (MCAR, MAR, MNAR).
R Code Example (Little’s MCAR Test):

library(BaylorEdPsych)

# Run Little's MCAR test
little_test <- LittleMCAR(study_data)
print(little_test)



4.2 Missing Data Handling Strategy

	1.	Imputation Strategy: Based on the missing data mechanism, the following strategies may be applied:
	•	MCAR: Consider complete case analysis or single imputation.
	•	MAR: Use multiple imputation (MI) or maximum likelihood estimation (MLE).
	•	MNAR: Apply sensitivity analyses and MNAR-specific models.
	2.	Multiple Imputation Procedure:
	•	Use the mice package in R for multiple imputation by chained equations (MICE).
R Code Example (MICE):

# Impute missing data using MICE
imputed_data <- mice(study_data, m = 5, maxit = 10, method = 'pmm', seed = 500)
summary(imputed_data)

# Obtain completed data sets
completed_data <- complete(imputed_data, action = "long", include = TRUE)


	3.	Sensitivity Analysis:
	•	Conduct a sensitivity analysis to assess robustness under various missing data assumptions.
	•	Examples of sensitivity analysis include pattern-mixture models or using the delta method in mice.
R Code Example (Pattern-Mixture Model):

# Pattern-mixture model sensitivity analysis
imputed_data <- mice(study_data, method = 'pmm', delta = c(0, 0.5, 1))



4.3 Analysis of Imputed Data

	1.	Pooling Results Across Imputed Datasets:
	•	Analyze each imputed dataset separately and pool results using Rubin’s Rules.
R Code Example (Pooling with MICE):

# Fit the model to each imputed dataset
model <- with(imputed_data, lm(outcome ~ treatment + covariate1 + covariate2))

# Pool results
pooled_results <- pool(model)
summary(pooled_results)


	2.	Documenting Missing Data Handling:
	•	All imputation procedures, model assumptions, and sensitivity analyses must be documented in the statistical analysis plan (SAP) and included in clinical study reports (CSRs).

4.4 Validation of Imputed Data

	1.	Statistical Programmer Validation:
	•	Conduct a cross-validation of the missing data imputation and ensure reproducibility by independent programming.
SAS Code for Comparison (PROC MI and PROC MIANALYZE):

proc mi data=clinical_trial_data out=mi_data seed=12345 nimpute=5;
    var outcome treatment covariate1 covariate2;
run;

proc mianalyze data=mi_data;
    modeleffects outcome;
run;


	2.	Quality Control (QC) Review:
	•	Conduct QC on the imputation results to verify that the imputed values align with expected distributions and values within each variable’s plausible range.

4.5 Reporting

	1.	Document Findings:
	•	Summarize the imputation methods, sensitivity analyses, and any key findings from the missing data analysis in the final clinical study report.
	2.	FDA Submission Requirements:
	•	Include the following in the FDA submission:
	•	Missing data patterns and summary.
	•	Details of imputation method(s) and sensitivity analyses.
	•	Justification for missing data approach.
	•	Pooling and analysis details for each imputed dataset.

5. References

	•	ICH E9: Statistical Principles for Clinical Trials.
	•	ICH E10: Choice of Control Group and Related Issues in Clinical Trials.
	•	Rubin, D. B. (1987). Multiple Imputation for Nonresponse in Surveys. John Wiley & Sons.

6. Appendices

	•	Appendix A: Sample Output of Missing Data Patterns.
	•	Appendix B: Example MICE Analysis Output.

.rise. All personnel involved in clinical trial data handling are required to undergo training on this work instruction.

Certainly. Here are complete examples for Appendix A and Appendix B as requested.

Appendix A: Sample Output of Missing Data Patterns

This appendix provides an example of the output for missing data patterns in a clinical trial dataset using the R package mice.

R Code to Generate Missing Data Pattern Summary:

# Load necessary packages
library(mice)

# Load example clinical trial data
# Assuming study_data is the dataset loaded previously
# Simulating missing data pattern analysis
md_pattern <- md.pattern(study_data)

# Print missing data pattern summary
print(md_pattern)

Example Output:

     outcome treatment covariate1 covariate2    
269       1         1         1         1    0
12        1         1         1         0    1
8         1         1         0         1    1
5         1         0         1         1    1
4         1         1         0         0    2
Total     1         1         1         1  Sum

Note: In the table above, "1" indicates observed values, and "0" indicates missing values.
The rightmost column shows the total number of missing values for each pattern.

The md.pattern() function generates a matrix that describes the observed and missing data patterns. This output helps in identifying which variables frequently have missing values and informs decisions on appropriate handling strategies.

Visual Representation of Missing Data Pattern:

Using the mice package, a plot can help visualize missing data patterns, which is particularly useful for large datasets.

# Plot missing data pattern
library(VIM)
aggr_plot <- aggr(study_data, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE,
                  labels=names(study_data), cex.axis=.7, gap=3, ylab=c("Missing data","Pattern"))

This code will create a graphical summary, where blue bars indicate observed data and red bars indicate missing data, providing an immediate overview of missing data distributions across variables.

Appendix B: Example MICE Analysis Output

This appendix provides an example of multiple imputation and pooling results using the mice package in R.

1. Performing Multiple Imputation

R Code for Multiple Imputation:

# Perform multiple imputation
# Specifying 'm' for the number of imputed datasets, 'maxit' for maximum iterations
imputed_data <- mice(study_data, m = 5, maxit = 10, method = 'pmm', seed = 500)

# Display summary of imputations
summary(imputed_data)

Example Output (Imputation Summary):

Multiply imputed data set
Number of multiple imputations:  5 
Imputation methods:
 outcome   : pmm 
 treatment : logreg 
 covariate1: pmm 
 covariate2: pmm 

Number of logged events:
  iteration 1 :   10
  iteration 2 :   10
...

The output from summary(imputed_data) provides an overview of the imputation process, including the number of imputations and the method used for each variable. Here, predictive mean matching (pmm) and logistic regression (logreg) are applied to continuous and binary variables, respectively.

2. Analyzing and Pooling Results

R Code for Fitting Models on Imputed Datasets and Pooling:

# Fit linear regression model on each imputed dataset
model <- with(imputed_data, lm(outcome ~ treatment + covariate1 + covariate2))

# Pool results from the imputed datasets
pooled_results <- pool(model)

# Display pooled results
summary(pooled_results)

Example Output (Pooled Results):

          term       estimate  std.error statistic      df    p.value
1     (Intercept)      3.25     0.45      7.22     345.2     <0.001
2      treatment       1.02     0.12      8.50     342.8     <0.001
3     covariate1       0.54     0.08      6.75     341.9     <0.001
4     covariate2      -0.30     0.07     -4.29     340.6     <0.001

The pooled results combine estimates from the imputed datasets using Rubin’s Rules. Here, each predictor’s estimate, standard error, t-statistic, degrees of freedom (df), and p-value are provided. These results are used in the final report for clinical trial analysis.

Note: The full documentation, including output interpretations and validation steps, should be maintained in the Statistical Analysis Plan (SAP) and Clinical Study Report (CSR). These appendices provide a template for the standard outputs to be generated and recorded.
