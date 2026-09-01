---
layout: page
title: Quantitative Research &amp; Measurement Scientist
---

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;800&display=swap">

<style>
/* ---- Modernist tokens ---- */
.pf {
--bg: #f3f2f2;
--ink: #201e1d;
--accent: #ec3013;
--accent-700: #ae1800;
--accent-500: #ff563c;
--rule: rgba(32, 30, 29, 0.4);
--ink-84: rgba(32, 30, 29, 0.84);
--ink-78: rgba(32, 30, 29, 0.78);
--ink-70: rgba(32, 30, 29, 0.7);
--ink-66: rgba(32, 30, 29, 0.66);
--ink-62: rgba(32, 30, 29, 0.62);
--edge: clamp(20px, 5vw, 72px);
background: var(--bg);
color: var(--ink);
font-family: Archivo, Aptos, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
text-wrap: pretty;
}
.pf * { box-sizing: border-box; }
.pf p, .pf h1, .pf h2, .pf h3, .pf ul { margin: 0; }
.pf ul { padding: 0; list-style: none; }
.pf strong { font-weight: 600; color: var(--ink); }
.pf a { color: var(--accent-700); text-decoration: none; }
.pf a:hover { color: var(--accent); }
.pf a:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }
.pf-wrap { max-width: 1180px; margin: 0 auto; padding: 0 var(--edge); }
.pf-rule { height: 2px; border: 0; margin: 0; background: var(--rule); }
/* ---- shared type ---- */
.pf-kicker {
display: block; font-size: 13px; line-height: 20px;
letter-spacing: 0.09em; text-transform: uppercase;
color: var(--accent-700); margin-bottom: 14px;
}
.pf-display, .pf h1, .pf h2, .pf h3 {
font-family: Archivo, sans-serif; font-weight: 800; letter-spacing: -0.015em;
}
.pf-h2 { font-size: clamp(30px, 3.6vw, 44px); line-height: 1.08; margin-left: -0.045em !important; }
.pf-h2-sm { font-size: 34px; line-height: 1.1; margin-left: -0.04em !important; }
.pf-body { font-size: 17px; line-height: 28px; }
.pf-body-sm { font-size: 16px; line-height: 27px; color: var(--ink-84); }
.pf-note {
font-size: 17px; line-height: 28px; max-width: 60ch;
padding-left: 22px; border-left: 2px solid var(--accent);
}
.pf-square { width: 8px; height: 8px; background: var(--accent); margin-top: 9px; flex: 0 0 auto; }
.pf-list { display: grid; gap: 14px; font-size: 16px; line-height: 26px; }
.pf-list li { display: flex; gap: 12px; }
/* ---- masthead ---- */
.pf-nav {
display: flex; align-items: baseline; gap: 28px; flex-wrap: wrap;
padding: 18px max(24px, calc((100% - 1180px) / 2 + 24px));
border-bottom: 2px solid var(--rule);
font-size: 13px; letter-spacing: 0.08em; text-transform: uppercase;
}
.pf-nav-brand { font-weight: 800; letter-spacing: 0.02em; text-transform: none; font-size: 17px; }
.pf-nav-spacer { flex: 1 1 auto; }
.pf-nav a { color: var(--ink); }
.pf-nav a:hover { color: var(--accent); }
/* ---- hero ---- */
.pf-hero { padding: 96px 0 76px; }
.pf-hero .pf-kicker { margin-bottom: 40px; }
.pf-hero h1 {
font-size: clamp(38px, 5.4vw, 74px); line-height: 1.06;
letter-spacing: -0.022em; margin-left: -0.058em !important; max-width: 20ch;
}
.pf-hero h1 span { display: block; }
.pf-hero h1 .pf-red { color: var(--accent); }
.pf-hero-cols {
display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
gap: 28px clamp(32px, 5vw, 80px); margin-top: 56px;
}
.pf-lede { font-size: 18px; line-height: 30px; max-width: 52ch; }
.pf-lede-2 { font-size: 17px; line-height: 28px; max-width: 48ch; color: var(--ink-78); }
.pf-tags {
display: flex; flex-wrap: wrap; align-items: flex-start;
gap: 8px; margin-top: 44px; padding: 0; list-style: none;
}
.pf-tag {
display: inline-block; flex: 0 0 auto; position: static;
margin: 0; border: 2px solid var(--rule); padding: 5px 12px;
font-size: 13px; line-height: 20px; color: var(--ink);
white-space: nowrap; background: transparent;
}
/* ---- two-column section frame ---- */
.pf-section { padding: 64px 0 72px; }
.pf-split {
display: grid; grid-template-columns: minmax(0, 320px) minmax(0, 1fr);
gap: 28px clamp(32px, 6vw, 96px); align-items: baseline;
}
.pf-split-top { align-items: start; }
.pf-subcols {
display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
gap: 24px clamp(28px, 3vw, 52px);
}
/* ---- interests ---- */
.pf-interests { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 0 clamp(24px, 3vw, 44px); }
.pf-interest { border-top: 2px solid var(--rule); padding: 22px 0 8px; }
.pf-interest-num {
font-weight: 800; font-size: 14px; letter-spacing: 0.06em;
margin-bottom: 18px !important; display: flex; align-items: center; gap: 10px;
}
.pf-interest-num i { width: 10px; height: 10px; background: var(--accent); display: inline-block; }
.pf-interest h3 { font-size: 22px; line-height: 28px; letter-spacing: -0.01em; margin-bottom: 16px !important; }
.pf-meta {
font-size: 13px; line-height: 22px; letter-spacing: 0.02em;
text-transform: uppercase; color: var(--ink-62); margin-bottom: 16px !important;
}
/* ---- projects ---- */
.pf-project { padding: 56px 0 60px; border-bottom: 2px solid var(--rule); }
.pf-project:last-child { border-bottom: 0; padding-bottom: 64px; }
.pf-project-num {
font-weight: 800; font-size: clamp(48px, 6vw, 84px); line-height: 0.88;
color: var(--accent); margin: 0 0 20px -0.05em !important; font-feature-settings: "tnum" 1;
}
.pf-project h3 { font-size: 26px; line-height: 32px; letter-spacing: -0.012em; margin-bottom: 12px !important; }
.pf-project-sub { font-size: 15px; line-height: 24px; color: var(--ink-70); }
.pf-methods {
font-size: 12px; line-height: 20px; letter-spacing: 0.07em; text-transform: uppercase;
margin-top: 28px !important; padding-top: 16px; border-top: 2px solid var(--rule); color: var(--ink-66);
}
.pf-question {
font-family: Archivo, sans-serif; font-weight: 800;
font-size: clamp(21px, 2.1vw, 27px); line-height: 1.32;
letter-spacing: -0.012em; max-width: 40ch; margin-bottom: 24px !important;
}
.pf-label {
display: block; font-size: 12px; line-height: 18px; letter-spacing: 0.1em;
text-transform: uppercase; color: var(--accent-700); margin-bottom: 10px;
}
.pf-project .pf-subcols { grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); margin-top: 32px; }
.pf-project .pf-note { margin-top: 32px !important; }
.pf-inline-list { display: grid; gap: 8px; font-size: 15px; line-height: 24px; }
.pf-inline-list li { display: flex; gap: 10px; }
.pf-inline-list i { width: 8px; height: 8px; background: var(--accent); margin-top: 8px; flex: 0 0 auto; }
/* ---- philosophy ---- */
.pf-approach { display: grid; grid-template-columns: repeat(auto-fit, minmax(190px, 1fr)); gap: 0 clamp(20px, 2.5vw, 36px); }
.pf-approach-item { border-top: 2px solid var(--rule); padding-top: 20px; }
.pf-approach-num { font-weight: 800; font-size: 13px; letter-spacing: 0.06em; color: var(--accent); margin-bottom: 16px !important; }
.pf-approach-item h3 { font-size: 18px; line-height: 24px; margin-bottom: 12px !important; }
.pf-approach-item p { font-size: 15px; line-height: 25px; color: rgba(32, 30, 29, 0.8); }
/* ---- about panel ---- */
.pf-questions { border-top: 2px solid var(--accent); padding-top: 22px; }
.pf-questions .pf-label { margin-bottom: 18px; }
/* ---- red poster close ---- */
.pf-close { background: var(--accent); color: var(--bg); }
.pf-close .pf-wrap { padding-top: 84px; padding-bottom: 84px; }
.pf-close h2 {
font-size: clamp(32px, 4.4vw, 58px); line-height: 1.06;
letter-spacing: -0.018em; margin-left: -0.058em !important; max-width: 24ch;
}
.pf-close h2 span { display: block; }
.pf-close p { font-size: clamp(17px, 1.6vw, 21px); line-height: 1.5; margin-top: 40px !important; max-width: 46ch; }
.pf-btn-ghost {
display: inline-block; margin-top: 40px; padding: 11px 20px;
border: 2px solid var(--bg); color: var(--bg) !important;
font-size: 15px; font-weight: 500; letter-spacing: 0.01em;
}
.pf-btn-ghost:hover { background: var(--bg); color: var(--accent) !important; }
.pf-footer {
max-width: 1180px; margin: 0 auto;
padding: 40px var(--edge) 64px; font-size: 13px; line-height: 24px; color: var(--ink-70);
}
/* ---- responsive ---- */
@media (max-width: 880px) {
.pf-split { grid-template-columns: 1fr; }
.pf-hero { padding: 56px 0 48px; }
.pf-close .pf-wrap { padding-top: 56px; padding-bottom: 56px; }
}
</style>

