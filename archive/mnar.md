---
layout: post
title: Modeling Missing Not at Random (MNAR) Data
subtitle: Advanced Techniques in Handling Missing Data
cover-img: /assets/img/path.jpg
thumbnail-img: /assets/img/mnar.png
share-img: /assets/img/path.jpg
tags: [missing data, MNAR, Mplus, advanced modeling]
---

<h2>Table of Contents</h2>
<nav id="TableOfContents">
<ul>
<li><a href="#introduction-to-mnar-data">Introduction to MNAR Data</a></li>
<li><a href="#why-mnar-data-requires-special-handling">Why MNAR Data Requires Special Handling</a></li>
<li><a href="#mnar-modeling-in-mplus">MNAR Modeling in Mplus</a></li>
<li><a href="#1-pattern-mixture-model-for-mnar">1. Pattern-Mixture Model for MNAR</a></li>
<li><a href="#mplus-code-for-pattern-mixture-model">Mplus Code for Pattern-Mixture Model</a></li>
<li><a href="#interpretation-and-write-up-for-pattern-mixture-model">Interpretation and Write-up for Pattern-Mixture Model</a></li>
<li><a href="#2-selection-model-for-mnar">2. Selection Model for MNAR</a></li>
<li><a href="#mplus-code-for-selection-model">Mplus Code for Selection Model</a></li>
<li><a href="#interpretation-and-write-up-for-selection-model">Interpretation and Write-up for Selection Model</a></li>
<li><a href="#comparing-the-approaches">Comparing the Approaches</a></li>
<li><a href="#limitations-and-considerations">Limitations and Considerations</a></li>
<li><a href="#conclusion">Conclusion</a></li>
</ul>
</nav>


<h2 id="introduction-to-mnar-data">Introduction to MNAR Data</h2>

Missing data is almost unavoidable in research, and how it’s handled can significantly impact the results. Most common techniques for managing missing data assume it is either Missing Completely at Random (MCAR) or Missing at Random (MAR). However, some situations involve data that are Missing Not at Random (MNAR), where the likelihood of missingness depends on the unobserved values themselves. In these cases, standard MAR-based methods are insufficient.

<h2 id="why-mnar-data-requires-special-handling">Why MNAR Data Requires Special Handling</h2>

According to Little and Rubin (2002), Missing Not at Random (MNAR) occurs when the probability that data are missing depends on the unobserved values themselves, even after accounting for observed data. In other words, MNAR means that missingness is related to the missing data points in a way that cannot be explained by the observed data alone. This dependency creates a more complex missing data mechanism, as the missingness is associated with values that are not present in the dataset, making it challenging to accurately account for without additional assumptions or modeling approaches. 

For example, individuals with lower income may be less likely to report their income, or people with more severe symptoms may avoid completing a mental health survey. Without explicitly modeling this missingness mechanism, analyses may yield biased results.

Common approaches for handling MNAR include:

- Selection Models: These specify a model for the probability of missingness and the substantive model jointly.

- Pattern-Mixture Models: These involve modeling the observed data by conditioning on the missingness patterns.

- Latent Variable Models: In Mplus, a latent variable approach can be implemented to handle MNAR, where the missing data mechanism is incorporated into the analysis.

In this post, we’ll focus on using Mplus to apply a pattern-mixture model and a selection model for MNAR data.

<h2 id="mnar-modeling-in-mplus">MNAR Modeling in Mplus</h2>


To illustrate, we’ll use a hypothetical dataset where Income has missing values that depend on its own (unobserved) level. We’ll look at both pattern-mixture and selection models to address this MNAR scenario.

<h3 id="1-pattern-mixture-model-for-mnar">1. Pattern-Mixture Model for MNAR</h3>


In a pattern-mixture model, we account for the missingness by grouping data based on the missing data patterns and modeling within each pattern. This approach is useful when we can reasonably assume that individuals with missing data might differ systematically from those without.

<h4 id="mplus-code-for-pattern-mixture-model">Mplus Code for Pattern-Mixture Model</h4>


Here’s an example of Mplus code to implement a pattern-mixture model for the variable Income:

```mplus
TITLE: Pattern-Mixture Model for MNAR Data

DATA: FILE IS income_data.dat;

VARIABLE: NAMES = id age income;
MISSING = ALL (-999);  ! Define missing value indicator

USEVARIABLES = age income missing_income;
DEFINE: missing_income = (income EQ -999);  ! Indicator for missingness on income

MODEL:
  ! Define the model separately for those with observed vs. missing income
  MODEL missing_income#1:  ! For those with income observed
    income ON age;
  MODEL missing_income#2:  ! For those with income missing
    income ON age (mnar_effect);  ! Account for MNAR effect

MODEL TEST:
  ! Test if MNAR effect is significantly different
  mnar_effect = 0;
```

<h3 id="interpretation-and-write-up-for-pattern-mixture-model">Interpretation and Write-up for Pattern-Mixture Model</h3>


After fitting the pattern-mixture model, you may interpret the results as follows:

Interpretation:
The pattern-mixture model output provides coefficients for the relationship between Income and Age for those with observed income (missing_income#1) and for those with missing income (missing_income#2). The mnar_effect coefficient reflects the MNAR mechanism’s impact on the income-age relationship. If mnar_effect is significantly different from zero, it suggests that the income-age association differs systematically between individuals with observed vs. missing income data, indicating the presence of MNAR.

Write-up Example:
“A pattern-mixture model was used to investigate whether missing income data depended on the income-age relationship. Results indicated a significant MNAR effect (p < .05), suggesting that individuals with missing income had a systematically different income-age association compared to those with observed income data. This indicates that the missing income data mechanism is likely MNAR, requiring adjustments in interpretation for potential bias.”


In a pattern-mixture model, the p-value associated with the mnar_effect coefficient (or any coefficient) is typically obtained through statistical testing of whether the coefficient significantly differs from zero. This p-value tells us whether there is evidence that the relationship between variables (e.g., income and age) differs between groups with observed vs. missing data.

Here’s how the p-value is obtained and the assumptions involved:

	1.	Model Fitting and Estimation: The pattern-mixture model is usually fitted using maximum likelihood estimation (MLE), which involves calculating parameter estimates that maximize the likelihood of observing the data given the model. This process is common in mixed-effects models, structural equation modeling (SEM), or other types of regression frameworks that can handle missing data.
	2.	Significance Testing:
	•	Once the model is fitted, the p-value for the mnar_effect coefficient is derived by testing the null hypothesis that mnar_effect = 0, meaning there is no difference in the income-age relationship between groups with observed and missing income data.
	•	The test statistic (such as a Wald test or likelihood ratio test) is calculated based on the coefficient estimate and its standard error. This test statistic follows a known distribution (often approximately normal or chi-square), allowing for the calculation of a p-value.
	3.	Assumptions:
	•	Normality of Residuals: The residuals (errors) in the model are typically assumed to be normally distributed. This is particularly important for obtaining accurate standard errors and thus reliable p-values, especially in smaller samples.
	•	Independence of Observations: Observations are assumed to be independent within groups (i.e., between individuals with observed vs. missing income).
	•	Correct Model Specification: The model structure, including predictors and the MNAR effect, must be correctly specified. Mis-specification can lead to incorrect estimates and invalid p-values.
	•	MNAR Mechanism Validity: The model assumes that the missing data mechanism is indeed MNAR. The pattern-mixture model approach incorporates this assumption by allowing the relationship between variables (e.g., income and age) to vary based on missingness. However, demonstrating that data are truly MNAR is challenging, as this mechanism is not directly testable.

It’s important to note that testing for MNAR is inherently complex, and interpreting the significance of the mnar_effect coefficient as evidence for MNAR should be done with caution, acknowledging that the model assumes the data mechanism is MNAR based on observed patterns rather than providing definitive proof.






<h3 id="2-selection-model-for-mnar">2. Selection Model for MNAR</h3>


Selection models are another option for MNAR, where we model the probability of missingness jointly with the main model of interest. This approach is particularly effective when we can estimate the factors influencing the missingness itself.

<h4 id="mplus-code-for-selection-model">Mplus Code for Selection Model</h4>


Here’s an example of Mplus code to estimate a selection model for Income:

TITLE: Selection Model for MNAR Data

DATA: FILE IS income_data.dat;

VARIABLE: NAMES = id age income;
MISSING = ALL (-999);  ! Define missing value indicator

USEVARIABLES = age income income_missing;
DEFINE: income_missing = (income EQ -999);  ! Indicator for missingness on income

MODEL:
  ! Main outcome model
  income ON age;

  ! Model the probability of missingness on income
  income_missing ON age income;  ! Selection model equation

<h3 id="interpretation-and-write-up-for-selection-model">Interpretation and Write-up for Selection Model</h3>


Interpretation:
The selection model estimates how both observed variables (Age and Income) relate to the probability of missing income. If the coefficient for Income in predicting missingness (income_missing) is significant, it suggests that the probability of missingness is dependent on income itself, confirming the MNAR assumption.

Write-up Example:
“A selection model was applied to assess the dependency of income missingness on the variable itself. Findings indicated that the likelihood of missing income was significantly associated with the unobserved income level (p < .05), supporting an MNAR mechanism. This suggests that individuals with missing income values may have systematically different income levels, warranting caution in interpretation of analyses without appropriate adjustments.”

<h2 id="comparing-the-approaches">Comparing the Approaches</h2>


The pattern-mixture model provides a straightforward way to examine how missingness might affect results by conditioning on missingness patterns. The selection model, on the other hand, jointly models the outcome and the missingness mechanism, which is helpful when we want to explicitly account for missingness related to the outcome itself.

<h2 id="limitations-and-considerations">Limitations and Considerations</h2>


While MNAR models can help address bias, they rely on strong assumptions. Both selection and pattern-mixture models require careful specification, and incorrect assumptions can lead to further bias. Also, since MNAR is inherently difficult to handle, it’s essential to consider the possibility of sensitivity analyses to check how robust your results are to different assumptions about the missing data.

<h2 id="conclusion">Conclusion</h2>


Modeling MNAR data can be challenging, but Mplus offers powerful tools to address it. By understanding and applying pattern-mixture or selection models, you can more accurately handle MNAR data and improve the validity of your research findings. As always, it’s vital to report these methods transparently and to consider sensitivity analyses to assess the robustness of your conclusions.

This post provides a comprehensive introduction to MNAR models with code examples, interpretations, and report templates for each approach. These tools can enhance your analyses and support the transparent reporting of assumptions around missing data.