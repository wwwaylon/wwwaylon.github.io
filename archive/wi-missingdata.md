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

Note: This document must be reviewed and updated annually or when significant regulatory changes arise. All personnel involved in clinical trial data handling are required to undergo training on this work instruction.