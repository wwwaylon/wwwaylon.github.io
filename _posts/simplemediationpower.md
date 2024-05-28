---
layout: post
title: Understanding Mediation Power
subtitle: Mediation power tells you how likely your statistical test is to correctly detect a mediation effect when it's there.
#thumbnail-img: /assets/img/atrisk.png
#gh-repo: wwwaylon/beautiful-jekyll
#gh-badge: [star, fork, follow]
tags: [Power Mediation Simulation Markdown]
---

In statistical analysis, the concept of **mediation power** plays a pivotal role when investigating complex relationships between variables. Mediation power is a statistical measure that assesses the ability of a mediation analysis to detect a true mediation effect, if one exists. In this technical discussion, we'll delve into the mathematical underpinnings of mediation power and its significance in statistical research.

## The Statistical Framework

Mediation analysis involves a series of hypotheses:

- **Null Hypothesis (H0)**: There is no mediation effect; the third variable does not explain the relationship between the first variable (X) and the second variable (Y).
- **Alternative Hypothesis (Ha)**: There is a mediation effect; the third variable (M) partially or fully mediates the relationship between X and Y.

To assess mediation power, we rely on a significance test to determine whether we can reject the null hypothesis and support the alternative hypothesis.

## Mediation Power Formula

Mathematically, mediation power (often denoted as \(1 - \beta\)) can be expressed as follows:

\[1 - \beta = P(\text{Reject } H_0 | H_0 \text{ is False})\]

Here's what each component represents:

- \(1 - \beta\): The power of the test, i.e., the probability of correctly rejecting the null hypothesis when it is indeed false.
- \(P(\text{Reject } H_0 | H_0 \text{ is False})\): The conditional probability of rejecting the null hypothesis given that it is false.

## Factors Influencing Mediation Power

Mediation power depends on several critical factors:

1. **Sample Size (N)**: A larger sample size enhances power, allowing for a higher probability of detecting true mediation effects.