<div class="pf" markdown="0">

<!-- MASTHEAD -->
<nav class="pf-nav">
<span class="pf-nav-brand">Quantitative Research &amp; Measurement Science</span>
<span class="pf-nav-spacer"></span>
<a href="#work">Selected work</a>
<a href="#philosophy">Philosophy</a>
<a href="#about">About</a>
</nav>

<div class="pf-wrap">

<!-- HERO -->
<section class="pf-hero">
<span class="pf-kicker">Quantitative Psychology · Measurement Science · Applied Research</span>
<h1>
<span>I study how complex</span>
<span>human experience can be</span>
<span class="pf-red">measured and understood over time.</span>
</h1>
<div class="pf-hero-cols">
<p class="pf-lede">My work sits at the intersection of <strong>quantitative psychology, measurement science, and behavioral and health research</strong>. I develop and apply quantitative methods for answering difficult questions about human behavior, health, and development; particularly when the phenomena of interest cannot be directly observed, when measurement may function differently across people or contexts, or when the most important information lies in how individuals change over time.</p>
<p class="pf-lede-2">Across academic, clinical, healthcare, and industry research settings, I work with multidisciplinary teams to translate complex data into rigorous and interpretable evidence.</p>
</div>
<div class="pf-tags">
<span class="pf-tag">Psychometrics</span>
<span class="pf-tag">Measurement Science</span>
<span class="pf-tag">Longitudinal Research</span>
<span class="pf-tag">Structural Equation Modeling</span>
<span class="pf-tag">Behavioral Science</span>
<span class="pf-tag">Quantitative Methods</span>
<span class="pf-tag">Study Design</span>
<span class="pf-tag">Research Leadership</span>
</div>
</section>

