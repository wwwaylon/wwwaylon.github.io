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

I often get diagrams like this and I <span style="color:red">love</span> to see them. What I want you to notice is that there is a lot going on here, we have multiple processes interacting in some really interesting ways. In this diagram you see the forest rather than the trees – which is to say that we are not focusing on one regression path or mean comparison here, rather we are looking into a complex system and all the effects are within the context of all the other pieces of the model. 

This is a plot<sup>[1](#greenwood)</sup> of some data collected for this project. 

<p align="center">
  <img width="460" height="300" src="/assets/img/eciplot.png">
</p>

Notice that each line represents a different form of communication – so the flat line is gesturing, the line above that is vocalizations, we also have single words and then multiple words. Look at how vocalizations seems to peak around 18 months than declines – at that peak notice how single words is accelerating – the idea here is that children transition from one communication strategy to another and this tool seems to capture it. 

The question is how to get from data collection with this tool to evalauting the theory of change illustrated above. Traditional approaches might include the creation of multiple-item scale scores (e.g., sum all the communication scales into a total score<sup>[2](#sumscore)</sup>) that are tested using ANCOVA or multilevel modeling - but where is this indicated in the theoretical diagram above. Consider how focusing on one communication measure at a time or an aggragate of all communication scores misses the point.    

In this case we want to identify inter-individual differences in intra-individual change in language development.<sup>[3](#nesselroade)</sup><sup>[,]()</sup><sup>[4](#preacher)</sup> Unlike traditional approaches latent growth curve modeling allowed for a more accurate and flexible approach to analyzing repeated measures data by simultaneously modeling change in the means (variable-centered) and in the variance and covariance of level and change (person-centered) across all forms of communication shown in the plot above - within the same model.<sup>[4](#preacher)</sup> This model allowed for testing of precursors and consequences of change and multiple group differences in these trajectories and predictive relationships. 

<p align="center">
  <img width="300" height="300" src="/assets/img/lgm.png">
</p>

This figure illustrates an exemplary LGM model. Here circles represent latent variables, squares are measured variables, trianges are constants, double headed arrows indicate vairances or covariances, and single headed arrows are regression weights. The key growth parameters of interest are mean intercept (α<sub>1</sub>), slope (α<sub>2</sub>), and the associated variances (ψ<sub>1,1</sub>, ψ<sub>2,2</sub>) and covariance (ψ<sub>2,1</sub>). These models allow us to explore the functional form of change over time, specify a spline model or other novel features to better approximate our theory of change. 

<p align="center">
  <img width="600" height="300" src="/assets/img/LGMfigure.png">
</p>

In this simple diagram<sup>[5](#todd)</sup>, notice that each black line represents an individual person that can have their own intercept and slope. Some start higher, some lower, some increase, some decrease, some are flat. Well, we can determine the average starting point (or mid-point or endpoint, etc.; α<sub>1</sub>) – denoted with a **<span style="color:green">green dot</span>** here and also capture the variability around that average intercept (ψ<sub>1,1</sub>; the **<span style="color:purple">purple line</span>**). Similarly, we can estimate an average slope (α<sub>2</sub>; the **<span style="color:red">red line</span>**) and variability around that slope (ψ<sub>2,2</sub>; the **<span style="color:orange">orange line</span>**). 

This basic framework provides a great opportunity for us to think carefully about the model and our measurement of the change process while considering important factors such as: partially missing data, unequally spaced time points, non-normally distributed or discretely scaled repeated measures, complex nonlinear or compound-shaped trajectories, time-varying covariates, and multivariate growth processes among other features.

<p align="center">
  <img width="450" height="500" src="/assets/img/ecimodel.png">
</p>

This diagram illustrates our final model.<sup>[1](#greenwood)</sup> We examined the pattern of growth within and between the four communication skills and found support for a unique pattern of growth and change within each skill trajectory in terms of age at skill onset and peaks in each trajectory defining an inflection point or change from acceleration to deceleration. While this path diagram represents the assessment of a complex contextual theory of change, there is not a single correct model here. The responsibility is on the scientist.  

### Example 2. Psychometric measurement properties 

While traditional methods (e.g., ANOVA, regression) assume all variables are free of measurement error (i.e., perfectly measured) and are unable to determine whether group or time-based change in an outcome measure is due to true change or changes in the structure or measurement of the test instrument over time, the CFA framework corrects for measurement error, provides estimates of the latent structure, and allows for a straightforward examination of measurement invariance. This is key because we need to determine that we are measuring the same constructs across groups of interest and that the construct meaning does not change as a function of time, otherwise we are not sure if differences or change are true or are just changes in the measurement tool. 

This figure illustrates an exemplary CFA model. As before circles represent latent variables, squares are measured variables, etc. 

### Example 3. Intensive Longitudinal Data

By measuring an individual repeatedly, we can construct a more complete picture of his or her behavior with reference to previous life experiences (temporal context), environment and surrounding circumstances (spatial context), and interactions with others (person context).

<p align="center">
  <img width="600" height="200" src="/assets/img/cfa.png">
</p>

QQQ

**References**   
      <a name="greenwood">1</a>. Greenwood, C. R., Walker, D., Buzhardt, J., J Howard, W., McCune, L., & Anderson, R. (2013). Evidence of a Continuum in Foundational Expressive Communication Skills. Early childhood research quarterly, 28(3), 540–554.         
      <a name="sumscore">2</a>. McNeish, D., & Wolf, M. G. (2020). Thinking twice about sum scores. Behavior Research Methods, 1-19.    
      <a name="nesselroade">3</a>. Nesselroade, J. R., & Baltes, P. B. (1979). Longitudinal research in the study of behavior and development. New York: Academic Press.        
      <a name="preacher">4</a>. Preacher, K. J., Wichman, A. L., MacCallum, R. C., & Briggs, N. E. (2008). Latent growth curve modeling (No. 157). Sage.               
      <a name="todd">5</a>. Little, T. D. (2013). Longitudinal structural equation modeling. Guilford press.    