2. **Effect Sizes (a, b, c, c')**: Mediation power is influenced by the magnitudes of various effects in the mediation model:
   - **a**: The effect of the independent variable (X) on the mediator (M).
   - **b**: The effect of the mediator (M) on the dependent variable (Y), controlling for X.
   - **c**: The total effect of X on Y (without considering M).
   - **c'**: The direct effect of X on Y (after considering M).

![ExampleMediation](/assets/img/Mediation.tif)

3. **Significance Level ($\alpha$)**: The chosen significance level (e.g., $\alpha$ = 0.05) determines the threshold for statistical significance. More stringent thresholds reduce power.

4. **Statistical Methodology**: The choice of statistical tests and methods can impact mediation power. Some methods may be more sensitive to mediation effects.

## Enhancing Mediation Power

To improve the power of mediation analyses, researchers can consider the following strategies:

1. **Increase Sample Size**: Collecting a larger dataset can enhance power.

2. **Effect Size Maximization**: Understanding the magnitudes of a, b, c, and c' effects and aiming for larger effects can boost power.

3. **Optimal Significance Level**: Choose an appropriate significance level based on the research context.

4. **Sensitivity Analysis**: Utilize statistical tests and models that are highly sensitive to mediation effects.

5. **Robustness Checks**: Validate mediation findings by applying multiple statistical approaches.

In summary, mediation power is a fundamental concept in statistical research, quantifying the ability to detect true mediation effects in a dataset. Researchers must consider factors such as sample size, effect sizes, significance levels, and statistical methodology to optimize power, ensuring robust and reliable conclusions when exploring mediation relationships.


# Estimating Mediation Power in R

In statistical analysis, mediation refers to the process through which one variable mediates or explains the relationship between two other variables. This concept is crucial in various fields, including psychology, social sciences, and epidemiology, where researchers often need to understand the mechanisms underlying observed relationships.

In this blog post, we'll explore a piece of R code that performs a simple mediation analysis and generates power curves to assess the statistical power of the mediation model under different conditions.

## Setting up the Environment

```r
# Initialize variables and parameters
w = NULL  # We'll store results in this variable
mcmcReps <- 10000
seed <- 461981
powReps <- 2000
conf <- 95  # Confidence Level (%)
n_list = c(seq(50, 300, by = 10))  # Sample size
a_list = c(0.14, 0.20, 0.26, 0.30, 0.39)  # Values of 'a'
c_list = c(.39)  # Values of 'cprime'
SDX <- 1
SDM <- 1
SDY <- 1
```
This section initializes the environment and sets various parameters for the analysis. Notable variables include `n_list` (sample sizes), `a_list` (values of 'a'), `c_list` (values of 'cprime'), and standard deviations (`SDX`, `SDM`, `SDY`).

## Main Analysis Loop

```r
for (N in n_list){
  for (a in a_list){
    for (cprime in c_list){          
      b <- a
      
      # ... (rest of the loop)
      
      # Store results in the 'w' variable
      w = rbind(w, c(N, a, b, cprime, R2_a, R2_b, Pm, Mrat, power))
      
      # ... (rest of the loop)
    }
  }
}
```

This loop iterates through various combinations of sample sizes (N), values of 'a', and 'cprime.' It calculates statistical power for a simple mediation model, stores the results in the 'w' variable, and extracts other relevant statistics like R-squared (R2_a, R2_b), proportion mediated (Pm), and more.

## Generating Power Curves

```r
# Generate power curves
p <- ggplot(newdata, aes(x = n, y = Power, group = grpa, linetype = grpa)) +
  geom_line(size = 4) +
  geom_hline(yintercept = .8, linetype = 2) +
  # ... (rest of the plot code)
```

This part of the code uses the ggplot2 package to create power curves based on the calculated statistical power. The 'ggplot' object p is constructed, with x-axis representing sample size ('n') and y-axis representing power. The power curve is plotted for different values of 'a' (grpa) and includes a horizontal line at 0.8 to indicate a power threshold.

## Saving the Plot

```r
# Save the plot as an image
ggsave(paste0("/", format(Sys.time(), '%Y %B %d'), "mediation power curves.tiff"), path = myfiles, width = 60, height = 40, units = "cm", dpi=300)
```

Finally, the generated power curve is saved as a TIFF image for further analysis and visualization.

This R code showcases a straightforward approach to perform a mediation analysis and visualize the results using power curves. Researchers can adapt and extend this code to explore more complex mediation models and gain deeper insights into their data.

## Full code

```{r}
library(MASS)      # for the sampling
library(tidyverse) # for the plot
library(lavaan)    # for the R2
library(plyr)

#citation("lme4")
#citation()

# Add the font you need if it isn't listed. This is a temporary change and
# needs to be done for each new R session:
windowsFonts(`Segoe UI` = windowsFont('Segoe UI'))
myfiles <- dirname(rstudioapi::getSourceEditorContext()$path)

###------------------------------ simple mediation --------------------------------------
w = NULL # We want to store results in here

mcmcReps <- 10000
seed <- 461981
powReps <- 2000
conf <- 95 #----Confidence Level (%)
n_list = c(seq(50, 300, by = 10)) #sample size
#a_list = c(.17, .22, .26, .30, .33, .45, .50) #seq(.10, .50, by = .02))  
a_list = c(0.14, 0.20, 0.26, 0.30, 0.39)  #0.14, 0.26, 0.39, 0.59 
#b_list = c(.39) 
c_list = c(.39) 
SDX <- 1
SDM <- 1
SDY <- 1

for (N in n_list){
  for (a in a_list){
    # for (b in b_list){ #change to b_list   
    for (cprime in c_list){          
      
      b <- a
      
      print(paste0("N=", N, " b=", b, " Time=", Sys.time())) # track progress - this takes some time to run.
      
      # Create correlation matrix
      corMat <- diag(3)
      corMat[2,1] <- a
      corMat[1,2] <- a
      corMat[3,1] <- a*b + cprime
      corMat[1,3] <- a*b + cprime
      corMat[2,3] <- b + a*cprime
      corMat[3,2] <- b + a*cprime 
      
      # Get diagonal matrix of SDs
      SDs <- diag(c(SDX, SDM, SDY))
      
      # Convert to covariance matrix
      covMat <- SDs %*% corMat %*% SDs
      
      #--- OBJECTIVE == CHOOSE N, CALCULATE POWER -----------------------------------#
      
      # Create function for 1 rep
      powRep <- function(seed = 1234, Ns = N, covMatp = covMat){
        #set.seed(seed)
        
        dat <- mvrnorm(Ns, mu = c(0,0,0), Sigma = covMatp)
        
        # Run regressions
        m1 <- lm(dat[,2] ~ dat[,1])
        m2 <- lm(dat[,3] ~ dat[,2] + dat[,1])
        
        # Output parameter estimates and standard errors
        pest <- c(coef(m1)[2], coef(m2)[2])
        covmat <- diag(c((diag(vcov(m1)))[2],
                         (diag(vcov(m2)))[2]))
        
        # Simulate draws of a, b from multivariate normal distribution
        mcmc <- mvrnorm(1000, pest, covmat, empirical = FALSE)
        ab <- mcmc[, 1] * mcmc[, 2]
        
        # Calculate confidence intervals
        low <- (1 - (conf / 100)) / 2
        upp <- ((1 - conf / 100) / 2) + (conf / 100)
        LL <- quantile(ab, low)
        UL <- quantile(ab, upp)
        
        # Is rep significant?
        LL*UL > 0
      }
      
      set.seed(seed)
      # Calculate Power
      pow <- lapply(sample(1:2000, powReps), powRep)
      
      # Output results data frame
      df <- data.frame("Parameter" = "ab",
                       "N" = N,
                       "Power" = sum(unlist(pow)) / powReps)
      power<-df$Power              
      
      ###--------------- get R2 -------------------------###
      n_cov <- nrow(covMat)
      
      colnames(covMat) <- c("C1","C2","C3")
      rownames(covMat) <- c("C1","C2","C3")
      
      fitb <- lavaan::sem("C3 ~ C1 + C2", sample.cov = covMat,
                          sample.nobs = n_cov)
      R2_b <- inspect(fitb, 'r2') # r-squared
      
      fita <- lavaan::sem("C2 ~ C1", sample.cov = covMat,
                          sample.nobs = n_cov)
      R2_a <- inspect(fita, 'r2') # r-squared
      
      Pm <- (((a*b)/(cprime+(a*b)))*100) # as a %
      Mrat <- Pm/(1-Pm)
      
      w = rbind(w, c(N, a, b, cprime, R2_a, R2_b, Pm, Mrat, power))
      
      colnames(w) = c('n', 'a', 'b', 'cprime', 'r2a', 'r2b', 'Pm', 'Mrat', 'Power')  
      simdf <- as.data.frame(w) 
      simdf$grpa <- as.factor(round(simdf$r2a, 2))
      simdf$grpb <- as.factor(round(simdf$r2b, 2))
      simdf$grpc <- as.factor(round(simdf$Pm, 0)) # Proportion of total effect mediated (Pm)
      simdf$grpd <- as.factor(round(simdf$Mrat, 2)) # Ratio of indirect to the direct effect
      
      #         }
    }
  }
}

newdata <- simdf

p <- ggplot(newdata, aes(x = n, y = Power, group = grpa, linetype = grpa)) +  #or color = grp
  geom_line(size = 4) + #geom_line(aes(linetype=grp))+
  geom_hline(yintercept = .8, linetype = 2) + 
  # Add labels at the end of the line
  #geom_text(data = filter(newdata, n == min(n)),
  #          aes(label = paste0(grp)),
  #          hjust = .5, nudge_x = -7, size=6) +
  
  geom_text(data = filter(newdata, n == min(n)),
            aes(label = paste0(grpc, "% mediated")),
            hjust = .5, nudge_x = -25, size=11) +
  
  # Allow labels to bleed past the canvas boundaries
  coord_cartesian(clip = 'off') +
  
  scale_x_continuous(breaks=(seq(min(n_list), max(n_list), by = 50)), limits = c(min(n_list)-40, max(n_list))) +
  scale_y_continuous(breaks=(seq(0, 1, .10)), limits = c(0, 1)) +
  
  geom_vline(xintercept = as.numeric(round(simdf$n[which(diff(simdf$Power > .7999)!=0 & simdf$Pm == min(simdf$Pm) )],0)[1]) ) +  #Target sample size
  geom_point(aes(x=as.numeric(round(simdf$n[which(diff(simdf$Power > .7999)!=0 & simdf$Pm == min(simdf$Pm) )],0)[1]), y=.80), colour="black", size=6)+
  annotate("text", x = as.numeric(round(simdf$n[which(diff(simdf$Power > .7999)!=0 & simdf$Pm == min(simdf$Pm) )],0)[1])+12, y = .77, label = paste0("N = ", as.numeric(round(simdf$n[which(diff(simdf$Power > .7999)!=0 & simdf$Pm == min(simdf$Pm) )],0)[1])), size=10)+
  
  
  labs(x = "Total Sample Size", y = "Power")+
  theme_bw()

p + theme(legend.position='none',
    text = element_text(family = "Segoe UI"),
    plot.margin = unit(rep(1.2, 4), "cm"),
    plot.title = element_text(size = 20, 
                              color = "#22292F",
                              face = c("plain"),
                              margin = margin(b = 5)),
    plot.subtitle = element_text(size = 15, 
                                 margin = margin(b = 35)),
    plot.caption = element_text(size = 10,
                                margin = margin(t = 25),
                                color = "#606F7B"),
    panel.background = element_blank(),
    axis.text = element_text(size = 24, color = "#22292F"),
    axis.text.x = element_text(margin = margin(t = 5), size= c(32)),
    axis.text.y = element_text(margin = margin(r = 5), size= c(32)),
    axis.line = element_line(color = "#3D4852", size = 2),
    axis.title = element_text(size = 40),
    axis.title.y = element_text(margin = margin(r = 15),
                                hjust = 0.5),
    axis.title.x = element_text(margin = margin(t = 15),
                                hjust = 0.5),
    axis.ticks.length=unit(.35, "cm"),
    panel.grid.major = element_line(color = "#DAE1E7"),
    panel.grid.major.x = element_blank()
  )

ggsave(paste0("/", format(Sys.time(), '%Y %B %d'), "mediation power curves.tiff"), path = myfiles, width = 60, height = 40, units = "cm", dpi=300)
urlplot  <- paste0(myfiles, "/", format(Sys.time(), '%Y %B %d'), " mediation power curves.tiff")

```

## Pipe in resutls 

`r ftext("Power.", ft)` Our sample size ensures sufficient power to detect mediation effects that are both reasonably expected and practically meaningful. To evaluate power a series of Monte Carlo simulations with the bootstrap method to test mediation effects were specified for a 1-1-1 mediation model using the *wp.mc.sem.boot* function from the WebPower, version [0.8.7] [@webpower] package in R [@Rprogram]. Specifically, we conducted power for a longitudinal mediation model with 2,000 replications and 500 bootstrap samples. In this context statistical power was defined as the proportion of replications for which the estimated confidence intervals for the mediating effect did not contain 0 when a true mediating effect existed. We considered three values of $a$ and $b$: 0.26, 0.39, and 0.59 corresponding to a medium, medium-large, and large effect, respectively (Cohen???s $f^2$, where $f^2$ = $R^2$ / (1-$R^2$); see [@RN2363, p. 413-414]. The ICC (within-person correlation) was set to .60 and the number of repeated measures was set to 4. Results indicate power of 80% (1 - $\beta$ err prob) to reject the null hypothesis of no mediation effect given $\alpha$ = .05, an effect size of 0.39 or greater, and a sample size as low as *N* = 70. These findings replicate previous research that suggests power for 1-1-1 mediation models may be $\geq$ 80% given a sample size as small as *N* = 50 [@zhang2014monte] and research that indicates an ICC of .60 with 2, 3, and 4 observations will require *N* = 70, 53, 48, respectively,  for a medium effect [@pan2018sample, see Table 4]. 

$\Delta \chi^{2}$ test was used to determine the power of detecting a significant correlation between latent growth parameters. The focus of this power analysis was the slope covariance. As shown in  Figure 5, power curves were generated based on effect size ($r$) ranging from $r$ = `r min(corr_list)` to $d$ = `r max(corr_list)` and sample size ranging from `r min(simdf$n)` to `r max(simdf$n)`. Results indicate a model with $r$ as low as `r min(simdf$r[which(diff(simdf$Power > .7999)!=0)])` would achieve power of 80% (1 - $\beta$ err prob) to reject the null hypothesis of no association between slopes given a sample size of $N$ = `r round(min(simdf$n[which(diff(simdf$Power > .7999)!=0 & simdf$r == min(simdf$r[which(diff(simdf$Power > .7999)!=0)]))]),0)`. Given a medium effect of $r \ge$ .30, the proposed parallel process LGMs are sufficiently powered to detect significant change patterns over time between outcome measures. 


<br>

![ExampleMediationPower](/assets/img/mediation power curves.tiff)

<br>

