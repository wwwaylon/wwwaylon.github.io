---
layout: post
title: Creating Professional Path Diagrams for Publication
subtitle: Using Adobe Illustrator
thumbnail-img: /assets/img/lgm.png
#gh-repo: wwwaylon/beautiful-jekyll
#gh-badge: [star, fork, follow]
tags: [Path Diagram Illustrator]
---

## Aim 1: Weather-Related Disaster Exposure and Neurodevelopment

### H1a. Children with any disaster exposure will demonstrate poorer neurodevelopmental trajectories.

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}_{ij} + \beta_2 \text{Exposure}_i + \beta_3 (\text{Time}_{ij} \times \text{Exposure}_i) + \mathbf{x}_i \boldsymbol{\beta}_4 + u_{0i} + u_{1i} \text{Time}_{ij} + \epsilon_{ij}
$$

This model estimates each child’s neurodevelopmental score ($Y_{ij}$) over time ($\text{Time}_{ij}$). The fixed intercept ($\beta_0$) represents the average baseline score, and $\beta_1$ is the average slope of change across all children. $\beta_2$ captures baseline differences between children with and without disaster exposure. The key parameter of interest is $\beta_3$, which estimates whether the rate of developmental change over time differs by disaster exposure status—i.e., whether exposure moderates the developmental trajectory. $\mathbf{x}_i \boldsymbol{\beta}_4$ includes child-level covariates such as age, sex, and SES. The random effects $u_{0i}$ and $u_{1i}$ allow for child-specific intercepts and slopes, and $\epsilon_{ij}$ represents residual error. Inference will focus on $\beta_3$ to determine whether exposure significantly alters developmental trajectories.

### H1b. Greater cumulative exposure will be associated with poorer outcomes.

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}_{ij} + \beta_2 \text{CumulativeExposure}_i + \beta_3 (\text{Time}_{ij} \times \text{CumulativeExposure}_i) + \mathbf{x}_i \boldsymbol{\beta}_4 + u_{0i} + u_{1i} \text{Time}_{ij} + \epsilon_{ij}
$$

Here, $\text{CumulativeExposure}_i$ represents the total number of disasters a child has experienced. $\beta_2$ captures differences in baseline neurodevelopmental functioning by exposure level, while $\beta_3$ evaluates whether cumulative exposure changes the rate of developmental progress. A significantly negative $\beta_3$ would support the hypothesis that increased exposure leads to poorer neurodevelopmental outcomes over time. Covariates, random effects, and residual error are specified as in H1a.

### H1c. Increased disaster intensity will be associated with worse developmental trajectories.

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}_{ij} + \beta_2 \text{Intensity}_i + \beta_3 (\text{Time}_{ij} \times \text{Intensity}_i) + \mathbf{x}_i \boldsymbol{\beta}_4 + u_{0i} + u_{1i} \text{Time}_{ij} + \epsilon_{ij}
$$

In this model, $\text{Intensity}_i$ is a continuous measure of disaster intensity (e.g., wind speed, FEMA damage index). $\beta_3$ is the key coefficient testing whether the severity of disaster exposure predicts differential developmental trajectories. A significant and negative $\beta_3$ would suggest a dose-response relationship, indicating that greater disaster intensity is associated with steeper declines or slower improvements in neurodevelopment.

## Aim 2: Disruptions in Services as a Mediator

### H2a. Disaster exposure will be associated with fewer EI and pediatric visits (within 3 months).

$$
\log(E[S_i]) = \alpha_0 + \alpha_1 \text{Exposure}_i + \alpha_2 \mathbf{x}_i + u_i
$$

Here, $S_i$ is the expected number of service encounters (e.g., EI or pediatric visits) for child $i$. The model uses a log-link to model counts, assuming a Poisson or negative binomial distribution. $\alpha_1$ is the key coefficient indicating whether exposure to a disaster is associated with a reduction in service use. Covariates are included in $\alpha_2$, and $u_i$ represents child-specific random effects. A significantly negative $\alpha_1$ would support the hypothesis that exposure disrupts access to routine care.

### H2b. Disaster exposure will be associated with more ACSC-related ED and hospital visits (within 12 months).

H2b. Disaster exposure will be associated with increased ACSC-related ED and hospital visits within 12 months.

To test whether disaster exposure is associated with greater acute care utilization, we will model the count of emergency department (ED) and hospitalization visits for ambulatory care-sensitive conditions (ACSCs) using a log-linear mixed-effects model. The outcome variable, $H_i$, represents the total number of ED or hospital encounters for ACSCs experienced by child $i$ during the 12-month post-disaster observation period. Disaster exposure is modeled as a primary predictor at the child level, with additional time-invariant covariates included to control for confounding factors.

