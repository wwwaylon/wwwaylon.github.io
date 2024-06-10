#' ---
#' title: "SEM, Revealed."
#' output: 
#'   xaringan::moon_reader:
#'     seal: false
#'     chakra: https://remarkjs.com/downloads/remark-latest.min.js
#'     lib_dir: libs
#'     nature:
#' #      highlightStyle: tomorrow-night-bright
#' #      highlightLines: true
#'       highlightLanguage: r
#'       includePresenterNotes: true
#' #      countIncrementalSlides: false
#'     includes:
#'       in_header: header.html      
#'     css: css/xaringan.css
#' 
#' ---
#' 
## ----include=FALSE, purl=TRUE------------------------------------------------------------------------------------------

# specify the packages of interest
pkgs <- c(
  "tidyverse", "moderndive", "dslabs", "dplyr", "kableExtra",
  "infer", "janitor", "remotes", "knitr", "biosketchr",
  "usethis", "ggplot2", "fontawesome", "scholar"
)

# use this function to check if each package is on the local machine
# if a package is installed, it will be loaded
# if any are not, the missing package(s) will be installed and loaded
pkg_check <- function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE, repos = "https://cran.rstudio.com")
    library(x, character.only = TRUE)
  }
}
lapply(pkgs, pkg_check)

if (!require("fontawesome")) {
  remotes::install_github("rstudio/fontawesome")
}

if (!require("countdown")) {
  remotes::install_github("gadenbuie/countdown")
}


#' 

#' 
#' class: middle, center
#' 
#' # SEM, Revealed.
#' 
#' ## Modeling connections with latent variables and regression pathways.
#' 
#' `r knitr::include_graphics("images/seachildrens.jpg", dpi = 115)`
#' 
#' ### 
#' 
#' <span style="font-size: 80%;">Slides available at <https://tinyurl.com/CHBD-slides24></span>
#'  
#' <span style="font-size: 80%;">PDF slides at <https://tinyurl.com/CHBD-pdf24></span>
#' 
#' ---
#' 
#' name: my-info
#' class: middle, center
#' 
#' ## Waylon Howard | Biostatistician @ BEAR/CHBD
#' 
#' ---
#' 
#' name: bear
#' class: middle, left
#' 
#' <img src="images/BEARlogo.png" width="300px"/>
#' 
#' <br>    
#' 
#' <small>was founded with a collaborative spirit and lofty objective: to deliver comprehensive data management, advanced analytics, and expert statistical, epidemiologic, and qualitative support…</small> 
#' 
#' <br>
#' 
#' <small>By alleviating external consultants, designing studies in-house, and engaging investigators directly, we’re able to provide responsive, efficient, and high-quality data support at a fraction of the going cost.</small>
#' 
#' ???
#' Notes here
#' 
#' ---
#' 
#' name: biostats
#' class: middle, left
#' 
#' ## Biostatistics @ BEAR
#' 
#' <small>Supports stakeholders throughout SCRI by helping them make better decisions using data</small> 
#' 
#' ---
#' 
#' name: toc
#'   
#' # Topics
#' 
#' - [How to measure it?](#measure)    
#' - [Fitting a CFA model.](#cfa)    
#' - [Estimators.](#ml)    
#' - [Model Fit.](#fit)    
#' - [Statistical Code.](#software)
#' - [Annotated Results.](#results)
#' 
#' ---
#' 
#' layout: true
#' 
#' <div class="my-footer"><span>Slides at <u>tinyurl.com/CHBD-slides24</u> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; Return to <u><a style="color:White;" href="slide_deck.html#toc">Topic List</a></u></span></div>
#' 
#' ---
#' 
#' name: measure
#' 
#' class: inverse, center, middle
#' 
#' # Perceived Social Support
#' ## <span style="color:#FFCC66;">How to measure it?</span>
#' 
#' ---
#' 
#' ## Self-report questions
#' 
#' ***
#' 
#' 1. <span style="font-size: 80%;">My friends really try to help me.</span>
#' 1. <span style="font-size: 80%;">I can count on my friends when things go wrong.</span>
#' 1. <span style="font-size: 80%;">I can talk about my problems with my friends.</span>
#' 
#' ***
#' 
#' <br>
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

# Create a data frame
data <- data.frame(
VeryStronglyDisagree = c("1"),
StronglyDisagree = c("2"),
MildlyDisagree = c("3"), 
Neutral = c("4"), 
MildlyAgree = c("5"), 
StronglyAgree = c("6"),
VeryStronglyAgree = c("7")
)

colnames(data) <- c("Very Strongly Disagree", "Strongly Disagree", "Mildly Disagree", "Neutral", "Mildly Agree", "Strongly Agree", "Very Strongly Agree")

t1 <- kable(data, format = "html", align = "c") %>%
  kable_styling(position = "center")