<hr class="pf-rule" />

<!-- METHODOLOGICAL INTERESTS -->
<section class="pf-section">
<div class="pf-split">
<div>
<span class="pf-kicker">Research &amp; Methods</span>
<h2 class="pf-h2-sm">Methodological interests</h2>

<br>

<p class="pf-body-sm">Across these areas, my work is guided by a common question: how can we make credible claims about complex human phenomena when measurement is imperfect, individuals differ, and observations unfold over time?</p>

<br>

<p class="pf-meta"><strong>Applications:</strong> Behavioral health · Human development · Patient-reported outcomes · Engagement · Clinical research · User experience</p>

</div>
<div class="pf-interests">

<div class="pf-interest">
<p class="pf-interest-num"><i></i>01</p>
<h3>Measurement &amp; psychometrics</h3>
<p class="pf-meta">Construct validity · Measurement equivalence · Latent variable modeling · Instrument development · Reliability · Sensitivity to change</p>
<p class="pf-body-sm">How do we determine whether a measure is capturing the construct we intend to study and whether that measurement retains its meaning across people, groups, and time?</p>
</div>

<div class="pf-interest">
<p class="pf-interest-num"><i></i>02</p>
<h3>Modeling change</h3>
<p class="pf-meta">Longitudinal analysis · Structural equation modeling · Multilevel models · Growth trajectories · Individual differences in change</p>
<p class="pf-body-sm">Many of the phenomena we care about most are dynamic. A single observation provides a snapshot; understanding trajectories of change reveals a much richer picture of development, behavior, and health.</p>
</div>