The model is specified as follows:

$$
\log(E[H_i]) = \gamma_0 + \gamma_1 \text{Exposure}_i + \boldsymbol{\gamma}_2 \mathbf{x}_i + u_i
$$

In this equation, $\text{Exposure}_i$ indicates the cumulative level of disaster exposure experienced by child $i$, $\mathbf{x}_i$ is a vector of time-invariant covariates (e.g., child age at baseline, gender, race/ethnicity, pre-disaster health conditions, insurance status, maternal education), and $u_i$ is a subject-level random effect capturing unobserved heterogeneity in acute care use across individuals. The log link function allows for modeling of non-negative, overdispersed count outcomes using a Poisson or negative binomial distribution, depending on model fit and dispersion diagnostics.

The coefficient of primary interest is $\gamma_1$, which estimates the log change in the expected count of ACSC-related visits associated with disaster exposure. A significantly positive $\gamma_1$ would suggest that greater disaster exposure is linked to increased reliance on emergency or inpatient care for conditions that are typically manageable through timely primary or preventive services. This finding would provide evidence that disaster events may destabilize care continuity or access, especially for vulnerable populations.


### H2c. Service disruptions mediate the relationship between disaster exposure and child outcomes.

H2c. Service disruptions mediate the time-varying relationship between disaster exposure and child outcomes.

To evaluate whether disruptions in early intervention (EI) services mediate the relationship between disaster exposure and child developmental outcomes, we will estimate a 1-1-1 multilevel mediation model in which all primary variables—exposure, mediator, and outcome—vary across time and are measured repeatedly for each child. In this framework, disaster exposure ($\text{Exposure}{ij}$) and service disruption ($M{ij}$) are specified as time-varying Level 1 predictors of child outcomes ($Y_{ij}$), also measured at Level 1. Repeated observations are nested within children, and between-child variation is modeled through random effects and time-invariant covariates at Level 2.

The mediation model is specified in two parts. First, the mediator model evaluates whether time-varying exposure predicts disruptions in EI services at the same time point:

$$
M_{ij} = \alpha_0 + \alpha_1 \text{Exposure}_{ij} + \boldsymbol{\alpha}2 \mathbf{x}^{(1)}{ij} + \boldsymbol{\alpha}3 \mathbf{x}^{(2)}i + u{0i} + e{ij}
$$

Second, the outcome model assesses whether service disruptions predict developmental outcomes, accounting for both exposure and covariates:

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}{ij} + \beta_2 \text{Exposure}{ij} + \beta_3 M_{ij} + \beta_4 (\text{Time}{ij} \times \text{Exposure}{ij}) + \beta_5 (\text{Time}{ij} \times M{ij}) + \boldsymbol{\beta}6 \mathbf{x}^{(1)}{ij} + \boldsymbol{\beta}7 \mathbf{x}^{(2)}i + u{0i} + u{1i} \text{Time}{ij} + \epsilon{ij}
$$

In these models, $\text{Exposure}{ij}$ is a child’s disaster-related exposure at time $j$, $M{ij}$ is the number of missed or reduced EI visits, and $Y_{ij}$ is a continuous child outcome (e.g., cognitive or language development score). Time-varying covariates $\mathbf{x}^{(1)}_{ij}$ include dynamic factors such as current caregiver stress, time since disaster, and seasonal availability of services. Time-invariant covariates $\mathbf{x}^{(2)}_i$ include baseline child age, race/ethnicity, maternal education, and child diagnosis at enrollment. All time-varying predictors will be group-mean centered to isolate within-child effects over time, while time-invariant predictors will be grand-mean centered to interpret between-child effects.

To preserve the temporal logic required for mediation, we will lag the mediator such that $M_{i(j-1)}$ is used to predict $Y_{ij}$, and $\text{Exposure}{i(j-1)}$ is used to predict both $M{i(j-1)}$ and $Y_{ij}$. This temporal structure aligns with the hypothesized causal ordering $\text{Exposure}{j-1} \rightarrow M{j-1} \rightarrow Y_j$, minimizing risks of reverse causation.

Multilevel indirect effects will be estimated using Monte Carlo confidence intervals or parametric bootstrap procedures, consistent with the approach recommended by Preacher, Zyphur, and Zhang (2010). This modeling framework accounts for the nested data structure, disaggregates within- and between-person effects, and enables rigorous inference regarding the mediating role of service disruption in the association between disaster exposure and child development over time.