#' 
#' `r t1`
#' 
#' <br>
#' 
#' <center><medium> Higher scores = More Perceived Social Support </medium></center>
#' 
#' ---
#' 
#' class: middle, left
#' 
#' 1. My friends really try to help me.
#' 
#' ***
#' 
#' <img class="rectangle" src="images/circleditem.png" width="800px"/>
#' 
#' <br>
#' 
#' .pull-left[
#' 
#' <span style="color:#3F4A13;"> $X_i$ </span> = <span style="color:#052147;"> $T_i$ </span> + (<span style="color:#BD8C00;"> $S_i$ </span> + <span style="color:black;"> $e_i$ </span>)
#' 
#' <br>
#' 
#' <span style="font-size: 70%;"><span style="color:#052147;"> $T_i$ </span> is the 'true' score</span><br>
#' 
#' <span style="font-size: 70%;"><span style="color:#BD8C00;"> $S_i$ </span> is item-specific, yet reliable</span><br>
#' 
#' <span style="font-size: 70%;"><span style="color:black;"> $e_i$ </span> is random error, or noise</span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 60%;">**Use the scoring procedure**: No measurement error (*always perfectly measured*), uniform effectiveness of items (*equal items*), invariance across groups and time.</span>
#'  
#' ]
#' 
#' ---
#' 
#' class: middle, center
#' 
#' <img class="rectangle" src="images/cfa1.png" width="800px"/>
#' 
#' ---
#' 
#' class: middle, center
#' 
#' <span style="color:#3F4A13;"> $X_i$ </span> = <span style="color:#052147;"> $T_i$ </span> + (<span style="color:#BD8C00;"> $S_i$ </span> + <span style="color:black;"> $e_i$ </span>)
#' 
#' <br>
#' 
#' <img class="rectangle" src="images/cfa23.png" width="800px"/>
#' 
#' ---
#' 
#' name: cfa
#' 
#' class: inverse, center, middle
#' 
#' # How do we get the true score?<br>
#' ## <span style="color:#FFCC66;">Fitting a CFA model.</span>
#' 
#' ---
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

# Create the data frame with the provided data
data <- data.frame(
  X1 = c(5.66, 4.90, 4.33),
  X2 = c(NA, 5.50, 4.38),
  X3 = c(NA, NA, 5.63)
)

# Assign row names to the data frame
rownames(data) <- c("X1", "X2", "X3")
colnames(data) <- c("X1", "X2", "X3")

# Round all numeric columns to 3 decimal places and replace NA with empty string
data[1:3] <- lapply(data[1:3], function(x) ifelse(is.na(x), "", format(round(x, 2), nsmall = 2)))

t01 <- kable(data, format = "html", align = "c", 
             col.names = c("X1", "X2", "X3")) %>%
  kable_styling(position = "center", font_size = 16, full_width = T, bootstrap_options = c("striped", "hover")) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = "80px", bold = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "125px", border_right = TRUE) %>%
  column_spec(3, width = "125px", border_right = TRUE) %>%
  column_spec(4, width = "125px")


# Create the data frame with the provided data using HTML entities for Greek letters
data <- data.frame(
  X1 = c("&lambda;<sub>11</sub> &lambda;<sub>11</sub> + &theta;<sub>11</sub>", "&lambda;<sub>11</sub> &lambda;<sub>21</sub>", "&lambda;<sub>11</sub> &lambda;<sub>31</sub>"),
  X2 = c("", "&lambda;<sub>21</sub> &lambda;<sub>21</sub> + &theta;<sub>22</sub>", "&lambda;<sub>21</sub> &lambda;<sub>31</sub>"),
  X3 = c("", "", "&lambda;<sub>31</sub> &lambda;<sub>31</sub> + &theta;<sub>33</sub>")
)

# Assign row names to the data frame
rownames(data) <- c("X1", "X2", "X3")

# Create the kable table with specified column widths
t02 <- kable(data, format = "html", align = "c", 
             col.names = c("X1", "X2", "X3"), escape = FALSE) %>%
  kable_styling(position = "center", font_size = 16, full_width = T, bootstrap_options = c("striped", "hover")) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = "40px", bold = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "150px", border_right = TRUE) %>%
  column_spec(3, width = "150px", border_right = TRUE) %>%
  column_spec(4, width = "150px")
  
# Create the data frame with the provided data using HTML entities for Greek letters
data <- data.frame(
  X1 = c("&psi;<sub>11</sub> + &theta;<sub>11</sub>", "&psi;<sub>11</sub> &lambda;<sub>21</sub>", "&psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X2 = c("", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>21</sub> + &theta;<sub>22</sub>", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X3 = c("", "", "&lambda;<sub>31</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub> + &theta;<sub>33</sub>")
)

# Assign row names to the data frame
rownames(data) <- c("X1", "X2", "X3")

# Create the kable table with specified column widths
t03 <- kable(data, format = "html", align = "c", 
             col.names = c("X1", "X2", "X3"), escape = FALSE) %>%
  kable_styling(position = "center", font_size = 16, full_width = T, bootstrap_options = c("striped", "hover")) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = "40px", bold = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "150px", border_right = TRUE) %>%
  column_spec(3, width = "150px", border_right = TRUE) %>%
  column_spec(4, width = "150px")


