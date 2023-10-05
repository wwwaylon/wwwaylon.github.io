---
layout: post
title: Interpreting Mediation Results
subtitle: Interpreting mediation results can be both an art and a science. 
#thumbnail-img: /assets/img/atrisk.png
#gh-repo: wwwaylon/beautiful-jekyll
#gh-badge: [star, fork, follow]
tags: [Mediation Results Markdown]
---

In the world of statistical analysis, uncovering the intricate relationships between variables often involves conducting mediation analyses. These analyses provide insights into the mechanisms through which one variable influences another, mediated by a third variable. However, interpreting the results of a mediation analysis can be a challenging endeavor. In this blog post, we will embark on a journey to demystify the art of interpreting mediation results.

## Understanding the Mediation Model

Before we dive into interpretation, let's recap the fundamental components of a mediation model:

- **X (Independent Variable)**: The variable you believe has an effect on Y, either directly or indirectly.
- **Y (Dependent Variable)**: The outcome variable you are trying to explain or predict.
- **M (Mediator)**: The variable that comes between X and Y, helping to explain the relationship between them.

In a mediation model, you are typically interested in understanding the following relationships:

- **Path 'a'**: The effect of X on M (a direct effect).
- **Path 'b'**: The effect of M on Y, controlling for X (a direct effect).
- **Total Effect (c)**: The direct effect of X on Y without considering M.
- **Direct Effect (c')**: The effect of X on Y after accounting for the mediating effect of M.

Now that we've reviewed the basics, let's explore how to interpret the results of these paths.

## Interpreting Path 'a'

Path 'a' represents the direct effect of X on the mediator M. A positive 'a' indicates that as X increases, M also increases. Conversely, a negative 'a' suggests that as X increases, M decreases. The magnitude of 'a' signifies the strength of the relationship between X and M.

**Interpretation Example**: In a study examining the impact of education (X) on income (M), a positive 'a' implies that higher education levels are associated with higher income levels.

## Interpreting Path 'b'

Path 'b' represents the direct effect of the mediator M on the dependent variable Y, while controlling for the influence of X. A positive 'b' indicates that as M increases, Y also increases, holding X constant. A negative 'b' implies the opposite relationship. The magnitude of 'b' denotes the strength of the relationship between M and Y.

**Interpretation Example**: In a study investigating the role of job satisfaction (M) on job performance (Y), a positive 'b' suggests that higher job satisfaction is associated with better job performance, even after accounting for external factors like experience (X).

## Interpreting Total Effect (c) and Direct Effect (c')

- **Total Effect (c)**: This represents the direct effect of X on Y without considering the mediator M. It summarizes the overall influence of X on Y.
  
- **Direct Effect (c')**: This is the effect of X on Y after considering the mediating effect of M. It quantifies the remaining direct impact of X on Y, not mediated by M.

Interpreting these effects involves comparing them. If the magnitude of 'c'' is smaller than 'c', it indicates that part of the relationship between X and Y is mediated by M. In contrast, if 'c'' is similar in magnitude to 'c', it suggests that M has little to no mediating effect on the X-Y relationship.

**Interpretation Example**: In a study examining the relationship between physical activity (X) and heart health (Y) with weight loss (M) as a mediator, if 'c'' is significantly smaller than 'c', it implies that weight loss plays a substantial role in mediating the impact of physical activity on heart health.

## Assessing Significance

In addition to interpreting the magnitudes of 'a', 'b', 'c', and 'c'', it's crucial to assess their statistical significance. P-values can help determine whether these effects are likely to be real or could have occurred by chance. A small p-value (typically below 0.05) indicates statistical significance.

## Conclusion

Interpreting mediation results is both an art and a science. It requires a deep understanding of the underlying relationships between variables and careful consideration of the magnitudes and significance of various effects. By mastering the art of interpreting mediation results, researchers can gain valuable insights into the mechanisms at play in their data and make informed decisions based on their findings.



```r
library(semTools)
library(semPlot)
library(MASS)

a=0.852
b=-0.446
c_prime <- 0.490

var_X <- 43.658
var_M <- 71.040
var_Y <- 82.426

#--- labels ----#
X_lab <- "Sleep Deficiency (AIQ Total Score)"
M_lab <- "Executive Function (Cognitive Regulation)"
Y_lab <- "Self-Management Processes (Activation)"

rep=20000
conf=95
pest=c(a,b)
acov <- matrix(c(
  0.0295472,	-0.0021136,
-0.0021136,	0.0223262

),2,2)

#-------- end of input ----#

mcmc <- mvrnorm(rep,pest,acov,empirical=FALSE)
ab <- mcmc[,1]*mcmc[,2]
low=(1-conf/100)/2
upp=((1-conf/100)/2)+(conf/100)
LL=quantile(ab,low)
UL=quantile(ab,upp)
LL4=format(LL,digits=4)
UL4=format(UL,digits=4)

if (a > 0) {
  a_dir <- "more"
  a_pos <- "positive"
} else {
  a_dir <- "less"
  a_pos <- "negative"
}
if (b > 0) {
  b_dir <- "greater"
  b_pos <- "positive"
} else {
  b_dir <- "lower"
  b_pos <- "negative"
}

#if (sig > .05) {
#  sig_dir <- "not significant"
#} else {
#  sig_dir <- "significant"
#}


#----- Effect Sizes ---------#
Pm <- round(((abs(a)*abs(b))/(abs(c_prime)+((abs(a)*abs(b))))), 3) #-- Proportion of total effect mediated
Rm <- round(Pm/(1-Pm), 3) #--- ratio of indirect effect to direct effect
PSIE <- round((a*b)/var_Y,3) #--- Partially Standardized Indirect Effect
CSIE <- round(((a*b)*(var_X/var_Y)),3)

if (Rm >= 2) {
  Rm_dir <- paste0(round(Rm, 2), " times the size of the direct effect.")
} else if (Rm > 1 && Rm < 2) {
  Rm_dir <- paste0(round((Rm-1)*100, 2), "% more than the size of the direct effect.")
} else { 
  Rm_dir <- paste0(round((Rm)*100, 2), "% the size of the direct effect.")
}

if (PSIE > 1) {
  PCSIE_dir <- paste0("increase")
} else { 
  PCSIE_dir <- paste0("decrease")
}

```

## Results.

Results indicate `r X_lab` indirectly influenced `r Y_lab` through its effect on `r M_lab`. Specifically, there was a `r a_pos` effect of `r X_lab` on `r M_lab` (X???M; a = `r a`), and a `r b_pos` effect of `r M_lab` on `r Y_lab` (M???Y; b = `r b`). A 95% bootstrap confidence interval for the indirect effect (*ab*=`r round(a*b, 2)` ) based on `r rep` bootstrap samples did not include zero (`r round(LL, 2)` to `r round(UL, 2)`). There was no evidence that `r X_lab` influenced `r Y_lab` independent of its effect on `r M_lab` (c'= `r c_prime`, p > .05). 

```r

modelP <- paste0('
# direct effect
  Y ~ ', c_prime, '*X
# mediator
  M ~ ', a, '*X
  Y ~ ', b, '*M
# indirect effect (a*b)
  ab :=', a*b, '
# total effect
  total :=', c_prime, '+ (', a*b, ')
' 
)      

#------ Simulate data

Data <- simulateData(modelP, sample.nobs = 50000L)
Data$ID <- 1:nrow(Data)

fit <- sem(modelP, data = Data, se = "bootstrap", bootstrap = 200)

#summary(fit, standardized = TRUE, rsquare = TRUE)

#what="est",

semPaths(fit, intercepts = TRUE, edge.color = 'black', curvature = 1,
         sizeMan = 13, sizeInt = 12, sizeLat = 16, layout = "tree", rotation = 2, 
         structural = FALSE, edge.label.cex = 1.5, fixedStyle = c("black", 1), 
         freeStyle = c("black", 1), optimizeLatRes=TRUE, nCharNodes=0, 
         nodeLabels = c("Y", "M", "X"), shapeMan = "rectangle")

```

## Including Plots

```r

library(ggplot2)
df_ab<- as.data.frame(ab)
p <- ggplot(df_ab, aes(ab)) +
    geom_histogram(binwidth = 0.025, color = "black", fill = "skyblue") + 
    geom_vline(xintercept = a*b, size = 1.5, color="blue", linetype=1) +
    geom_vline(xintercept = LL, size = .75, color="red", linetype=4) +
    geom_vline(xintercept = UL, size = .75, color="green", linetype=4)+
  
    annotate("text", x = (a*b)-.15, y = 1500, label = paste0("ab = ", round(a*b, 2)), size=4) +
    annotate("text", x = (LL)-.15, y = 1500, label = paste0("LL = ", round(LL, 2)), size=4) +
    annotate("text", x = (UL)+.15, y = 1500, label = paste0("UL = ", round(UL, 2)), size=4) +
  
    #scale_x_continuous(breaks=(seq(min(500), max(n_list), by = 500))) +
    #scale_y_continuous(breaks=(seq(.1, 1, .10)), limits = c(0, 1)) +
  
   labs(x = paste0(conf,'% of bootstrap estiamtes are between ', round(LL, 3), ' and ', round(UL, 3) ), y = "Frequency", title="Distribution of Indirect Effect")+
              
  theme_bw()
            
  p + theme(legend.position='none', text = element_text(size=12))

  #ggsave("power_mlm2.png", path = "C:/Users/whowar/Desktop", width = 45, height = 25, units = "cm", dpi=700)
  #ggsave("power_mlm.tiff", path = "C:/Users/whowar/Desktop", width = 45, height = 25, units = "cm", dpi=700)
     
```


## Interpretation of Results. 

Two people who differ by one unit in **`r X_lab`** are estimated to differ by **`r round(a*b, 2)`** units in **`r Y_lab`** as a result of the tendency for those who have relatively more **`r X_lab`** to have `r a_dir`  **`r M_lab`** which in turn translates into `r  b_dir`  **`r Y_lab`**.


### Effect Size.

The indirect effect of **`r X_lab`** on **`r Y_lab`** is approximately **`r Rm_dir`** The proportion of total effect mediated is **`r round(((abs(a)*abs(b))/(abs(c_prime)+((abs(a)*abs(b))))), 3)*100`****%** (see Sobel, 1982). Results imply that **`r Y_lab`** is expected to `r PCSIE_dir` by **`r abs(PSIE)`** standard deviations for every one-unit increase in **`r  X_lab`** indirectly via **`r  M_lab`**. Said differently, results imply that **`r  Y_lab`** is expected to **`r PCSIE_dir`** by **`r abs(CSIE)`** standard deviations for every one standard deviation increase in **`r X_lab`** indirectly via **`r M_lab`**.


