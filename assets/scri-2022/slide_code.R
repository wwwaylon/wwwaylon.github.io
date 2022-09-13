#' ---
#' title: "Thinking About and Approaching Statistics"
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
#' ---
#' 
#' 
## ----include=FALSE, purl=TRUE----
# specify the packages of interest
pkgs <- c(
  "tidyverse", "moderndive", "dslabs",
  "infer", "janitor", "remotes", "knitr",
  "usethis"
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

library(dplyr)
#remotes::install_github("tysonstanley/biosketchr")
library(biosketchr)
library(scholar)
#remotes::install_github("mitchelloharawild/icons")
# download_fontawesome()
#library(icons)

library(ggplot2)
library(gridExtra)
library(tidyverse)
library(gganimate)
library(directlabels)
library(png)
library(transformr)
library(grid)
library(magick)
library(ggthemes)


#' 

#' 
#' class: middle, center
#' 
#' # Thinking About and Approaching Statistics
#' 
#' ## Waylon Howard, PhD
#' 
#' `r knitr::include_graphics("images/Childrens-logo.png", dpi = 275)`
#' 
#' ### Slides available at <http://tinyurl.com/CHBD-slides> 
#' 
#' ### PDF slides at <http://tinyurl.com/CHBD-pdf>
#' 
#' ???
#' 
#' Good morning, before we begin please note that you can find the link to the HTML version of my slides as well as the PDF version here. I've also embedded links to additional content. 
#' 
#' ---
#' 
#' name: my-info
#' class: middle
#' 
#' <h5></h5>
#' 
#' .pull-left[
#'   <img class="circle" src="images/avatar-icon.png" width="150px" height="156px">
#'   
#'   <small>Waylon Howard </small> <br>
#'   <small>Principal Biostatistician </small> <br>
#'   <br>
#'   [<img src="images/BEAR_logo.png" width="325px"/>](https://redcap.seattlechildrens.org/surveys/?s=M9HL8L8WWT)
#'   
#' <br>
#' 
#' <small>`r fa("linkedin")` [@waylon-howard](https://www.linkedin.com/in/waylon-howard/)</small>
#' 
#' <small>`r fa(name = "github")` 
#' [@wwwaylon](https://github.com/wwwaylon)</small>
#' 
#' <small>`r fa(name = "link")`
#' [wwwaylon.github.io](https://wwwaylon.github.io/)</small>  
#' 
#' ]
#' 
#' .pull-right[
#' 
#'   <medium><span style="color: #EC804E">Education</span></medium>
#'   <br>
#'     <small>Ph.D., Quantitative Psychology</small>
#'   <small>University of Kansas (2012) Advisor: [Todd D. Little](https://scholar.google.com/citations?user=T-dKKGkAAAAJ&hl=en)</small>
#'   <br><br>
#' 
#'   <medium><span style="color: #EC804E">Mission </span></medium>
#'   <br>
#' 
#' <small>To provide comprehensive data management, analytics, and statistical, epidemiologic, and qualitative expertise.</small>    
#' - <small>[Data analytics](https://child.seattlechildrens.org/research/center_support_services/research_integration_hub/clinical_research_cores/biostatistics_epidemiology_and_analytics_in_research_bear/#dataanalytics/)</small>     
#' - <small>[Biostats & epidemiology](https://child.seattlechildrens.org/research/center_support_services/research_integration_hub/clinical_research_cores/biostatistics_epidemiology_and_analytics_in_research_bear/#biostatistics/)</small>     
#' - <small>[Data management](https://child.seattlechildrens.org/research/center_support_services/research_integration_hub/clinical_research_cores/biostatistics_epidemiology_and_analytics_in_research_bear/#datamanagement/)</small>  
#' - <small>[Resh Int. Hub admin metrics](https://child.seattlechildrens.org/research/center_support_services/research_integration_hub/clinical_research_cores/biostatistics_epidemiology_and_analytics_in_research_bear/#rih/)</small> 
#' 
#' ]
#' 
#' ???
#' My name is Waylon Howard and I'm a Quantitative Psychologist, which means that I'm trained in research methods, statistics, and measurement as applied in the social and behavioral and health sciences. My role within SCRI is a Principal Biostatistician within the BEAR group with a CHBD emphasis. BEAR's mission is to provide responsive, efficient, and high quality analytical support across data analytics, biostatistics, data management, and Research Integration Hub metrics.   
#' 
#' ---
#' 
#' class: middle, center
#' 
#' ## Is this outcome **significant**?
#' 
#' --
#' 
#' ## Different question: 
#' 
#' --
#' 
#' ## <span style="color: #EC804E">**How**</span> and <span style="color: #EC804E">**when**</span> is this outcome **significant**?
#' 
#' ???
#' Often when I'm approached for support it has to do with research design or statistical analysis when the goal is to determine if an outcome is significant or not. 
#' 
#' But I'm really passionate about a different type of question.
#' 
#' Our vision of research is often constrained by how we think about and use data. Too often we develop intricate theories about how the world works, which represent a lot of deep thinking about a topic, only to cut them up into smaller chunks that are then crammed into canned statistical procedures that were never designed to address the original question to begin with. I am committed to identifying such practices, providing modern demonstrations of their disadvantages, and explaining available alternatives. We often want to know how (mediation) and when (moderation) predictive relations hold or are strong versus weak or want more flexibility in examining change over time. 
#' 
#' ---
#' 
#' name:mot-exa
#' 
#' class: inverse, center, middle
#' 
#' # Motivating example
#' 
#' 
#' ???
#' Let me show you what I mean.
#' 
#' ---
#' 
#' <img src="images/napkin.jpg" style="width: 720px"/>
#'     
#' ???
#' I often get diagrams like this and I love to see them. What I want you to notice is that there is a lot going on here, we have multiple processes interacting in some really interesting ways. In this diagram you see the forest rather than the trees - which is to say that we are not focusing on one regression path or mean comparison here, rather we are looking into a complex system and all the effects are within the context of all the other pieces of the model.
#'   
#' ---
#' 
#' class: center, middle
#' 
#' ## Example: <span style="color: #EC804E">*Language Development*</span>
#' 
## ----eci, echo=FALSE---------

eci <- read.csv(file = "images/eci_long.csv")
eci$Type <- factor(eci$Type, levels = c("Gestures", "Vocalizations", "Single Words", "Multiple Words"))

theme_Publication <- function(base_size=24, base_family="sans") {

  (theme_foundation(base_size=base_size, base_family=base_family)
    + theme(plot.title = element_text(face = "bold",
                                      size = rel(1.2), hjust = 0.5),
            text = element_text(),
            panel.background = element_rect(colour = NA),
            plot.background = element_rect(colour = NA),
            panel.border = element_rect(colour = NA),
            axis.title = element_text(face = "bold",size = rel(1)),
            axis.title.y = element_text(angle=90,vjust =2),
            axis.title.x = element_text(vjust = -0.2),
            axis.text = element_text(), 
            axis.line = element_line(colour="black"),
            axis.ticks = element_line(),
            panel.grid.major = element_line(colour="#f0f0f0"),
            panel.grid.minor = element_blank(),
            legend.key = element_rect(colour = NA),
            legend.position = "none",
            legend.direction = "horizontal",
            legend.key.size= unit(0.2, "cm"),
            legend.spacing = unit(0, "cm"),
            legend.title = element_text(face="italic"),
            plot.margin=unit(c(10,30,5,5),"mm"),
            strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
            strip.text = element_text(face="bold")
    ))
  
}

p <-  
  ggplot(data = eci, aes(x= time, y=Rate, group=Type, colour=Type)) +
  geom_line(size=9, show.legend = FALSE) +
  ylab("Rate per Minute") + xlab("Time (in months)") + 
  scale_x_continuous(breaks = round(seq(min(eci$time), 54, by = 6), 1)) + 
  scale_y_continuous(breaks = round(seq(0, 6, by = 1), 2)) +
  theme_Publication() +
  geom_dl(aes(label=paste0(" ", Type)), method = list("last.points", cex = 3)) + 
  labs(title = 'ECI key skills at {frame_along} months') +
  coord_cartesian(clip = 'off') + 
  transition_reveal(time) #+
  #ease_aes('quadratic-in-out')

# Run animation  
animate(p, nframes=150, fps=10, width = 1200, height = 720, end_pause = 6, renderer = magick_renderer())

# Save animation
#anim_save("C:/Users/waylon/Desktop/csp-2021/images/eci.gif", animation = last_animation())


#' 
#' ???
#' 
#' This is a plot of some data collected for this project.
#' 
#' Notice that each line represents a different form of communication - so the flat line is gesturing, the line above that is vocalizations, we also have single words and then multiple words. Look at how vocalizations seem to peak around 18 months then decline - also referencing this peak notice how the use of single words is accelerating. The idea here is that children transition from one communication strategy to another and this tool seems to capture it.
#' 
#' The question is how to get from data collection with this tool to evaluating the theory of change illustrated above. Traditional approaches might include the creation of multiple-item scale scores (e.g., sum all the communication scales into a total score that are tested using ANOVA or multilevel modeling - but where is this indicated in the theoretical diagram above? Consider how focusing on one communication measure at a time (i.e., gestures, vocalizations, single- and multiple-word utterances) or an aggregate of all communication scores misses the point.
#' 
#' We wanted to identify inter-individual differences in intra-individual change in language development. Unlike traditional approaches latent growth curve modeling allowed for a more accurate and flexible approach to analyzing repeated measures data by simultaneously modeling change in the means (variable-centered) and in the variance and covariance of level and change (person-centered) across all forms of communication shown in the plot above - within the same model. This model allowed for testing of precursors and consequences of change and multiple group differences in these trajectories and predictive relationships.
#' 
#' Total communication was the weighted combination of the child's gestures (1 X each event), vocalizations (1 X each event), single-word (2 X each event) and multiple-word utterances (3 X each event). 
#' 
#' ---
#' 
#' layout: true
#' 
#' <div class="my-footer"><span>Slides at http://tinyurl.com/CHBD-slides &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; Return to <u><a style="color:White;" href="my-info.html#toc">About Me</a></u></span></div>
#' 

#' 
#' ---
#' 
#' class: center, middle
#' 
#' <img src="images/ecimodel.png" style="width: 540px;"/> 
#' 
#' ???
#' This diagram illustrates our final model. The interesting applied statistics problem here was the application of advanced statistical techniques to ask more sophisticated questions and tell more compelling stories.
#' 
#' ---
#' 
#' class: center, middle
#' 
#' # A note about efficiency tools
#' 
#' .pull-left[
#' <img src="images/manyfiles.png" width="85%" height="55%">
#' Numerous [Mplus](https://www.statscamp.org/) output files
#' ]
#' 
#' .pull-right[
#' <br>
#' <img src="images/table.gif">
#' <!-- New hex is fine here too -->
#' 
#' Example model fit table [automation](https://www.statscamp.org/)
#' ] 
#' 
#' ???
#' This figure illustrate
#' 
#' ---
#' 
#' layout: false
#' class: middle
#' 
#' #Thanks!
#' <br>
#' ## Any questions?
#' 
#' <!-- - Special thanks to -->
#' 
#' - Slide generation [source code](https://wwwaylon.github.io/assets/CHBD-2022/)
#' - Reproducible example [slide_code.R](https://raw.githubusercontent.com/wwwaylon/wwwaylon.github.io/master/assets/ph-2021/slide_code.R)
#' 
#' ???
#' 
#' 
#' 
#' 