<div class="pf-interest">
<p class="pf-interest-num"><i></i>03</p>
<h3>Complex data &amp; research questions</h3>
<p class="pf-meta">Mediation and moderation · Missing data · Predictive modeling · Behavioral data · Research design</p>
<p class="pf-body-sm">I use quantitative methods to investigate complex relationships, identify meaningful heterogeneity, and design studies that can give credible answers to difficult scientific questions.</p>
</div>

</div>

</div>

</section>


<hr class="pf-rule" />

<!-- SELECTED WORK -->
<section id="work" class="pf-section" style="padding-bottom: 0;">
<span class="pf-kicker">Research portfolio</span>
<h2 class="pf-h2">Selected work</h2>

<!-- 01 -->
<article class="pf-project">
<div class="pf-split pf-split-top">
<div>
<p class="pf-project-num">01</p>
<h3>When does change mean the same thing for everyone?</h3>
<p class="pf-project-sub">Measurement equivalence and developmental growth</p>
<p class="pf-methods">Measurement validation · Growth modeling · Longitudinal analysis · SEM · Construct validity</p>
</div>
<div>
<p class="pf-question">When we observe differences in developmental or behavioral scores, how do we know they represent real differences in the underlying construct rather than differences in how the measurement performs?</p>
<div class="pf-subcols">
<div>
<span class="pf-label">The challenge</span>
<p class="pf-body-sm">Longitudinal research often assumes a score means the same thing across people and across time. Without that assumption, an apparent difference in a growth trajectory could reflect a change in the measurement rather than genuine development.</p>
</div>
<div>
<span class="pf-label">My work</span>
<p class="pf-body-sm" style="margin-bottom: 16px !important;">One project examined the measurement and developmental properties of the Early Communication Indicator, a standardized assessment of early communication development.</p>
<p class="pf-body-sm">With a multidisciplinary team, I led analyses using parallel-process and piecewise latent growth models to examine developmental trajectories, relationships among communication domains, and transitions between communication strategies.</p>
</div>
</div>
<p class="pf-note"><strong>Why it matters -</strong> a measurement system should do more than assign a score. It should give confidence that observed change reflects the phenomenon we intend to understand: not only where someone is, but how they are changing.</p>
</div>
</div>
</article>

<!-- 02 -->
<article class="pf-project">
<div class="pf-split pf-split-top">
<div>
<p class="pf-project-num">02</p>
<h3>Looking beyond the average trajectory</h3>
<p class="pf-project-sub">Understanding heterogeneity in longitudinal change</p>
<p class="pf-methods">Longitudinal modeling · Multilevel models · Growth trajectories · SEM</p>
</div>
<div>
<p class="pf-question">What do we lose when we summarize an entire population with a single average trajectory?</p>
<div class="pf-subcols">
<div>
<span class="pf-label">The challenge</span>
<p class="pf-body-sm">Population averages obscure meaningful heterogeneity. Two individuals may share an identical baseline while following entirely different paths of improvement, deterioration, recovery, or stability.</p>
</div>
<div>
<span class="pf-label">What I do</span>
<p class="pf-body-sm" style="margin-bottom: 16px !important;">Longitudinal and multilevel models that distinguish individual patterns of change from measurement noise and population-level trends across developmental, behavioral, psychological, and clinical outcomes.</p>
<ul class="pf-inline-list">
<li><i></i>Who changes?</li>
<li><i></i>How and when does meaningful change occur?</li>
<li><i></i>Why do individuals follow different trajectories?</li>
<li><i></i>Under what conditions do those trajectories differ?</li>
</ul>
</div>
</div>
<p class="pf-note"><strong>Why it matters -</strong> a single measurement is only a snapshot. Whether the subject is well-being, engagement, development, health, or user experience, the trajectory tells the more meaningful story.</p>
</div>
</div>
</article>

