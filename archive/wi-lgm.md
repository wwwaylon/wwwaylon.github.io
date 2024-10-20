# Work Instruction: Conducting a Latent Growth Model (LGM)

**Version**: 2.0  
**Date**: [Insert Date]  
**Author**: [Insert Author]  
**Reviewed by**: [Insert Reviewer]  
**Purpose**: This work instruction describes the detailed steps to conduct a Latent Growth Model (LGM) using best practices for longitudinal data analysis. This version includes updates based on current methodological guidance.

---

<h2>Table of Contents</h2>
<nav id="TableOfContents">
<ul>
  <li><a href="#purpose">1. Purpose</a></li>
  <li><a href="#scope">2. Scope</a></li>
  <li><a href="#prerequisites">3. Prerequisites</a></li>
  <li><a href="#materials">4. Materials</a></li>
  <li><a href="#instructions">5. Instructions</a>
      <ul>
          <li><a href="#data-structure-preparation">Data Structure Preparation</a></li>
          <li><a href="#model-specification">Model Specification</a></li>
          <li><a href="#model-fit-and-estimation">Model Fit and Estimation</a></li>
          <li><a href="#interpretation-of-results">Interpretation of Results</a></li>
      </ul>
  </li>
  <li><a href="#appendix">6. Appendix: Reference Code</a></li>
  <li><a href="#revision-history">7. Revision History</a></li>
</ul>
</nav>

---

<h2 id="purpose">1. Purpose</h2>

This instruction guides researchers through conducting a Latent Growth Model (LGM), focusing on modeling change over time. LGMs estimate latent variables (intercept and slope) that represent the underlying trajectory of an outcome variable across multiple time points. This instruction has been updated based on current literature on the topic, ensuring comprehensive and accurate guidance.

<h2 id="scope">2. Scope</h2>

This work instruction applies to analysts working with longitudinal data in a wide format. It assumes basic familiarity with structural equation modeling (SEM) and latent variable estimation. The instruction covers the setup, execution, and interpretation of a latent growth model.

---

<h2 id="prerequisites">3. Prerequisites</h2>

Before conducting an LGM, ensure the following:
- **Software**: Mplus, R (with `lavaan`), or similar SEM software.
- **Data Structure**: Data must be prepared in a **wide format** (i.e., one row per subject with separate columns for each time point).
- **Time Points**: Must have a minimum of three time points for adequate estimation of growth parameters.

---

<h2 id="materials">4. Materials</h2>

- **Software**: Mplus or R
- **Dataset**: Longitudinal dataset with the outcome variable measured at multiple time points.
- **Modeling Resources**: Code templates, previous analyses for reference (if available).

---

<h2 id="instructions">5. Instructions</h2>

<h3 id="data-structure-preparation">5.1 Data Structure Preparation</h3>

Latent growth modeling requires **longitudinal data** organized in a **wide format**. Each participant should have multiple columns corresponding to the outcome variable at different time points.

#### Steps:
1. Ensure that data is in wide format.
   - Columns represent measurement occasions (e.g., `outcome_time1`, `outcome_time2`, `outcome_time3`).
   - Each row corresponds to one participant.
2. Check for missing data.
   - Use imputation methods (e.g., Multiple Imputation by Chained Equations, MICE) if missing data exceeds 5%.
   - Ensure that missingness is handled properly, particularly when it follows a non-ignorable pattern.
   
**Note**: Missing data can impact the estimation of intercepts and slopes. Make sure to assess the missing data mechanism and apply appropriate handling techniques (e.g., Full Information Maximum Likelihood, FIML).

---

<h3 id="model-specification">5.2 Model Specification</h3>

Latent growth models estimate **two primary latent variables**: the intercept and the slope (linear change). 

#### Steps:
1. **Intercept and Slope Definition**:
   - The intercept represents the starting point (initial level) for each individual.
   - The slope reflects the rate of change over time.
   
   Loadings for the intercept should be fixed at 1 for each time point. Loadings for the slope can be set to 0, 1, 2 (if time points are evenly spaced), or customized for non-linear growth.

   Example code in Mplus:

```mplus
   MODEL:
   I S | outcome_time1@0 outcome_time2@1 outcome_time3@2;
```

2.	**Variance-Covariance Structures**:
- Estimate the variances of the intercept and slope factors, along with their covariance.
	
3.	**Consideration of Non-Linear Growth**:
- If the trajectory is not linear, quadratic or piecewise models should be explored.
- In cases of non-linear growth, quadratic growth models include an additional latent factor for curvature (squared term).

Example code in Mplus for quadratic growth:

```mplus
MODEL:
I S Q | outcome_time1@0 outcome_time2@1 outcome_time3@2 outcome_time4@3;
```

<h3 id="model-fit-and-estimation">5.3 Model Fit and Estimation</h3>

The model fit should be assessed using multiple fit indices.

Steps:

1.	Fit Indices:
- Use fit indices such as CFI (Comparative Fit Index), RMSEA (Root Mean Square Error of Approximation), and SRMR (Standardized Root Mean Square Residual).
- Typical acceptable values: CFI > 0.95, RMSEA < 0.06, SRMR < 0.08.

2.	Estimation Methods:
- Maximum Likelihood Estimation (MLE) is the default choice for latent growth models.
- Use robust estimation techniques (e.g., MLM or MLR) if data does not meet normality assumptions.

<h3 id="interpretation-of-results">5.4 Interpretation of Results</h3>

The estimated parameters provide insights into the overall trajectory (intercept and slope) and the variability between individuals.

Steps:

1.	Intercept: Represents the average initial status (baseline level).
2.	Slope: The average rate of change. A significant positive slope indicates an upward trajectory, while a significant negative slope indicates a downward trajectory.
3.	Variance: Assess the variance of both intercept and slope factors to understand the degree of individual differences in initial levels and rates of change.
4.	Covariance: The covariance between the intercept and slope can reveal whether individuals with higher initial values tend to change faster or slower over time.

<h2 id="appendix">6. Appendix: Reference Code</h2>

Below is example code for conducting a basic LGM in Mplus and R (lavaan).

Mplus Example:

```mplus
DATA: FILE IS data.dat;
VARIABLE: NAMES ARE id outcome_time1 outcome_time2 outcome_time3;
MODEL:
  I S | outcome_time1@0 outcome_time2@1 outcome_time3@2;
  I WITH S;
OUTPUT: TECH1 TECH4;
```

R (lavaan) Example:

```r
library(lavaan)
model <- '
  # intercept and slope
  i =~ 1*outcome_time1 + 1*outcome_time2 + 1*outcome_time3
  s =~ 0*outcome_time1 + 1*outcome_time2 + 2*outcome_time3
  # variances
  i ~~ i
  s ~~ s
  i ~~ s
'
fit <- growth(model, data = mydata)
summary(fit, fit.measures=TRUE)
```

<h2 id="revision-history">7. Revision History</h2>

| Version | Date         | Author        | Description                                                                                              |
|---------|--------------|---------------|----------------------------------------------------------------------------------------------------------|
| 1.0     | [Insert Date] | [Author Name] | Initial version                                                                                           |
| 2.0     | [Insert Date] | [Author Name] | Updated to reflect methodological guidance from recent literature, including data preparation, model specification, and fit evaluation. |
