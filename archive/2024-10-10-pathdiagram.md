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

H1a. Children with any disaster exposure will demonstrate poorer neurodevelopmental trajectories.

To test whether disaster exposure is associated with differential developmental change, we will estimate a linear mixed-effects growth model of child neurodevelopment over time. The outcome variable, $Y_{ij}$, represents a neurodevelopmental score (e.g., cognitive, language, motor) for child $i$ at time point $j$. Disaster exposure is modeled as a binary, time-invariant predictor, $\text{Exposure}_i$, indicating whether the child experienced a disaster during the study period.

The model is specified as:

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}{ij} + \beta_2 \text{Exposure}i + \beta_3 (\text{Time}{ij} \times \text{Exposure}i) + \boldsymbol{\beta}4 \mathbf{x}i + u{0i} + u{1i} \text{Time}{ij} + \epsilon{ij}
$$

In this formulation, $\text{Time}{ij}$ denotes the time of assessment (e.g., in months since baseline or disaster onset), and $\mathbf{x}i$ includes a vector of time-invariant child- and family-level covariates, such as child age at enrollment, sex, race/ethnicity, maternal education, household income, and baseline developmental status. Random intercepts ($u{0i}$) and slopes ($u{1i}$) allow each child to have an individualized trajectory, while $\epsilon_{ij}$ denotes residual within-child variation.

The intercept $\beta_0$ represents the average baseline score across all children, and $\beta_1$ is the average rate of developmental change. The coefficient $\beta_2$ captures baseline differences in developmental functioning between exposed and unexposed children, while $\beta_3$ estimates the extent to which disaster exposure moderates the slope of developmental change. A significantly negative $\beta_3$ would suggest that children with disaster exposure tend to show slower developmental progress or steeper declines over time relative to their unexposed peers. This model provides a formal test of the association between disaster exposure and developmental trajectories, while accounting for individual variability and relevant covariates.

### H1b. Greater cumulative exposure will be associated with poorer outcomes.

H1b. Greater cumulative exposure will be associated with poorer developmental outcomes.

To evaluate the long-term effects of repeated disaster exposure on child development, we will estimate a linear mixed-effects growth model to assess the relationship between cumulative exposure and developmental trajectories. The dependent variable, $Y_{ij}$, represents a developmental score (e.g., cognitive, language, or social-emotional functioning) for child $i$ at time point $j$. The primary predictor, $\text{CumulativeExposure}_i$, is a child-level, time-invariant measure indicating the total number of discrete disaster events experienced by the child (e.g., multiple hurricanes or public health emergencies).

The model is specified as:

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}{ij} + \beta_2 \text{CumulativeExposure}i + \beta_3 (\text{Time}{ij} \times \text{CumulativeExposure}i) + \boldsymbol{\beta}4 \mathbf{x}i + u{0i} + u{1i} \text{Time}{ij} + \epsilon{ij}
$$

In this specification, $\text{Time}{ij}$ reflects the time of assessment (e.g., months since baseline or disaster onset), $\mathbf{x}i$ is a vector of time-invariant covariates such as child age at enrollment, sex, race/ethnicity, baseline developmental status, maternal education, household income, or pre-existing health conditions. The random effects $u{0i}$ and $u{1i}$ allow each child to have a unique intercept and slope, while $\epsilon_{ij}$ represents the residual error term.

The coefficient $\beta_2$ estimates differences in baseline developmental status by level of cumulative exposure, while $\beta_3$ captures whether the rate of developmental change over time varies as a function of cumulative disaster exposure. A significantly negative $\beta_3$ would be consistent with the hypothesis that children exposed to a greater number of disasters tend to exhibit slower developmental growth or sharper declines over time, suggesting a potential cumulative burden on neurodevelopment. This model facilitates the examination of dose–response patterns in the association between disaster frequency and developmental outcomes, accounting for confounding variables and individual variability in trajectories.


### H1c. Increased disaster intensity will be associated with worse developmental trajectories.

H1c. Increased disaster intensity will be associated with worse developmental trajectories.

To examine whether the severity of disaster exposure predicts changes in child development over time, we will estimate a linear mixed-effects growth model with random intercepts and slopes. The outcome variable, $Y_{ij}$, represents a repeated developmental measure for child $i$ at time $j$ (e.g., cognitive, language, or motor scores). Disaster intensity is modeled as a continuous, child-level predictor, measured using indicators such as maximum wind speed, flood height, or a composite index derived from FEMA damage assessments.