# Create the data frame with the provided data using HTML entities for Greek letters
data <- data.frame(
  X1 = c("(3-&lambda;<sub>21</sub>-&lambda;<sub>31</sub>) &psi;<sub>11</sub> (3-&lambda;<sub>21</sub>-&lambda;<sub>31</sub>) + &theta;<sub>11</sub>", "(3-&lambda;<sub>21</sub>-&lambda;<sub>31</sub>) &psi;<sub>11</sub> &lambda;<sub>21</sub>", "(3-&lambda;<sub>21</sub>-&lambda;<sub>31</sub>)&psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X2 = c("", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>21</sub> + &theta;<sub>22</sub>", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X3 = c("", "", "&lambda;<sub>31</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub> + &theta;<sub>33</sub>")
)

# Assign row names to the data frame
rownames(data) <- c("X1", "X2", "X3")

# Create the kable table with specified column widths
t04 <- kable(data, format = "html", align = "c", 
             col.names = c("X1", "X2", "X3"), escape = FALSE) %>%
  kable_styling(position = "center", font_size = 16, full_width = T, bootstrap_options = c("striped", "hover")) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = "40px", bold = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "150px", border_right = TRUE) %>%
  column_spec(3, width = "150px", border_right = TRUE) %>%
  column_spec(4, width = "150px")


#--- Full Martix Formula

# Create the data frame with the provided data using HTML entities for Greek letters
sigma <- data.frame(
  X1 = c("&lambda;<sub>11</sub> &psi;<sub>11</sub> &lambda;<sub>11</sub> + &theta;<sub>11</sub>", "&lambda;<sub>11</sub> &psi;<sub>11</sub> &lambda;<sub>21</sub>", "&lambda;<sub>11</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X2 = c("", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>21</sub> + &theta;<sub>22</sub>", "&lambda;<sub>21</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub>"),
  X3 = c("", "", "&lambda;<sub>31</sub> &psi;<sub>11</sub> &lambda;<sub>31</sub> + &theta;<sub>33</sub>")
  )

# Assign row names to the data frame
rownames(sigma) <- c("X1", "X2", "X3")

# Create the kable table with specified column widths
t10 <- kable(sigma, format = "html", align = "c", 
             col.names = c("X1", "X2", "X3"), escape = FALSE) %>%
  kable_styling(position = "center", font_size = 16, full_width = T, bootstrap_options = c("striped", "hover")) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = "40px", bold = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "150px", border_right = TRUE) %>%
  column_spec(3, width = "150px", border_right = TRUE) %>%
  column_spec(4, width = "150px")


#' 
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/cfa4.png" width="300px"/>
#' 
#' <span style="font-size: 65%;">
#' Estimated Parameters: **7** Observed Information: **6**<br>
#' </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 80%;">
#' **Matrix Formula:** <span style="color:#187EA1;"> $\Sigma = \Lambda \Psi \Lambda'+ \Theta$ </span> 
#' </span>
#' 
#' <span style="font-size: 50%;"> Σ = **Variance/Covariance Matrix**</span> <br> 
#' 
#' `r t01`
#' 
#' <span style="font-size: 50%;"> **Implied Variance/Covariance Matrix** </span> <br>
#' 
#' `r t10`
#'  
#' ]
#' 
#' <span style="font-size: 60%;"> *Underidentified*: $X + Y = 20$ </span>
#' 
#' ---
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 50%;">
#' Variance /Covariance Matrix<br>
#' </span>
#' 
#' `r t01`
#' 
#' <span style="font-size: 50%;">
#' **Just Identified.**<br>
#' </span>
#' 
#' `r t02`
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 60%;">Fix the latent variance to 1.0</span>
#' 
#' <img class="rectangle" src="images/setscale1.png" width="275px"/>
#'  
#' ]
#' 
#' ---
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 50%;">
#' Variance /Covariance Matrix<br>
#' </span>
#' 
#' `r t01`
#' 
#' <span style="font-size: 50%;">
#' **Just Identified.**<br>
#' </span>
#' 
#' `r t03`
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 60%;">Fix the loading to 1.0</span>
#' 
#' <img class="rectangle" src="images/setscale2.png" width="275px"/>
#'  
#' ]
#' 
#' ---
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 50%;">
#' Variance /Covariance Matrix<br>
#' </span>
#' 
#' `r t01`
#' 
#' <span style="font-size: 50%;">
#' **Just Identified.**<br>
#' </span>
#' 
#' `r t04`
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 60%;">Constrain loading to average 1.0</span>
#' 
#' <img class="rectangle" src="images/setscale3.png" width="325px"/>
#'  
#' ]
#' 
#' ---
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 50%;">
#' Variance /Covariance Matrix<br>
#' </span>
#' 
#' <img class="rectangle" src="images/cfa5.png" width="400px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/cfa6.png" width="275px"/>
#'  
#' ]
#' 
#' ---
#' 
#' name: ml
#' 
#' class: inverse, center, middle
#' 
#' # How do we get the numbers?<br>
#' ## <span style="color:#FFCC66;">Estimators.</span>
#' 
#' ---
#' 
#' class: middle, center
#' 
#' ## Maximum Likelihood
#' 
#' <span style="font-size: 80%;">
#' $L_i$ = <span style="color:#C8C5CD;"> $\frac {1}{\sqrt{2\pi\sigma^2}}$ e[-.5 </span> $\frac{(Y_i - \mu)^2}{\sigma^2}$  <span style="color:#C8C5CD;">]</span>
#' 
#' <br>
#' 
#' > <span style="font-size: 80%;">ML identifies the population parameters that are most likely given the observed data</span><br>
#' > <span style="font-size: 80%;">A likelihood (or log likelihood) function quantifies the fit of the data to the parameters</span><br>
#' > <span style="font-size: 80%;">ML requires a population distribution (normal)</span>
#' 
#' ---
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

