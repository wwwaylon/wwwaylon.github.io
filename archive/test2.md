
# Standard Operating Procedure (SOP) for Handling Missing Data

## Purpose

The purpose of this SOP is to establish a standardized approach to handling missing data in clinical trials and statistical analyses, as per the ICH E9 guidelines. Missing data can bias results, reduce statistical power, and affect the validity of conclusions. This SOP outlines steps for identifying, analyzing, and mitigating missing data through techniques such as multiple imputation and sensitivity analyses.

## Scope

This SOP applies to all clinical trials and research projects within the organization that involve the analysis of data where missing values may be present. It is mandatory for all biostatisticians, data scientists, and research staff involved in the data analysis process.

## Responsibilities

- **Biostatistics Director**: Responsible for ensuring compliance with this SOP across the biostatistics team.
- **Data Analysts/Biostatisticians**: Responsible for implementing the steps outlined in this SOP and performing appropriate analyses when missing data is identified.
- **Clinical Team**: Responsible for tracking data collection to minimize missing data and documenting reasons for missing data when known.

## Procedure

### 1. Identification of Missing Data

1.1. **Data Collection Phase**: 
   - Missing data must be minimized through proper planning, training of data collectors, and monitoring of data entry.
   - Any reasons for missing data (e.g., patient dropout, technical issues) should be documented clearly in the case report form (CRF).

1.2. **Data Exploration**: 
   - Upon receipt of the dataset, the extent and patterns of missing data must be assessed. Visualize the missing data using summary statistics and graphics to understand whether the missing data mechanism is random or systematic.

Sample R code for identifying missing data:

```r
# Load required libraries
library(naniar)
library(ggplot2)

# Visualize missing data
gg_miss_var(data) + labs(title = "Missing Data by Variable")

# Summarize missingness
missing_summary <- sapply(data, function(x) sum(is.na(x)))
missing_summary

2. Assessing the Missing Data Mechanism

2.1. Types of Missing Data:

	•	MCAR (Missing Completely at Random): Missingness is unrelated to any observed or unobserved data.
	•	MAR (Missing at Random): Missingness is related to observed data but not to the missing values themselves.
	•	MNAR (Missing Not at Random): Missingness is related to the unobserved data.

2.2. Statistical Tests for Missing Data: Use statistical methods to assess the nature of the missing data.

	•	Example: Little’s MCAR test can help determine whether data is MCAR.

Sample R code for performing Little’s MCAR test:

library(BaylorEdPsych)

# Perform Little's MCAR test
mcar_test <- LittleMCAR(data)
mcar_test

3. Handling Missing Data

3.1. Complete Case Analysis:

	•	This method involves analyzing only cases with complete data. It is only valid when data is MCAR.
	•	Limitation: May lead to reduced statistical power and biased results if data is not MCAR.

3.2. Multiple Imputation:

	•	ICH E9 recommends multiple imputation as a preferred approach to handle missing data, especially when data is MAR. This method replaces missing values with multiple sets of plausible values, reflecting the uncertainty around the missing data.

Sample R code for multiple imputation using the mice package:

# Load required library
library(mice)

# Perform multiple imputation
imputed_data <- mice(data, m = 5, method = 'pmm', seed = 500)

# Summary of imputed data
summary(imputed_data)

# Create complete datasets
completed_data <- complete(imputed_data, action = "long")

3.3. Sensitivity Analyses:

	•	Sensitivity analyses assess how sensitive the results are to different assumptions about the missing data. This includes conducting analyses with imputed data as well as scenarios assuming worst-case or best-case outcomes for missing data.

Sample R code for sensitivity analysis:

# Compare models with complete data vs. imputed data
complete_model <- lm(outcome ~ predictor1 + predictor2, data = data_complete)
imputed_model <- with(imputed_data, lm(outcome ~ predictor1 + predictor2))

# Pool results from multiple imputations
pooled_model <- pool(imputed_model)

# Summary of pooled model
summary(pooled_model)

4. Documentation and Reporting

4.1. Documenting Missing Data:

	•	Clearly document the extent, type, and handling of missing data in the Statistical Analysis Plan (SAP).
	•	Include a detailed description of the imputation model (variables used, number of imputations, and assumptions made).

4.2. Reporting Results:

	•	Results from multiple imputation or sensitivity analysis should be reported alongside the complete case analysis (if applicable). Provide confidence intervals and discuss the robustness of the results to the handling of missing data.

4.3. Regulatory Reporting:

	•	If required by regulatory bodies (e.g., FDA, EMA), report the methods used to handle missing data and justify why the chosen method was appropriate for the data at hand, in line with the ICH E9 guidelines.

Sample text for reporting missing data in a study report:

Missing data were addressed using multiple imputation (MI) with predictive mean matching (PMM) as recommended by the ICH E9 guidelines. Five imputed datasets were generated, and results were pooled using Rubin's rules. Sensitivity analyses were conducted to assess the impact of missing data, with findings indicating that results were robust across imputed and complete datasets.

Review and Updates

This SOP should be reviewed annually or when there are significant changes in regulatory guidelines or internal processes. Ensure that all team members are trained on the SOP and updated on any revisions.

References:

	•	ICH E9 Statistical Principles for Clinical Trials (ICH E9 Guidelines).
	•	FDA Guidance on Statistical Considerations (FDA Statistical Guidance).

This markdown document provides a structured and comprehensive SOP for handling missing data, adhering to regulatory guidelines like ICH E9, and including practical steps and R code for data analysis teams. The included R code examples will assist teams in executing multiple imputation and sensitivity analyses.