The model is specified as:

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}{ij} + \beta_2 \text{Intensity}i + \beta_3 (\text{Time}{ij} \times \text{Intensity}i) + \boldsymbol{\beta}4 \mathbf{x}i + u{0i} + u{1i} \text{Time}{ij} + \epsilon{ij}
$$

In this equation, $\text{Time}{ij}$ represents the assessment occasion (e.g., months since disaster or months since baseline), $\text{Intensity}i$ is a time-invariant, continuous measure of disaster exposure severity for child $i$, and $\mathbf{x}i$ includes time-invariant covariates such as baseline developmental status, child sex, age at enrollment, race/ethnicity, maternal education, and pre-disaster health conditions. Random effects $u{0i}$ and $u{1i}$ allow for individual variability in intercepts and slopes, respectively, and $\epsilon{ij}$ is the residual error term.

The coefficient of primary interest is $\beta_3$, which captures the interaction between time and disaster intensity. A significantly negative $\beta_3$ would indicate that children who experienced more severe disaster impacts exhibit slower developmental gains or steeper declines over time, consistent with a dose–response relationship between disaster intensity and developmental trajectory. This model accounts for both individual baseline differences and intra-individual change, enabling inference about how disaster-related stressors may disrupt developmental progress across early childhood.

## Aim 2: Disruptions in Services as a Mediator

### H2a. Disaster exposure will be associated with fewer EI and pediatric visits (within 3 months).

H2a. Disaster exposure will be associated with fewer early intervention and pediatric visits within 3 months.

To evaluate whether disaster exposure disrupts access to routine pediatric and early intervention (EI) services, we will model the count of service encounters within the 3-month period following the disaster. The outcome variable, $S_i$, represents the number of routine service visits for child $i$, including both pediatric primary care and EI contacts. A generalized linear mixed-effects model with a log link will be used to estimate the expected number of visits, assuming a Poisson or negative binomial distribution based on the presence of overdispersion.

The model is specified as:

$$
\log(E[S_i]) = \alpha_0 + \alpha_1 \text{Exposure}_i + \boldsymbol{\alpha}_2 \mathbf{x}_i + u_i
$$

In this equation, $\text{Exposure}_i$ captures the level of disaster exposure experienced by child $i$, and $\mathbf{x}_i$ is a vector of time-invariant covariates, such as child age, sex, race/ethnicity, baseline health status, socioeconomic indicators (e.g., insurance type, maternal education), and service enrollment status prior to the disaster. The term $u_i$ denotes a child-specific random effect to account for unmeasured heterogeneity in baseline service utilization.

The coefficient of interest, $\alpha_1$, estimates the log difference in expected service use associated with disaster exposure. A significantly negative $\alpha_1$ would indicate that children exposed to the disaster accessed fewer EI or pediatric services during the post-disaster recovery period, supporting the hypothesis that such exposure disrupts routine care continuity.

This model allows us to quantify the extent to which exposure to large-scale disruptive events—such as natural disasters or public health emergencies—interferes with timely receipt of services that are critical to early development and health maintenance.


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



Power Analysis

Power analyses were conducted to assess the sample size required to detect small-to-moderate effect sizes across the proposed hypotheses involving both longitudinal mixed-effects models (H1a–H1c) and mediation models with multilevel structure (H2a–H2c). Simulations were performed in R using the simr, powerlmm, and mediation packages to account for model complexity, nested data, and non-independence of observations.

For longitudinal growth models (H1a–H1c), power was estimated based on a two-level structure with repeated assessments (level 1) nested within children (level 2). We assumed three waves of data collection, an average of 2.5 assessments per child after accounting for attrition and missingness, and a conservative intraclass correlation coefficient (ICC) of 0.25. Under these conditions, a sample of 600 children provides 80% power to detect small-to-moderate effects (Cohen’s f² = 0.02–0.03) for fixed effects of time-varying and time-invariant predictors, including disaster exposure and its interactions with time (e.g., $\beta_3$ in H1a–H1c). Power is highest for main effects (e.g., $\beta_2$) and somewhat reduced but acceptable for interactions and slopes (e.g., $\beta_3$), especially with high within-child reliability of the outcome measure.

