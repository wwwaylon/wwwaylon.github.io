layout: post
title: Modeling Missing Not at Random (MNAR) Data
subtitle: Advanced Techniques in Handling Missing Data
cover-img: /assets/img/path.jpg
thumbnail-img: /assets/img/mnar.png
share-img: /assets/img/path.jpg
tags: [missing data, MNAR, Mplus, advanced modeling]


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


In research, missing data is nearly inevitable, and how we handle it can substantially affect our findings. While most missing data handling techniques assume that data are either Missing Completely at Random (MCAR) or Missing at Random (MAR), some situations involve data that are Missing Not at Random (MNAR). In these cases, the missingness depends on the unobserved values themselves, and typical MAR assumptions won’t suffice. This post will introduce MNAR modeling and demonstrate how to implement it in Mplus.

<h2 id="why-mnar-data-requires-special-handling">Why MNAR Data Requires Special Handling</h2>


When data are MNAR, the probability of missingness is related to the missing values themselves. For example, individuals with lower income may be less likely to report their income, or people with more severe symptoms may avoid completing a mental health survey. Without explicitly modeling this missingness mechanism, analyses may yield biased results.

Common approaches for handling MNAR include:

	•	Selection Models: These specify a model for the probability of missingness and the substantive model jointly.
	•	Pattern-Mixture Models: These involve modeling the observed data by conditioning on the missingness patterns.
	•	Latent Variable Models: In Mplus, a latent variable approach can be implemented to handle MNAR, where the missing data mechanism is incorporated into the analysis.

In this post, we’ll focus on using Mplus to apply a pattern-mixture model and a selection model for MNAR data.

<h2 id="mnar-modeling-in-mplus">MNAR Modeling in Mplus</h2>


To illustrate, we’ll use a hypothetical dataset where Income has missing values that depend on its own (unobserved) level. We’ll look at both pattern-mixture and selection models to address this MNAR scenario.

<h3 id="1-pattern-mixture-model-for-mnar">1. Pattern-Mixture Model for MNAR</h3>


In a pattern-mixture model, we account for the missingness by grouping data based on the missing data patterns and modeling within each pattern. This approach is useful when we can reasonably assume that individuals with missing data might differ systematically from those without.

<h4 id="mplus-code-for-pattern-mixture-model">Mplus Code for Pattern-Mixture Model</h4>


Here’s an example of Mplus code to implement a pattern-mixture model for the variable Income:

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

<h3 id="interpretation-and-write-up-for-pattern-mixture-model">Interpretation and Write-up for Pattern-Mixture Model</h3>


After fitting the pattern-mixture model, you may interpret the results as follows:

Interpretation:
The pattern-mixture model output provides coefficients for the relationship between Income and Age for those with observed income (missing_income#1) and for those with missing income (missing_income#2). The mnar_effect coefficient reflects the MNAR mechanism’s impact on the income-age relationship. If mnar_effect is significantly different from zero, it suggests that the income-age association differs systematically between individuals with observed vs. missing income data, indicating the presence of MNAR.

Write-up Example:
“A pattern-mixture model was used to investigate whether missing income data depended on the income-age relationship. Results indicated a significant MNAR effect (p < .05), suggesting that individuals with missing income had a systematically different income-age association compared to those with observed income data. This indicates that the missing income data mechanism is likely MNAR, requiring adjustments in interpretation for potential bias.”

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