# Create a data frame
data <- data.frame(
  ID = c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"),
  Score =  c("36.6", "41.8", "42.6", "43.1", "43.4", "44.2", "44.9", "46.3", "48.6", "49.0", "50.0", "51.6", "54.6", "54.8", "55.7", "57.2", "57.6", "60.3", "60.9", "65.3"),
  Li = c("0.00661212", "0.006725313", "0.006738201", "0.006745631", "0.006749858", "0.006760279", "0.006768379", "0.006781711", "0.006795269", "0.006796563", "0.006798419", "0.006797282", "0.006781547", "0.00677987", "0.006771351", "0.006753646", "0.006748188", "0.006703308", "0.006691451", "0.006584073")
)


colnames(data) <- c("Person ID", "Score", "Likelihood")

t2 <- kable(data, format = "html", align = "c") %>%
  kable_styling(position = "center", font_size = 12)


#' 
#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 50%;">
#' $L_i$ = <span style="color:#C8C5CD;"> $\frac {1}{\sqrt{2\pi\sigma^2}}$ e[-.5 </span> $\frac{(Y_i - \mu)^2}{\sigma^2}$  <span style="color:#C8C5CD;">]</span>
#' </span>
#' 
#' <br>
#' 
#' <span style="font-size: 70%;">Applying the density function gives the relative probability $(L_i)$ of each score from this normal distribution. </span> <br>
#' 
#' <br>
#' 
#' <span style="font-size: 60%;">Score $(\mu$ = 50.44, $\sigma$ = 58.68 $)$ </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 80%;">`r t2`</span>
#'  
#' ]
#' 
#' <br>
#' 
#' <center><medium> Largest relative probability is for ID 11 </medium></center>
#' 
#' ---
#' 
#' class: inverse, center, middle
#' 
#' <img class="rectangle" src="images/likelihood.png" width="800px"/>
#' 
#' ---
#' 
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

# Create a data frame
data <- data.frame(
  ID = c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"),
  HRQOL =  c("36.6", "41.8", "42.6", "43.1", "43.4", "44.2", "44.9", "46.3", "48.6", "49.0", "50.0", "51.6", "54.6", "54.8", "55.7", "57.2", "57.6", "60.3", "60.9", "65.3"),
  Li = c("0.00661212", "0.006725313", "0.006738201", "0.006745631", "0.006749858", "0.006760279", "0.006768379", "0.006781711", "0.006795269", "0.006796563", "0.006798419", "0.006797282", "0.006781547", "0.00677987", "0.006771351", "0.006753646", "0.006748188", "0.006703308", "0.006691451", "0.006584073"),
  LogLi = c("-5.0189", "-5.0019", "-5.0000", "-4.9989", "-4.9982", "-4.9967", "-4.9955", "-4.9935", "-4.9915", "-4.9913", "-4.9911", "-4.9912", "-4.9935", "-4.9938", "-4.9951", "-4.9977", "-4.9985", "-5.0052", "-5.0069", "-5.0231")
)


colnames(data) <- c("Person ID", "HRQoL", "Likelihood", "LogLikelihood")

t3 <- kable(data, format = "html", align = "c") %>%
  kable_styling(position = "center", font_size = 12)


#' 
#' class: middle, center
#' 
#' .pull-left[
#' 
#' <span style="font-size: 70%;">Multiply each $L_i$ to get sample likelihood. </span> <br>
#' <span style="font-size: 40%;">0.0000000000000000000000000000000000000000000378615</span>
#' 
#' <br>
#' 
#' <span style="font-size: 70%;">To avoid small numbers, we add the log of the likelihood. </span> <br>
#' <span style="font-size: 70%;">-99.9824</span>
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 80%;">`r t3`</span>
#'  
#' ]
#' 
#' <br>
#' 
#' <center><medium> Largest relative probability is for ID 11 </medium></center>
#' 
#' ---
#' 
#' class: inverse, center, middle
#' 
#' <img class="rectangle" src="images/loglikelihood.png" width="800px"/>
#' 
#' ---
#' 
#' 
## ----echo=FALSE, eval=F------------------------------------------------------------------------------------------------
## 
## # Create a matrix for the covariance table
## cov_matrix <- matrix(c(
##   0.64, NA, NA,
##   0.56, 0.81, NA,
##   0.48, 0.53, 0.77
## ), nrow = 3, byrow = TRUE)
## 
## # Convert the matrix to a data frame and add row/column names
## cov_df <- as.data.frame(cov_matrix)
## colnames(cov_df) <- c("X1", "X2", "X3")
## rownames(cov_df) <- c("X1", "X2", "X3")
## 
## # Create the table with kable
## t4 <- kable(cov_df, format = "html", align = "c") %>%
##   kable_styling(position = "center", font_size = 12)
## 
## 
## # Create a matrix for the covariance table
## cov_matrix2 <- matrix(c(
##   0.60, NA, NA,
##   0.52, 0.88, NA,
##   0.53, 0.58, 0.73
## ), nrow = 3, byrow = TRUE)
## 
## # Convert the matrix to a data frame and add row/column names
## cov_df2 <- as.data.frame(cov_matrix2)
## colnames(cov_df2) <- c("X1", "X2", "X3")
## rownames(cov_df2) <- c("X1", "X2", "X3")
## 
## # Create the table with kable
## t5 <- kable(cov_df2, format = "html", align = "c") %>%
##   kable_styling(position = "center", font_size = 12)
## 

