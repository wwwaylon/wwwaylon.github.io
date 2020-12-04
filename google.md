---
layout: page
title: Early Language Development
subtitle: Describe an interesting applied statistics problem that you have worked on.
---

Our vision is constrained by how we think about and use data. Too often we develop intricate theories about how the world works, which represent a lot of deep thinking about a topic, only to cut them up into smaller chunks that are then crammed into canned statistical procedures that were never designed to address the original question to begin with. I am committed to identifying such practices, providing modern demonstrations of their disadvantages, and explaining available alternatives, to discourage their further use. We often want to know how (mediation) and when (moderation) predictive relations hold or are strong versus weak or want more flexibility in examining change processes over time. 

Several years ago I worked as a quantitative methodologist for a large research center focused on how children develop and learn. One of the main ideas of this group was to translate social and deveopmental psychology theory into effective interventions to enhance social and academic outcomes.  

My primary area of research was the development and applicaion of novel statistical methods to better translate the kind of benefits that we can get from a conceptual simulation study into real-world settings where the application is often not so good. We had to solve all kinds of methodological problems and technical limitations (e.g., missing data; see Howard, Rhemtulla & Little, 2015) in a research space where over-simplified data analytic practices persist for decades. I found that advanced statistical techniques, particularly within the structural equation modeling framework, were really interesting and very challenging.  

One of our projects focused on progress monitoring of a new composite communication score to assess early language performance, quantify rates of development, and determine how individuals respond to intervention. What struck me was the enormous gap between the proposed statistical methods and the research questions. 

As a statistical consultant, I worked closely with the reseach team to focus on the theory. This is a path diagram drawn by the primary investigator from one of those meetings that demonstrates a deep theoretical vision for language development in this context and the many contextual factors that may influence these relations. 

<p align="center">
  <img width="700" height="600" src="/assets/img/napkin.jpg">
</p>

I often get diagrams like this and I <span style="color:red">love</span> to see them. What I want you to notice is that there is a lot going on here, we have multiple processes interacting in some really interesting ways. In this diagram you see the forest rather than the trees – which is to say that we are not focusing on one regression path or mean comparison here, rather we are looking into a complex system and all the effects are within the context of all the other pieces of the model. 