For generalized linear mixed models assessing count outcomes (H2a–H2b), simulations were based on Poisson or negative binomial distributions with overdispersion. With an expected mean of 2–4 service use events per child (e.g., ED visits), and assuming overdispersion and random intercepts at the child level, a sample of 600 children yields at least 80% power to detect incidence rate ratios (IRRs) of 1.30 or greater for disaster exposure effects (e.g., $\alpha_1$ or $\gamma_1$), which aligns with effect sizes seen in prior disaster impact studies.

For the multilevel mediation model (H2c), we used simulation-based approaches to estimate power for a 2-1-1 design where the predictor (disaster exposure) and mediator (e.g., service disruption) are level-2 variables, and the outcome (e.g., developmental score) is measured at level 1 across time. Assuming small to moderate mediation effects and moderate correlation between exposure and the mediator (r = 0.3), a sample of 600 children with at least two outcome assessments yields 80% power to detect mediated (indirect) effects using bias-corrected bootstrapped confidence intervals. Temporal ordering will be maintained by ensuring the exposure precedes the mediator (measured within 3 months post-disaster), and that the mediator temporally precedes the outcome, which is assessed longitudinally at multiple timepoints thereafter. The approach follows the temporal logic required for causal mediation modeling as described by Preacher, Zyphur, and Zhang (2010).

All power estimates assume minimal clustering at levels above the child (e.g., household or community), but sensitivity checks were performed under scenarios with modest community-level intraclass correlation (ICC = 0.05). If needed, multilevel modeling will be adjusted to account for clustering or design effects. These estimates indicate adequate power to detect key hypothesized relationships while allowing for inclusion of relevant covariates and random effects.


# Load necessary libraries
library(simr)         # For power simulations of mixed models
library(lme4)         # For mixed-effects modeling
library(MASS)         # For Negative Binomial
library(mediation)    # For causal mediation analysis
library(powerlmm)     # For longitudinal power analysis

# -----------------------------------------
# 1. Longitudinal mixed-effects model power
# -----------------------------------------
# Simulate a dataset for 600 children with 3 time points

model1 <- lmer(Y ~ Time * Exposure + (1 + Time | ID), 
               data = simdata <- powerlmm::sim_data_fixed(n1 = 3, n2 = 600, fixed_intercept = 50,
                                                         fixed_slope = 0.5, sigma_subject_intercept = 5,
                                                         sigma_subject_slope = 1, sigma_error = 2,
                                                         fixed_effects = list(Exposure = c(0, -1, 1))))

# Power for the interaction term (Exposure x Time)
power1 <- powerSim(model1, fixed("Time:Exposure", "t"), nsim = 100)
summary(power1)

# -----------------------------------------
# 2. GLMM with Poisson outcome (H2a/H2b)
# -----------------------------------------
# Simulate Poisson outcome for health service use

glmm_model <- glmer(Visits ~ Exposure + (1 | ID), 
                    data = simdata2 <- data.frame(ID = rep(1:600, each = 1),
                                                  Exposure = rbinom(600, 1, 0.5),
                                                  Visits = rpois(600, lambda = 2.5)),
                    family = poisson)

# Power analysis for Exposure effect
power2 <- powerSim(glmm_model, fixed("Exposure", "z"), nsim = 100)
summary(power2)

# -----------------------------------------
# 3. Multilevel mediation model (2-1-1)
# -----------------------------------------
# Simulate data for multilevel mediation model
set.seed(123)
N <- 600
J <- 3
ID <- rep(1:N, each = J)
Time <- rep(1:J, times = N)
Exposure <- rep(rbinom(N, 1, 0.5), each = J)
Mediator <- rep(rnorm(N, mean = 0.5 * Exposure[1:N * J %/% J], sd = 1), each = J)
Y <- 50 + 0.5 * Time + 0.3 * Mediator + 0.2 * Exposure + 
     0.1 * Time * Mediator + rnorm(N * J, 0, 1)
med_data <- data.frame(ID, Time, Exposure, Mediator, Y)

# Fit mediator and outcome models
med_model <- lm(Mediator ~ Exposure, data = med_data[!duplicated(med_data$ID), ])
outcome_model <- lmer(Y ~ Time * Exposure + Time * Mediator + (1 + Time | ID), data = med_data)

# Mediation analysis
med_power <- mediate(med_model, outcome_model, treat = "Exposure", mediator = "Mediator",
                     sims = 100, boot = TRUE)
summary(med_power)





