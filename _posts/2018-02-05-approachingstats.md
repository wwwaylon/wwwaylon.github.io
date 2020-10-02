---
layout: post
title: Thinking about and approaching statistics
subtitle: beyond classical methods
#cover-img: /assets/img/path.jpg
thumbnail-img: /assets/img/napkin.jpg
#share-img: /assets/img/path.jpg  
tags: [modern methods, statistics]
---

I am a psychologist by training. My PhD is in quantitative psychology, which means that I’m trained in research methods, statistics and measurement as it’s applied in the social, behavioral, and health sciences. I have a number of areas that I have worked in over the last several years, mostly pertaining to longitudinal latent variable modeling; so I’ve done a lot of invariance testing and growth curve modeling. I’ve also devoted a lot of time to statistical consulting where I provide responsive, efficient, and high-quality analytical support. To me this personal mission statement means collaborating with investigators on all phases of their research so that important theoretical innovations and ultimately the impact of the work are not limited by statistical ability. 

> I believe a researcher’s vision can be constrained by how they think about and use data. It is tough to watch researchers develop intricate theories about how the world works, which represent a lot of deep thinking about a topic, only to cut them up into smaller chunks that are then crammed into canned statistical procedures that were never designed to address the original question to begin with. Advanced statistical techniques allow us to ask more sophisticated questions.

This is a handwritten path diagram that demonstrates a lot of deep thinking about a topic. 

![napkin](/assets/img/napkin.jpg "A cool napkin diagram")

I often get diagrams like this and I love to see them. What I want you to notice is that there is a lot going on here, we have multiple processes interacting in some really interesting ways. In this diagram you see the forest rather than the trees – which is to say that we are not focusing on one regression path or mean comparison here, rather we are looking into a complex system and all the effects are within the context of all the other pieces of the model. 

This is a plot of some data collected for this project. 

![eciplot](/assets/img/eciplot.png "Greenwood, C. R., Walker, D., Buzhardt, J., Howard, W. J., McCune, L., & Anderson, R. A., (2013). Evidence of a continuum in foundational expressive communication skills. Early Childhood Research Quarterly, 28, 540-554.")

Notice that each line represents a different form of communication – so the flat line is gesturing, the line above that is vocalizations, we also have single words and then multiple words. Look at how vocalizations seems to peak around 18 months than declines – at that peak notice how single words is accelerating – the idea here is that children transition from one communication strategy to another and this tool – can capture it. 

Now, previously these four forms of communication were summed to create a total score. Consider how much important information is lost when these scores are summed. 

A major goal here is to identify inter-individual differences in intra-individual change in language development.<sup>[1](#nesselroade)</sup><sup>[,]()</sup><sup>[2](#preacher)</sup> Unlike traditional repeated-measures analysis of variance, Latent Growth Curve Models (LGMs) allow for a more accurate and flexible approach to analyzing repeated measures data by simultaneously modeling change in the means (fixed effects) and in the variance and covariance of initial level and change (random effects).<sup>[2](#preacher)</sup> We used LGMs to model individual differences in status (intercept variance) and the rates of change (slope variance) from 6 to 36 months. The general tenability of the LGMs were assessed using alternative measures of model fit including: the Root-Mean-Square Error of Approximation (RMSEA), Non-Normed Fit Index (NNFI/TLI), and the Comparative Fit Index (CFI). This figure illustrates an exemplary LGM model. The key growth parameters of interest are mean intercept, slope (α<sub>[1]()</sub> ), and the associated variances and covariance (ψ_44 〖,ψ〗_(55 ) "," ψ_54 )

![lgm](/assets/img/lgm.png "exemplary LGM model")

QQQ

References
<a name="nesselroade">1</a>: Nesselroade, J. R., & Baltes, P. B. (1979). Longitudinal research in the study of behavior and development. New York: Academic Press.
<a name="preacher">1</a>: Preacher, K., Zhang, Z., & Zyphur, M. (2015). Multilevel Structural Equation Models for Assessing Moderation Within and Across Levels of Analysis. Psychological Methods.


