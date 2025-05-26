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

$$
\log(E[H_i]) = \gamma_0 + \gamma_1 \text{Exposure}_i + \gamma_2 \mathbf{x}_i + u_i
$$

$H_i$ represents the number of emergency department or hospitalization events for ambulatory care-sensitive conditions. The log-linear model examines whether prior disaster exposure predicts increased acute care utilization. $\gamma_1$ is the key coefficient. A significantly positive $\gamma_1$ would indicate greater reliance on emergency care in the aftermath of disaster exposure.

### H2c. Service disruptions mediate the relationship between disaster exposure and child outcomes.

#### Mediator model (e.g., reduction in EI visits):

$$
\log(E[M_i]) = \alpha_0 + \alpha_1 \text{Exposure}_i + \alpha_2 \mathbf{x}_i + u_i
$$

#### Outcome model (e.g., cognitive scores over time):

$$
Y_{ij} = \beta_0 + \beta_1 \text{Time}_{ij} + \beta_2 \text{Exposure}_i + \beta_3 M_i + \beta_4 (\text{Time}_{ij} \times \text{Exposure}_i) + \beta_5 (\text{Time}_{ij} \times M_i) + \mathbf{x}_i \boldsymbol{\beta}_6 + u_{0i} + u_{1i} \text{Time}_{ij} + \epsilon_{ij}
$$

In this mediation framework, $M_i$ represents the mediator (e.g., number of missed EI visits), which may be influenced by disaster exposure and, in turn, influence neurodevelopment. The mediator model estimates whether exposure predicts disruption in services ($\alpha_1$), while the outcome model estimates the effect of the mediator ($\beta_3$) on child development and whether that effect changes over time ($\beta_5$). Mediation is supported if both $\alpha_1$ and $\beta_3$ are significant, suggesting that disaster exposure impacts child outcomes in part through service disruption. For formal mediation testing, bootstrapping or causal mediation analysis is recommended.