#' 
#' name: fit
#' class: middle, center
#' 
#' ## Model Fit
#' 
#' <img class="rectangle" src="images/fit.png" width="800px"/>
#' 
#' <br>
#' 
#' <medium> Your data = Model-implied? </medium><br>
#' <span style="font-size: 50%;">
#' Chi-square $(\chi^2)$ = -2 * (Null Loglikelihood - Alternative Loglikelihood)
#' </span>
#' 
#' 
#' ---
#' 
#' class: middle, left
#' 
#' <img class="rectangle" src="images/modelfitlineRMSEA.png" width="700px"/>
#' 
#' .pull-left[
#' 
#' ## <span style="font-size: 80%;">Absolute Model Fit: </span>   
#' <span style="font-size: 70%;">*How far from perfect*: </span> <br> 
#' 
#' <span style="font-size: 70%;"> **RMSEA**, **SRMR** </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' > <span style="font-size: 60%;"> $>$ **.10** poor fit</span> <br>
#' > <span style="font-size: 60%;"> **.08 - .10** mediocre fit</span> <br>
#' > <span style="font-size: 60%;"> **.05 - .08** acceptable fit</span> <br>
#' > <span style="font-size: 60%;"> **.01 - .05** close fit</span> <br>
#' > <span style="font-size: 60%;"> **.00** exact fit</span>
#' 
#' ]
#' 
#' ---
#' 
#' class: middle, left
#' 
#' <img class="rectangle" src="images/modelfitlineCFI.png" width="700px"/>
#' 
#' .pull-left[
#' 
#' ## <span style="font-size: 80%;">Relative Model Fit: </span>   
#' <span style="font-size: 70%;">*How far from worst*: </span> <br> 
#' 
#' <span style="font-size: 70%;"> **TLI (NNFI)**, **CFI**... </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' > <span style="font-size: 60%;"> $<$ **.85** poor fit</span> <br>
#' > <span style="font-size: 60%;"> **.85-.90** mediocre fit</span> <br>
#' > <span style="font-size: 60%;"> **.90-.95**	acceptable fit</span> <br>
#' > <span style="font-size: 60%;"> **.95-.99** close fit</span> <br>
#' > <span style="font-size: 60%;"> **1.00** exact fit</span>
#' 
#' ]
#' 
#' <span style="font-size: 50%;">Also: Modification indices, Fitted residual matrix, Parameter estimates… </span>
#' 
#' ---
#' 
#' class: middle, left
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/modelfit.png" width="800px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <span style="font-size: 40%;">Chi-Square = -2[(-1365.848) - (-1351.359)] = <span style="color:#4CAF50;">**28.978**</span><br>
#' DF = $\frac{v(v+1)}{2}-p$ = $\frac{6(6+1)}{2}-13$ = <span style="color:#4CAF50;">**8** </span></span>
#' 
#' <br>
#' 
#' <span style="font-size: 40%;">RMSEA = $\sqrt{\frac{\frac{\chi^2_T - df_T}{N}}{df_T}}$ = $\sqrt{\frac{\frac{28.978 - 8}{379}}{8}}$ = <span style="color:#f44336;">**0.083**</span><br></span>
#' 
#' <br>
#' 
#' <span style="font-size: 40%;">CFI = $\frac{(\chi^2_0 - df_0)-(\chi^2_T - df_T)}{(\chi^2_0 - df_0)}$<br> 
#' = $\frac{(1939.234 - 15)-(28.978 - 8)}{(1939.234 - 15)}$ = <span style="color:#2196F3;">**0.989**</span><br></span>
#' 
#' <br>
#' 
#' <span style="font-size: 40%;">TLI = $\frac{(\frac{\chi^2_0} {df_0})-(\frac{\chi^2_T} {df_T})}{(\frac{\chi^2_0} {df_0})-1}$ = $\frac{(\frac{1939.234} {15})-(\frac{28.978} {8})}{(\frac{1939.234} {15})-1}$ = <span style="color:#FF9800;">**0.980**</span><br></span>
#' 
#' ]
#' 
#' ---
#' 
#' name: software
#' class: inverse, center, middle
#' 
#' # How do we estimate a model?<br>
#' ## <span style="color:#FFCC66;">Statistical software (Mplus, R, SAS).</span>
#' 
#' ---
#' 
#' name: mplus
#' class: middle, left
#' 
#' <center><span style="font-size: 120%;"> Sample CFA Mplus Code </span></center>
#' <br>
#' 
#' .pull-left[
#' 
#' <span style="font-size: 60%;">
#' <span style="color:#0004FF;">DATA:</span> FILE = mydata.dat;</span>
#' 
#' <span style="font-size: 60%;">
#' <span style="color:#0004FF;">VARIABLE:</span>  
#' NAMES = SUP1 SUP2 SUP3;<br>
#' </span>
#' 
#' <span style="font-size: 60%;">
#' <span style="color:#0004FF;">MODEL:</span>  
#' SUP by SUP1\* <br>
#' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SUP2<br> 
#' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SUP3;<br> 
#' SUP@1;
#' </span>
#' 
#' <span style="font-size: 60%;">
#' <span style="color:#0004FF;">OUTPUT:</span> TECH1;</span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/sup1.png" width="800px"/>
#'  
#' ]
#' 
#' ---
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