<!-- 03 -->
<article class="pf-project">
<div class="pf-split pf-split-top">
<div>
<p class="pf-project-num">03</p>
<h3>Measuring what we cannot directly observe</h3>
<p class="pf-project-sub">Latent variables and structural equation modeling</p>
<p class="pf-methods">SEM · Factor analysis · Latent variables · Psychometrics · Measurement invariance</p>
</div>
<div>
<p class="pf-question">Well-being, engagement, symptoms, functioning, motivation - none can be measured directly. How do we know our observed measures represent the construct at all?</p>
<div class="pf-subcols">
<div>
<span class="pf-label">The challenge</span>
<p class="pf-body-sm">Observed variables are imperfect indicators. A survey response, behavioral observation, or clinical assessment carries both meaningful information and measurement error; and scientific conclusions depend on telling them apart.</p>
</div>
<div>
<span class="pf-label">My approach</span>
<p class="pf-body-sm" style="margin-bottom: 16px !important;">Latent variable methods - factor analysis and structural equation modeling - used to define constructs, examine validity, test theoretical models, and separate meaningful variation from error over time.</p>
<p class="pf-body-sm">I am most interested in questions where the <strong>measurement model and the substantive model cannot be treated as separate problems</strong>.</p>
</div>
</div>
<p class="pf-note"><strong>Why it matters -</strong> good measurement begins with a clear understanding of the construct, but rigorous measurement means asking whether the data actually support the claims we want to make.</p>
</div>
</div>
</article>

<!-- 04 -->
<article class="pf-project">
<div class="pf-split pf-split-top">
<div>
<p class="pf-project-num">04</p>
<h3>Finding the signal in incomplete data</h3>
<p class="pf-project-sub">Missing data and scalable quantitative methods</p>
<p class="pf-methods">Missing data · Dimension reduction · Principal component analysis · Computational statistics</p>
</div>
<div>
<p class="pf-question">How can researchers preserve valid inference when real-world data are incomplete?</p>
<div class="pf-subcols">
<div>
<span class="pf-label">The challenge</span>
<p class="pf-body-sm">Missing data are rarely just a technical inconvenience: how missing observations are handled can change a study’s conclusions. At the same time, modern datasets often contain hundreds or thousands of potentially informative variables, creating challenges for both statistical modeling and computation.</p>
</div>
<div>
<span class="pf-label">My work</span>
<p class="pf-body-sm">My methodological research examines how auxiliary information can be incorporated into missing-data analyses, including the use of dimension-reduction techniques to identify useful signal within high-dimensional datasets. I focus on methods that balance statistical rigor with computational practicality, allowing researchers to make better use of complex, incomplete data without introducing unnecessary complexity.</p>
</div>
</div>
<p class="pf-note"><strong>Why it matters -</strong> Better inference depends not only on the models we choose, but on how we represent and use the information contained in our data. I am interested in methods that make complex data more informative, analyses more robust, and rigorous statistical approaches practical for researchers working with real-world datasets.</p>
</div>
</div>
</article>
</section>

<!-- PHILOSOPHY -->
<section id="philosophy" class="pf-section" style="border-top: 2px solid var(--rule);">
<span class="pf-kicker">Research philosophy</span>
<h2 class="pf-h2" style="margin-bottom: 44px !important;">How I approach research</h2>
<div class="pf-approach">
<div class="pf-approach-item">
<p class="pf-approach-num">01</p>
<h3>Start with the construct</h3>
<p>Before selecting a model, ask what we are actually trying to understand or measure.</p>
</div>
<div class="pf-approach-item">
<p class="pf-approach-num">02</p>
<h3>Treat measurement as part of the problem</h3>
<p>Validity, equivalence, reliability, and sensitivity decide what conclusions the data can support.</p>
</div>
<div class="pf-approach-item">
<p class="pf-approach-num">03</p>
<h3>Study change, not just states</h3>
<p>Behavior, health, and experience are dynamic. Look past isolated observations to trajectories.</p>
</div>
<div class="pf-approach-item">
<p class="pf-approach-num">04</p>
<h3>Match the method to the question</h3>
<p>The best approach aligns with the question, the design, the measurement properties, and the data.</p>
</div>
<div class="pf-approach-item">
<p class="pf-approach-num">05</p>
<h3>Make complexity useful</h3>
<p>Advanced methods earn their place only when the results improve understanding and decisions.</p>
</div>
</div>
</section>

