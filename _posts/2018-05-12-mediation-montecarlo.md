---
layout: post
title: Using SAS to run simulations in Mplus 
subtitle: Monte Carlo Power Simulation (simple mediation)
#gh-repo: wwwaylon/beautiful-jekyll
#gh-badge: [star, fork, follow]
tags: [SAS Mplus monte carlo power]
---

## Background
Unlike classical statistical approaches (e.g., t-test, ANOVA, simple regression) power estimation in the latent variable framework may depend on the statistical power to detect a poor fitting model as well as the ability to detect the significance of a particular parameter ([Little, 2013](https://books.google.com/books?hl=en&lr=&id=gzeCu3FjZf4C&oi=fnd&pg=PP1&dq=Longitudinal+Structural+Equation+Modeling&ots=i2jx-LaYvj&sig=yzGuM6GyJq3r4KjoPgdYhjzMu_Q#v=onepage&q=Longitudinal%20Structural%20Equation%20Modeling&f=false)). Power estimation related to the adequacy of the proposed model typically focuses on model fit indicies such as the root-mean-square error of approximation (RMSEA), a measure of misfit per degree of freedom ([MacCallum, Browne & Sugawara, 1996](https://pdfs.semanticscholar.org/6a60/8a87abb4ce4a097b9dcb2b2177ae14578510.pdf.)). To evaluate the statistical power for specific parameters across various conditions, Monte Carlo simulation studies are often used. Mplus provides extensive Monte Carlo simulation facilities for both data generation and analysis, however, it can be time-consuming to iterate through conditions such as sample size, effect size, missing data rate, etc. 

The following illustrates a simple way to use SAS or R to run a Monte Carlo power simulation across conditions in Mplus for a simple mediation model.   

|  Path diagram           | Model equation(s) |
:-------------------------:|:-------------------------:
![SimpleMed](/img/simpleMed_square.png) | ***M*** = *i*<sub>1</sub> + *a*X + e<sub>*M*</sub>  <br/> ***Y*** = *i*<sub>2</sub> + *b*M + c'X + e<sub>*Y*</sub> <br/>  <br/> **Indirect effect**: *ab* <br/> **Direct effect**: *c'*

## SAS IML Code

Generate Mplus code, run the code, and collect the results using Proc IML. 

First, define any macro variables by using a `%LET` statement.
~~~
%LET libpath = C:\Desktop\MonteCarlo_SIM_Simple_Mediation;
%LET rep = 1000;   *simulation reps;
%LET MIN_N = 100;  *sample size minimum;
%LET MAX_N = 120;  *sample size maximum;
%LET MIN_RSQ = 20; *effect size (R2) minimum (whole number only; e.g., 1 <-- .01);
%LET MAX_RSQ = 26; *effect size (R2) maximum (whole number only; e.g., 25 <-- .25);
%LET varX = .25;   *variance of X (.25 for binary variable with a 50/50 split);
%LET miss = .15;   *Percent MCAR missing data;
~~~

Next, a `%macro` statement is used to specify the name of the macro ("mplusSIM"). This macro takes arguments which are listed in parenthesis after the name of the macro (i.e., `samplesize=`, `varX=`, `aR2=`, `bR2=`, `cR2=`, and `miss=`) to pass macro variables into the code. Within mplusSIM macro variables are referenced with **&** (e.g., `&samplesize`). Here, varX is the variance of x, aR2 is the effect size (R2) for the regression of M on X, bR2 is the effect size for the regression of Y on M, and cR2 is the effect size for the regression of Y on X. miss is the percent of MCAR missingness (e.g., miss=.15 is 15% missing on M and Y).   
~~~ 
%macro mplusSIM(samplesize=, varX=, aR2=, bR2=, cR2=, miss= );  
~~~

Then, create any additional macro variables such as: **beta for M regressed on X** (`MonX`), **beta for Y on M** (`YonM`), and **beta for Y on X** (`YonX`) to achieve specificed effect size, implied **correlation of X and M** (`rXM`) based on MonX and the implied **residual variance of M** (`Em`), the **residual variance of Y** (`Ey`); or any summary statistics of interest such as the **effect size** (R2), percent of **missing data**, **proportion of total effect mediated** (`Pm`) and the **ratio of indirect to the direct effect** (`Rid`).
~~~
proc iml;
x mkdir "&&libpath";  
Em = (1-(&aR2/100)); 
  call symput('Em',left(char(Em))); 
MonX = sqrt(((1-Em)/&varX)); 
  call symput('MonX',left(char(MonX))); 
YonM = sqrt((&bR2/100)); 
  call symput('YonM',left(char(YonM))); 
YonX = sqrt((&cR2/100)/&varX); 
  call symput('YonX',left(char(YonX))); 
rXM = MonX*&varX; 
  call symput('rXM',left(char(rXM))); 
Ey = (1-(YonX**2*&varX)-(YonM**2)-(2*YonM*YonX*rXM));
  call symput('Ey',left(char(Ey))); 
Pm = ((MonX*YonM)/(YonX+(MonX*YonM)));   
  call symput('Pm',left(char(Pm))); 
Rid = (Pm/(1-Pm)); 
  call symput('Rid',left(char(Rid))); 
~~~

Now, create the Mplus .inp file using Proc IML referencing any macro variables.
~~~
file "&&libpath\med_&aR2._&bR2._&cR2._&samplesize._&miss._sim.inp";

put ("title: generate data");
put ("MONTECARLO:");
put ("names are x m y;        !Define variable names;");
put ("cutpoints = x (0);      !Define cutpoint to generate binary treatment;");
put ("NOBSERVATIONS = &samplesize ;");
put ("NREPS = &rep ;");
put ("SEED =  461981 ;");
put ("PATMISS = m(&miss) y(&miss) ;");
put ("PATPROBS = 1; ");
put;
put ("MODEL POPULATION:");
put ("[x@0];        !mean of x set to 0;");
put ("x*&varX;        !total variance of x;");
put ("[m-y@0];      !mean of m and y;");
put ("m*&Em; !residual variance of m;");
put ("y*&Ey; !residual variance of y;");
put ("m on x*&MonX; !a path;");
put ("y on m*&YonM; !b path;");
put ("y on x*&YonX; !câ path;");
put;
put ("MODEL:");
put ("[m-y@0];        !mean of m and y;");
put ("m*&Em; !residual variance of m;");
put ("y*&Ey; !residual variance of y;");
put ("m on x*&MonX; !a path;");
put ("y on m*&YonM; !b path;");
put ("y on x*&YonX; !câ path;");
put;
put ("MODEL INDIRECT: !MODEL INDIRECT statement to obtain mediated effect;");
put ("y IND x;        !Start and endpoint of mediation model defined here;");
put;
put(" output:");
closefile  "&&libpath\med_&aR2._&bR2._&cR2._&samplesize._&miss._sim.inp";
~~~

Then, run the Mplus .inp files 
~~~
X call "C:\Program Files\Mplus\mplus.exe" 
           "&&libpath\med_&aR2._&bR2._&cR2._&samplesize._&miss._sim.inp"
	          "&&libpath\med_&aR2._&bR2._&cR2._&samplesize._&miss._sim.out";
~~~

Next, read results from the MPLUS .out files into SAS
~~~
data PARAMS.TOTind;
infile "&&libpath\med_&aR2._&bR2._&cR2._&samplesize._&miss._sim.out";
input @'Tot indirect' Population Average StdDev SEavg MSE COVER POWER;
Run; 
~~~
End Macro
~~~
%mend mplusSIM;
~~~

SAS MACRO to iterate through various sample sizes and effect sizes 
~~~
%macro samplesize;
%do h=&MIN_N %to &MAX_N %by 10; 
  %do j=&MIN_RSQ %to &MAX_RSQ %by 1; 
%mplussyntaxpop(varX=.25, aR2=&j., bR2=&j., cR2=&j., samplesize=&h., miss=&miss.);
   %end;
 %end; 
~~~
End macro
~~~
%mend samplesize;
~~~
Run simulation
~~~
%samplesize; 
~~~

Plot the power curves (e.g., `sgplot`)
~~~
proc sgplot data=test; 
where R2 in (.20,.22,.24,.26) ; 
series y=power x=samplesize / group=R2 datalabel=pm1; 
xaxis label='Sample Size' values=(20 to 100 by 5); 
yaxis label='Power' grid offsetmax=.1 values=(0 to 1 by .10);
refline .80 / axis=y lineattrs=(pattern=dash) TRANSPARENCY = 0.5;
keylegend/ title='Effect size' location=inside position=bottomright down=5;
title 'Estimated Statistical Power for the Mediation Model by Sample Size and Effect Size';
INSET '% denotes proportion of total effect mediated'/ POSITION = BOTTOMleft BORDER;
run;
~~~

Example power curves    
![ExamplePowerCurves](/img/medpowercuves_square.png)