data <- data.frame(
  Parameter = c("SUP BY", "SUP1", "SUP2", "SUP3", 
                "Intercepts", "SUP1", "SUP2", "SUP3", 
                "Variances", "SUP", 
                "Resid Var", "SUP1", "SUP2", "SUP3"),
  Estimate = c(NA, 2.202, 2.226, 1.966, 
               NA, 3.287, 2.990, 3.322, 
               NA, 1.000, 
               NA, 0.812, 0.543, 1.768),
  SE = c(NA, 0.155, 0.150, 0.164, 
         NA, 0.199, 0.196, 0.198, 
         NA, 0.000, 
         NA, 0.183, 0.171, 0.243),
  Est_SE = c(NA, 14.246, 14.879, 11.990, 
             NA, 16.522, 15.239, 16.739, 
             NA, 999.000, 
             NA, 4.429, 3.176, 7.265),
  P_Value = c(NA, 0.000, 0.000, 0.000, 
              NA, 0.000, 0.000, 0.000, 
              NA, 999.000, 
              NA, 0.000, 0.001, 0.000)
)

# Round all numeric columns to 3 decimal places and replace NA with empty string
data[2:5] <- lapply(data[2:5], function(x) ifelse(is.na(x), "", format(round(x, 3), nsmall = 3)))

colnames(data) <- c("", "Estimate", "S.E.", "Est./S.E.", "P-Value")

t4 <- kable(data, format = "html", align = "l") %>%
  kable_styling(position = "center", font_size = 16)


#' 
#' class: middle, left
#' 
#' <center><span style="font-size: 120%;"> Sample CFA Mplus Estimates </span></center>
#' <br>
#' 
#' <img class="rectangle" src="images/mplusresult.png" width="800px"/>
#' 
#' ---
#' 
#' class: middle, left
#' 
#' <center><span style="font-size: 120%;"> Sample CFA Mplus Estimates </span></center>
#' <br>
#' 
#' .pull-left[
#' 
#' <span style="font-size: 60%;">MODEL RESULTS</span><br>
#' 
#' <span style="font-size: 80%;">`r t4`</span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' 
#' <img class="rectangle" src="images/sup2.png" width="800px"/>
#'  
#' ]
#' 
#' ---
#' 
#' 
## ----echo=FALSE--------------------------------------------------------------------------------------------------------

data <- data.frame(
  Parameter = c("SUP BY", "SUP1", "SUP2", "SUP3", 
                "Intercepts", "SUP1", "SUP2", "SUP3", 
                "Variances", "SUP", 
                "Resid Var", "SUP1", "SUP2", "SUP3"),
  Estimate = c(NA, 0.925, 0.949, 0.828, 
               NA, 1.382, 1.275, 1.400, 
               NA, 1.000, 
               NA, 0.143, 0.099, 0.314),
  SE = c(NA, 0.019, 0.017, 0.029, 
         NA, 0.117, 0.113, 0.118, 
         NA, 0.000, 
         NA, 0.035, 0.033, 0.049),
  Est_SE = c(NA, 48.366, 54.928, 28.129, 
             NA, 11.818, 11.318, 11.897, 
             NA, 999.000, 
             NA, 4.050, 3.011, 6.435),
  P_Value = c(NA, 0.000, 0.000, 0.000, 
              NA, 0.000, 0.000, 0.000, 
              NA, 999.000, 
              NA, 0.000, 0.003, 0.000)
)

# Round all numeric columns to 3 decimal places and replace NA with empty string
data[2:5] <- lapply(data[2:5], function(x) ifelse(is.na(x), "", format(round(x, 3), nsmall = 3)))

colnames(data) <- c("", "Estimate", "S.E.", "Est./S.E.", "P-Value")

t5 <- kable(data, format = "html", align = "l") %>%
  kable_styling(position = "center", font_size = 16)