This is a plot<sup>[1](#greenwood)</sup> of some data collected for this project. 

<p align="center">
  <img width="460" height="300" src="/assets/img/eciplot.png">
</p>

Notice that each line represents a different form of communication – so the flat line is gesturing, the line above that is vocalizations, we also have single words and then multiple words. Look at how vocalizations seems to peak around 18 months than declines – at that peak notice how single words is accelerating – the idea here is that children transition from one communication strategy to another and this tool seems to capture it. 

The question is how to get from data collection with this tool to evalauting the theory of change illustrated above. Traditional approaches might include the creation of multiple-item scale scores (e.g., sum all the communication scales into a total score<sup>[2](#sumscore)</sup>) that are tested using ANCOVA or multilevel modeling - but where is this indicated in the theoretical diagram above? Consider how focusing on one communication measure at a time (i.e., gestures, vocalizations, single- and multiple-word utterances) or an aggragate of all communication scores misses the point.    

We wanted to identify inter-individual differences in intra-individual change in language development.<sup>[3](#nesselroade)</sup><sup>[,]()</sup><sup>[4](#preacher)</sup> Unlike traditional approaches latent growth curve modeling allowed for a more accurate and flexible approach to analyzing repeated measures data by simultaneously modeling change in the means (variable-centered) and in the variance and covariance of level and change (person-centered) across all forms of communication shown in the plot above - within the same model.<sup>[4](#preacher)</sup> This model allowed for testing of precursors and consequences of change and multiple group differences in these trajectories and predictive relationships. 

<p align="center">
  <img width="300" height="300" src="/assets/img/lgm.png">
</p>

This figure illustrates an exemplary LGM model. Here circles represent latent variables, squares are measured variables, trianges are constants, double headed arrows indicate vairances or covariances, and single headed arrows are regression weights. The key growth parameters of interest are mean intercept (α<sub>1</sub>), slope (α<sub>2</sub>), and the associated variances (ψ<sub>1,1</sub>, ψ<sub>2,2</sub>) and covariance (ψ<sub>2,1</sub>). These models allow us to explore the functional form of change over time, specify spline parallel process models or other novel features to better approximate our theory of change. 

<p align="center">
  <img width="600" height="300" src="/assets/img/LGMfigure.png">
</p>

In this simple diagram<sup>[5](#todd)</sup>, notice that each black line represents an individual that can have their own intercept and slope. Some start higher, some lower, some increase, some decrease, some are flat. Well, we can determine the average starting point (or mid-point or endpoint, etc.; α<sub>1</sub>) – denoted with a **<span style="color:green">green dot</span>** here and also capture the variability around that average intercept (ψ<sub>1,1</sub>; the **<span style="color:purple">purple line</span>**). Similarly, we can estimate an average slope (α<sub>2</sub>; the **<span style="color:red">red line</span>**) and variability around that slope (ψ<sub>2,2</sub>; the **<span style="color:orange">orange line</span>**). 

This basic framework provides a great opportunity for us to think carefully about the model and our measurement of the change process while considering important factors such as: missing data, unequally spaced time points, non-normally distributed or discretely scaled repeated measures, complex nonlinear or compound-shaped trajectories, time-varying covariates, and multivariate growth processes among other features.

<p align="center">
  <img width="450" height="500" src="/assets/img/ecimodel.png">
</p>

This diagram illustrates our final model.<sup>[1](#greenwood)</sup> The interesting applied statistics problem here was the application of advanced statistical techniques to ask more sophisticated questions and tell more compelling stories. 

Notice how this single model reflects the theoretical model illustrated above. We simultaniously tested the conceptual relations of interest such as the dynamic patterns of change occurring within and across the underlying communcation skills (i.e., gestures, vocalizations, single- and multiple-word utterances). Rather than focusing on the over-simplified composite score, we evaluated ideas about the temporal ordering among adjacent skills and continuum of growth in communication proficiency to improve intervention decision making. While this model represents a great solution in terms of model fit and theoretical importance, there is not a single correct model here. The responsibility is on the scientist to design and explain the model rather than to try to fit these ideas into an outdated statistical test (e.g., composite score mean differences).  

**For further reading:** 

* Greenwood, C. R., Buzhardt, J., Walker, D., McCune, L., & **Howard, W. J.** (2013). Advancing the construct validity of the Early Communication Indicator (ECI) for infants and toddlers: Equivalence of growth trajectories across two early head start samples. *Early Childhood Research Quarterly*. *28*(4), 743-758. [Impact Factor [2.364](https://www.journals.elsevier.com/early-childhood-research-quarterly)]  ([PDF](https://www.researchgate.net/publication/259133266_Advancing_the_construct_validity_of_the_Early_Communication_Indicator_ECI_for_infants_and_toddlers_Equivalence_of_growth_trajectories_across_two_early_head_start_samples),  [Cite](https://www.sciencedirect.com/science/article/pii/S0885200613000598), [Source Document](https://www.sciencedirect.com/science/article/pii/S0885200613000598))

* Greenwood, C. R., Walker, D., Buzhardt, J., **Howard, W. J.**, McCune, L., & Anderson, R. A., (2013). Evidence of a continuum in foundational expressive communication skills. *Early Childhood Research Quarterly*, 28, 540-554. [Impact Factor [2.364](https://www.journals.elsevier.com/early-childhood-research-quarterly)]  ([PDF](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4036115/pdf/nihms570538.pdf),  [Cite](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4036115/#), [Source Document](https://www.sciencedirect.com/science/article/pii/S0885200613000276))

* **Howard, W. J.**, Rhemtulla, M., & Little, T. D. (2015). Using principal component analysis (PCA) to obtain auxiliary variables for missing data in large data sets. *Multivariate Behavioral Research*, *50*(3), 285-299. [Impact Factor [3.691](https://www.tandfonline.com/toc/hmbr20/current)]  ([PDF](https://www.researchgate.net/profile/Todd_Little/publication/277974497/inline/jsViewer/558b095308aee99ca9ca3dc1),  [Cite](https://www.tandfonline.com/action/showCitFormats?doi=10.1080%2F00273171.2014.999267), [Source Document](https://www.tandfonline.com/doi/abs/10.1080/00273171.2014.999267))   
