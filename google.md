---
layout: page
title: Early Language Development
subtitle: Describe an interesting applied statistics problem that you have worked on.
---

Our vision is constrained by how we think about and use data. Too often we develop intricate theories about how the world works, which represent a lot of deep thinking about a topic, only to cut them up into smaller chunks that are then crammed into canned statistical procedures that were never designed to address the original question to begin with. I am committed to identifying such practices, providing modern demonstrations of their disadvantages, and explaining available alternatives, to discourage their further use. We often want to know how (mediation) and when (moderation) predictive relations hold or are strong versus weak or want more flexibility in examining change processes over time. 

Several years ago I worked as a quantitative methodologist for a large research center focused on developmental interventions to improve social and academic outcomes. 

My primary area of research was the development of novel statistical methods to better translate the kind of benefits that we can understand from an experimental simulation setting into real-world settings where the application is often not so good. We have to solve all kinds of technical challenges and limitations.

One of these projects focused on the progress monitoring of a new composite communication score to assess early language performance, quantify rates of development, and determine how individuals respond to intervention. What struck me was the enormous gap between the applied statistical methodology used in this space (e.g., t-tests, ANOVA) and the research questions of interest. 

I worked closely with the reseach team to focus on the questions. This is a handwritten path diagram from one of those meetings that demonstrates a complex theory of language development. 

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



* Greenwood, C. R., Buzhardt, J., Walker, D., McCune, L., & **Howard, W. J.** (2013). Advancing the construct validity of the Early Communication Indicator (ECI) for infants and toddlers: Equivalence of growth trajectories across two early head start samples. *Early Childhood Research Quarterly*. *28*(4), 743-758. [Impact Factor [2.364](https://www.journals.elsevier.com/early-childhood-research-quarterly)]  ([PDF](https://www.researchgate.net/publication/259133266_Advancing_the_construct_validity_of_the_Early_Communication_Indicator_ECI_for_infants_and_toddlers_Equivalence_of_growth_trajectories_across_two_early_head_start_samples),  [Cite](https://www.sciencedirect.com/science/article/pii/S0885200613000598), [Source Document](https://www.sciencedirect.com/science/article/pii/S0885200613000598))

* Greenwood, C. R., Walker, D., Buzhardt, J., **Howard, W. J.**, McCune, L., & Anderson, R. A., (2013). Evidence of a continuum in foundational expressive communication skills. *Early Childhood Research Quarterly*, 28, 540-554. [Impact Factor [2.364](https://www.journals.elsevier.com/early-childhood-research-quarterly)]  ([PDF](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4036115/pdf/nihms570538.pdf),  [Cite](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4036115/#), [Source Document](https://www.sciencedirect.com/science/article/pii/S0885200613000276))

using a novel composite total communication score ()

Progress monitoring is used to assess performance, quantify rates of development, and determine how individuals respond to intervention.



What I saw very early in this role was the world of both quantitative research and applied work around developmental indicators and effective interventions is dominated by, as you would expect, large datasets with lots of missing data. As I discovered when applying state of the art missing data techniques, sometimes large datasets really have trouble getting in the way of best practice, and sometimes they prevent these techniques from working at all. 

I came face to face with an enormous gap that continues to get larger between academic research on missing data on the one hand and our ability to use popular readily available software programs that are responsible for delivering these advanced techniques to researchers. 

If we don’t close that gap we really are exactly where we are today. We are honestly unable to realize the full potential of missing data theory in our work. And that’s what I want to focus on. Today, I am presenting a novel approach to handing missing data that I think is actually going to allow us to realize the potential, the promise, of decades of research on missing data using existing software. 




The purpose of this investigation was to strengthen the validity of the ECI through a detailed examination of growth and change in its four key skills in a large sample during the 6 to 36 month age span. We sought to improve our knowledge of the dynamic patterns of change occurring within and across ECI skills that in composite comprise the ECI total communication score. We also sought evidence of temporal ordering among adjacent skills or a continuum of growth in communication proficiency that might be used in future research as a basis for improving the predictive utility of the ECI in intervention decision making.

I developed a greater understanding of the ECI key skills (i.e., gestures, vocalizations, single- and multiple-word utterances) could lead to further improvements in the sensitivity and utility of the decisions made compared to ECIs composite total communication score.

The Early Communication Indicator (ECI) is such a measure for infants and toddlers, 6 to 42 months of age. Thus,





Advanced statistical techniques allow us to ask more sophisticated questions.







I sought to improve our knowledge of the dynamic patterns of change occurring within and across the underlying communcation skills (i.e., gestures, vocalizations, single- and multiple-word utterances) rather than focusing on the composite score


that in composite comprise the ECI total communication score. We also sought evidence of temporal ordering among adjacent skills or a continuum of growth in communication proficiency that might be used in future research as a basis for improving the predictive utility of the ECI in intervention decision making.


I developed a greater understanding of the ECI key skills (i.e., gestures, vocalizations, single- and multiple-word utterances) could lead to further improvements in the sensitivity and utility of the decisions made compared to ECIs composite total communication score.

The purpose of this investigation was to strengthen the validity of the ECI through a detailed examination of growth and change in its four key skills in a large sample during the 6 to 36 month age span.






**References**   
      <a name="greenwood">1</a>. Greenwood, C. R., Walker, D., Buzhardt, J., J Howard, W., McCune, L., & Anderson, R. (2013). Evidence of a Continuum in Foundational Expressive Communication Skills. Early childhood research quarterly, 28(3), 540–554.         
      <a name="sumscore">2</a>. McNeish, D., & Wolf, M. G. (2020). Thinking twice about sum scores. Behavior Research Methods, 1-19.    
      <a name="nesselroade">3</a>. Nesselroade, J. R., & Baltes, P. B. (1979). Longitudinal research in the study of behavior and development. New York: Academic Press.        
      <a name="preacher">4</a>. Preacher, K. J., Wichman, A. L., MacCallum, R. C., & Briggs, N. E. (2008). Latent growth curve modeling (No. 157). Sage.               
      <a name="todd">5</a>. Little, T. D. (2013). Longitudinal structural equation modeling. Guilford press.    