#' 
#' class: middle, left
#' 
#' .pull-left[
#' 
#' <span style="font-size: 60%;">STDYX Standardization</span><br>
#' 
#' <span style="font-size: 80%;">`r t5`</span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' 
#' <img class="rectangle" src="images/sup3.png" width="800px"/>
#'  
#' ]
#' 
#' <span style="font-size: 60%;">Perceived Social Support (latent SUP) accounts for **85.6%**</span> <span style="font-size: 45%;"> $(0.925^2 = 0.856)$ </span> <span style="font-size: 60%;">of the variance in the indicator SUP1. Also, 0.856 + 0.143 = 1.0</span>
#' 
#' ---
#' 
#' name: r
#' class: middle, left
#' 
#' <center><span style="font-size: 120%;"> Sample CFA R (Lavaan) Code </span></center>
#' <br>
#' 
#' .pull-left[
#' 
#' <span style="font-size: 55%;"><span style="color:#0004FF;">library</span>(lavaan)<br>
#' m1 &larr; '<br> 
#' SUP =~ NA\*SUP1 + SUP2 + SUP3<br>
#' SUP ~~ 1*SUP<br>
#' '<br>
#' fit1 &larr; cfa(m1, data=mydata, std.lv=<span style="color:#0004FF;">T</span>)<br>
#' summary(fit1, standardized=<span style="color:#0004FF;">T</span>, fit.measures=<span style="color:#0004FF;">T</span>, rsquare=<span style="color:#0004FF;">T</span>)</span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' 
#' <img class="rectangle" src="images/sup1.png" width="800px"/>
#'  
#' ]
#' 
#' ---
#' 
#' class: center, middle
#' 
#' <center><span style="font-size: 120%;"> Sample CFA R (Lavaan) Estimates </span></center>
#' <br>
#' 
#' <img class="rectangle" src="images/laavanresult.png" width="800px"/>
#' 
#' ---
#' 
#' name: sas
#' class: middle, left
#' 
#' <center><span style="font-size: 120%;"> Sample CFA SAS (Proc Calis) Code </span></center>
#' <br>
#' 
#' .pull-left[
#' 
#' <span style="font-size: 60%;"><span style="color:#0004FF;">proc calis</span> <span style="color:#0004FF;">data</span>=mydata method=ml;<br>
#'   <span style="color:#0004FF;">path</span> SUP &rarr; SUP1 SUP2 SUP3 = ly1 - ly3;<br> 
#'   <span style="color:#0004FF;">pvar</span> SUP = 1,<br>
#'        SUP1 SUP2 SUP3 = te1 - te3;<br>
#' <span style="color:#0004FF;">run;</span>
#' </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' 
#' <img class="rectangle" src="images/sup1.png" width="800px"/>
#'  
#' ]
#' 
#' 
#' ---
#' 
#' class: center, middle
#' 
#' <center><span style="font-size: 120%;"> Sample CFA SAS (Proc Calis) Estimates </span></center>
#' <br>
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/calisresult1.png" width="400px"/>
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/calisresult2.png" width="400px"/>
#'  
#' ]
#' 
#' ---
#' 
#' name: sem
#' class: inverse, center, middle
#' 
#' # Advantages of CFA?<br>
#' ## <span style="color:#FFCC66;">observed vs. latent correlations.</span>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' <img class="rectangle" src="images/CFAcorr2.png" width="800px"/>
#' 
#' ---
#' 
#' 
#' class: middle, center
#' 
#' <img class="rectangle" src="images/CFAcorrEST.png" width="600px"/>
#' 
#' <img class="rectangle" src="images/corrEST.png" width="450px"/>
#' 
#' <span style="font-size: 45%;">CFA reveals subtle relationships between constructs that may be obscured by scale scores.</span>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' <img class="rectangle" src="images/scales1.png" width="400px"/>
#' 
#' <img class="rectangle" src="images/scalesCFA1.png" width="400px"/>
#'  
#' ---
#' 
#' class: center, middle
#' 
#' <img class="rectangle" src="images/scalescorr1.png" width="300px"/>
#' 
#' <img class="rectangle" src="images/scalesCFAcorr1.png" width="450px"/>
#' 
#' <span style="font-size: 50%;">Disattenuated correlation (controlling for measurement error and specific variance)</span>
#' 
#' ---
#' 
#' 
#' 
#' class: inverse, center, middle
#' 
#' # How about latent regression?<br>
#' ## <span style="color:#FFCC66;">Structural Equation Modeling.</span>
#' 
#' ---
#' 
#' class: middle, center
#' 
#' <img class="rectangle" src="images/sem.png" width="800px"/>
#' 
#' <span style="font-size: 45%;">CFA reveals subtle relationships between constructs that may be obscured by scale scores.</span>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' <span style="font-size: 120%;"> Latent vs. Manifest/Observed </span>
#' <br>
#' <br>
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/regression_demo.png" width="400px"/>
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/SEMest.png" width="400px"/>
#'  
#' ]
#' 
#' <span style="font-size: 48%;">Measurement error in the observed variables can reduce the accuracy of the regression model.</span><br>
#' 
#' <span style="font-size: 45%;"> Model Fit: χ2(24, n=144) = 36.14; RMSEA = .059(.000;.097) ; CFI = .980; TLI/NNFI = .970</span>
#' <br>
#' 
#' ---
#' 
#' 
#' class: inverse, center, middle
#' 
#' # Does the relationship between X and Y depend on Z?<br>
#' ## <span style="color:#FFCC66;">Moderation.</span>
#' 
#' ---
#' 
#' name: sas
#' class: middle, left
#' 
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/modmplus.png" width="500px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/moderation.png" width="500px"/>
#' 
#' ]
#' 
#' <span style="font-size: 50%;">Mplus code using the Latent Moderated Structural Equations (LMS) Method.</span>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' .pull-left[
#' 
#' <center><medium> Regular Moderation </medium></center>
#' 
#' <img class="rectangle" src="images/moderation_manifest.png" width="250px"/>
#' 
#' <span style="font-size: 48%;"> $R^2 = 0.11$ </span>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <center><medium> Latent Moderation </medium></center>
#' 
#' <img class="rectangle" src="images/moderation__latent.png" width="700px"/>
#' 
#' <span style="font-size: 48%;"> $R^2 = 0.46$ </span>
#' 
#' ]
#' 
#' <span style="font-size: 50%"> **Model differences**: In *regular moderation*, measurement error can inflate predictive effects (i.e., making them seem larger). *Latent moderation* provides more accurate estimates.</span>
#' 
#' ---
#' 
#' class: inverse, center, middle
#' 
#' # Does the effect of X on Y operate through M?<br>
#' ## <span style="color:#FFCC66;">Mediation.</span>
#' 
#' ---
#' 
#' class: middle, left
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/medmplus.png" width="800px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <center><medium> Latent Mediation </medium></center>
#' 
#' <img class="rectangle" src="images/latentmediation.png" width="800px"/>
#' 
#' ]
#' 
#' ---
#' 
#' class: inverse, center, middle
#' 
#' # Do I have enough power for this?<br>
#' ## <span style="color:#FFCC66;">SEM Power Analysis.</span>
#' 
#' ---
#' 
#' name: power
#' class: middle, center
#' 
#' <span style="font-size: 80%;"> Parameter Power </span>
#' <br>
#' <br>
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/montecarlo.png" width="300px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/montecarlo3.png" width="800px"/>
#'  
#' ]
#' 
#' <span style="font-size: 60%;"> 80% power for a correlation of at least -0.30 given *N* = 150. </span>
#' 
#' ---
#' 
#' name: 
#' class: middle, center
#' 
#' <span style="font-size: 80%;"> Model Power </span>
#' <br>
#' <br>
#' 
#' .pull-left[
#' 
#' <img class="rectangle" src="images/rmseapower.png" width="300px"/>
#' 
#' ]
#' 
#' .pull-right[
#' 
#' <img class="rectangle" src="images/rmseapower2.png" width="800px"/>
#'  
#' ]
#' 
#' <span style="font-size: 60%;"> 80% power for a CFA with at least 60 df given *N* = 85. </span>
#' 
#' ---
#' 
## ----eci, echo=FALSE, eval = F-----------------------------------------------------------------------------------------
## library(ggplot2)
## library(gridExtra)
## library(tidyverse)
## library(gganimate)
## library(directlabels)
## library(png)
## library(transformr)
## library(grid)
## library(magick)
## 
## eci <- read.csv(file = "images/eci_long.csv")
## eci$Type <- factor(eci$Type, levels = c("Gestures", "Vocalizations", "Single Words", "Multiple Words"))
## 
## theme_Publication <- function(base_size=24, base_family="sans") {
##   library(grid)
##   library(ggthemes)
##   (theme_foundation(base_size=base_size, base_family=base_family)
##     + theme(plot.title = element_text(face = "bold",
##                                       size = rel(1.2), hjust = 0.5),
##             text = element_text(),
##             panel.background = element_rect(colour = NA),
##             plot.background = element_rect(colour = NA),
##             panel.border = element_rect(colour = NA),
##             axis.title = element_text(face = "bold",size = rel(1)),
##             axis.title.y = element_text(angle=90,vjust =2),
##             axis.title.x = element_text(vjust = -0.2),
##             axis.text = element_text(),
##             axis.line = element_line(colour="black"),
##             axis.ticks = element_line(),
##             panel.grid.major = element_line(colour="#f0f0f0"),
##             panel.grid.minor = element_blank(),
##             legend.key = element_rect(colour = NA),
##             legend.position = "none",
##             legend.direction = "horizontal",
##             legend.key.size= unit(0.2, "cm"),
##             legend.margin = unit(0, "cm"),
##             legend.title = element_text(face="italic"),
##             plot.margin=unit(c(10,30,5,5),"mm"),
##             strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
##             strip.text = element_text(face="bold")
##     ))
## 
## }
## 
## p <-
##   ggplot(data = eci, aes(x= time, y=Rate, group=Type, colour=Type)) +
##   geom_line(size=3.5, show.legend = FALSE) +
##   ylab("Rate per Minute") + xlab("Time (in months)") +
##   scale_x_continuous(breaks = round(seq(min(eci$time), 54, by = 6), 1)) +
##   scale_y_continuous(breaks = round(seq(0, 6, by = 1), 2)) +
##   theme_Publication() +
##   geom_dl(aes(label=Type), method = list("last.points", cex = 2)) +
##   labs(title = 'ECI key skills at {frame_along} months') +
##   coord_cartesian(clip = 'off') +
##   transition_reveal(time) +
##   ease_aes('quadratic-in-out')
## 
## # Run animation
## animate(p, nframes=60, fps=5, width = 1200, height = 720, end_pause = 10, renderer = magick_renderer())
## 
## # Save animation
## #anim_save("C:/Users/waylon/Desktop/csp-2021/images/eci.gif", animation = last_animation())
## 

#' 
#' class: inverse, center, middle
#' 
#' #Thanks!
#' <br>
#' ## Any further questions?
#' 
#' ## <span style="color:#FFCC66;">Feel free to join the coding session.</span>
#' 
#' ---
#' 
#' 
