---
layout: post
title: Thinking about and approaching statistics
subtitle: beyond classical methods
#cover-img: /assets/img/path.jpg
thumbnail-img: /assets/img/napkin.jpg
#share-img: /assets/img/path.jpg  
tags: [modern methods, statistics]
---

A researcher’s vision can be constrained by how they think about and use data. It is tough to watch researchers develop intricate theories about how the world works, which represent a lot of deep thinking about a topic, only to cut them up into smaller chunks that are then crammed into canned statistical procedures that were never designed to address the original question to begin with. Advanced statistical techniques allow us to ask more sophisticated questions.

### Example 1. Parallel change processes

This is a handwritten path diagram that demonstrates a lot of deep thinking about a topic. 

<p align="center">
  <img width="700" height="600" src="/assets/img/napkin.jpg">
</p>

I often get diagrams like this and I love to see them. What I want you to notice is that there is a lot going on here, we have multiple processes interacting in some really interesting ways. In this diagram you see the forest rather than the trees – which is to say that we are not focusing on one regression path or mean comparison here, rather we are looking into a complex system and all the effects are within the context of all the other pieces of the model. 

This is a plot of some data collected for this project. 

<p align="center">
  <img width="460" height="300" src="/assets/img/eciplot.png">
</p>

Notice that each line represents a different form of communication – so the flat line is gesturing, the line above that is vocalizations, we also have single words and then multiple words. Look at how vocalizations seems to peak around 18 months than declines – at that peak notice how single words is accelerating – the idea here is that children transition from one communication strategy to another and this tool – can capture it. Now, previously these four forms of communication were summed to create a total score. Consider how much important information is lost when these scores are summed. 

A major goal here is to identify inter-individual differences in intra-individual change in language development.<sup>[1](#nesselroade)</sup><sup>[,]()</sup><sup>[2](#preacher)</sup> Unlike traditional repeated-measures analysis of variance, Latent Growth Curve Models (LGMs) allow for a more accurate and flexible approach to analyzing repeated measures data by simultaneously modeling change in the means (fixed effects) and in the variance and covariance of initial level and change (random effects).<sup>[2](#preacher)</sup> We used LGMs to model individual differences in status and the rates of change from 6 to 36 months. The general tenability of the LGMs were assessed using alternative measures of model fit including: the Root-Mean-Square Error of Approximation (RMSEA), Non-Normed Fit Index (NNFI/TLI), and the Comparative Fit Index (CFI).  

<p align="center">
  <img width="300" height="300" src="/assets/img/lgm.png">
</p>

This figure illustrates an exemplary LGM model. The key growth parameters of interest are mean intercept (α<sub>[1]()</sub>), slope (α<sub>[2]()</sub>), and the associated variances (ψ<sub>[1,1]()</sub>, ψ<sub>[2,2]()</sub>) and covariance (ψ<sub>[2,1]()</sub>).

QQQ

<p align="center">
  <img width="450" height="500" src="/assets/img/ecimodel.png">
</p>

This diagram illustrates our final model. We estimated all of the change processes at the same time and evalauted predictive relations across a continuum of communication skills. This approach better captures the theoretical process of interest than I think we would get from classical approaches (simple regression, ANOVA, etc.) 

Limitations here include: complex to specify, less understood by others relative to classical statistical techniques, requires large(ish) samples, software is not user friendly, there is not one correct model (onus on you), among others. 


### Example 2. Psychometric measurement properties 
### Example 3. Intensive Longitudinal Data
QQQ

**References**  
<a name="nesselroade">1</a>: Nesselroade, J. R., & Baltes, P. B. (1979). Longitudinal research in the study of behavior and development. New York: Academic Press.
<a name="preacher">2</a>: Preacher, K., Zhang, Z., & Zyphur, M. (2015). Multilevel Structural Equation Models for Assessing Moderation Within and Across Levels of Analysis. Psychological Methods.