<hr class="pf-rule" />

<!-- LEADERSHIP -->
<section class="pf-section">
<div class="pf-split">
<div>
<span class="pf-kicker">Leadership</span>
<h2 class="pf-h2-sm">Research leadership</h2>
</div>
<div class="pf-subcols">
<div>
<p class="pf-body" style="margin-bottom: 20px !important;">I work across the full research lifecycle; from formulating the scientific question through design, analysis, interpretation, dissemination, and methodological development.</p>
<p class="pf-body-sm">As a Principal Biostatistician and research methods leader, I collaborate with investigators across clinical, behavioral, and translational research: building statistical strategy for grant applications, leading primary analyses, and advancing methodological approaches.</p>
</div>
<div>
<p class="pf-body-sm" style="margin-bottom: 20px !important;">A cornerstone of my work is building quantitative capacity beyond individual projects. I mentor statisticians, analysts, faculty, programmers, and research staff, and develop methods, workflows, and infrastructure that can be reused across scientific questions.</p>
<p class="pf-note"><strong>Start with the problem, understand the context, adapt the approach, and build systems that help people do their best work.</strong></p>
</div>
</div>
</div>
</section>

<hr class="pf-rule" />

<!-- ABOUT -->
<section id="about" class="pf-section" style="padding-bottom: 80px;">
<div class="pf-split">
<div>
<span class="pf-kicker">Background</span>
<h2 class="pf-h2-sm">About</h2>
</div>
<div class="pf-subcols" style="gap: 32px clamp(28px, 3vw, 52px);">
<div>
<p class="pf-body" style="margin-bottom: 20px !important;">I am a quantitative psychologist and research leader with experience spanning academic research, healthcare, clinical research, and industry.</p>
<p class="pf-body-sm" style="margin-bottom: 20px !important;">My background includes quantitative psychology, psychometrics, structural equation modeling, longitudinal analysis, multilevel modeling, missing-data methodology, and predictive modeling.</p>
<p class="pf-body-sm">Throughout my career I have collaborated with clinicians, behavioral scientists, epidemiologists, data scientists, engineers, and organizational leaders on complex research questions.</p>
</div>
<div class="pf-questions">
<span class="pf-label">Questions that motivate my work</span>
<ul class="pf-list">
<li><i class="pf-square"></i>How do we know that we are measuring what we think we are measuring?</li>
<li><i class="pf-square"></i>Does a measure function equivalently across different people and contexts?</li>
<li><i class="pf-square"></i>How can we distinguish meaningful change from measurement error?</li>
<li><i class="pf-square"></i>Why do individuals with similar starting points follow different trajectories?</li>
<li><i class="pf-square"></i>How can complex quantitative evidence inform real-world decisions?</li>
</ul>
</div>
</div>
</div>
</section>

</div><!-- /.pf-wrap -->

<!-- RED POSTER CLOSE -->
<section class="pf-close">
<div class="pf-wrap">
<h2>
<span>Let's measure</span>
<span>something difficult.</span>
</h2>
<p>Open to collaborations involving measurement science, quantitative research, behavioral data, longitudinal analysis, psychometrics, research methodology, and product and experience measurement.</p>
<a class="pf-btn-ghost" href="mailto:wwwaylon@gmail.com">Get in touch</a>
</div>
</section>

<p class="pf-footer"><a href="https://wwwaylon.github.io/">Quantitative Research &amp; Measurement Scientist</a></p>

</div><!-- /.pf -->
