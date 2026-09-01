---
layout: page
title: 
---

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;800&display=swap">

<style>
.rp {
  --bg: #f3f2f2; --text: #201e1d; --accent: #ec3013; --accent-700: #ae1800;
  --n300: #d7d3d3; --n600: #7d7979; --n800: #444141;
  --divider: color-mix(in srgb, #201e1d 40%, transparent);
  --font: "Archivo", system-ui, sans-serif;
  background: var(--bg); color: var(--text); font-family: var(--font);
  font-size: 15px; line-height: 1.55;
width: 100vw; max-width: 100vw;
margin-left: calc(50% - 50vw); margin-right: calc(50% - 50vw);
padding: 0 max(24px, calc(50vw - 560px)) 96px;
}
.rp * { box-sizing: border-box; }
.rp a { color: var(--accent); text-underline-offset: 3px; }
.rp a:hover { color: var(--accent-700); }
.rp :focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }
.rp h1, .rp h2 { font-family: var(--font); font-weight: 800; letter-spacing: -0.02em; }

.rp-eyebrow { display: flex; justify-content: space-between; gap: 24px; flex-wrap: wrap;
  font-size: 12px; letter-spacing: 0.12em; text-transform: uppercase; font-weight: 600; color: var(--n600); }
.rp-rule { height: 2px; background: var(--divider); border: 0; margin: 12px 0 28px; }
.rp h1 { font-size: clamp(52px, 8vw, 104px); line-height: 0.92; letter-spacing: -0.03em; margin: 0 0 24px; max-width: 12ch; }
.rp-lede { max-width: 56ch; font-size: 17px; line-height: 1.5; color: var(--n800); margin: 0 0 32px; text-wrap: pretty; }

.rp-stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
  border-top: 2px solid var(--divider); border-bottom: 2px solid var(--divider); }
.rp-stats > div { padding: 20px; border-right: 1px solid var(--n300); }
.rp-stats > div:first-child { padding-left: 0; }
.rp-stats > div:last-child { border-right: 0; }
.rp-stat-n { font-size: 38px; font-weight: 800; line-height: 1; color: var(--accent); }
.rp-stat-l { font-size: 12px; letter-spacing: 0.1em; text-transform: uppercase; font-weight: 600; color: var(--n600); margin-top: 8px; }

.rp-bar { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; padding: 20px 0;
  border-bottom: 2px solid var(--divider); position: sticky; top: 0; background: var(--bg); z-index: 5; }
.rp-btn { font-family: var(--font); font-weight: 800; font-size: 13px; letter-spacing: 0.06em;
  text-transform: uppercase; border: 1px solid var(--divider); border-radius: 0; background: transparent;
  color: var(--text); padding: 8px 16px; cursor: pointer; }
.rp-btn:hover { background: color-mix(in srgb, var(--text) 7%, transparent); }
.rp-btn[aria-pressed="true"] { background: var(--accent); color: var(--bg); border-color: var(--accent); }
.rp-toggle { margin-left: auto; border-color: transparent; color: var(--accent); }
.rp-toggle:hover { background: color-mix(in srgb, var(--accent) 10%, transparent); }

.rp-item { border-bottom: 1px solid var(--n300); padding: 36px 0; }
.rp-group { font-size: 12px; letter-spacing: 0.14em; text-transform: uppercase; font-weight: 600;
  color: var(--accent); margin-bottom: 24px; }
.rp-grid { display: grid; grid-template-columns: minmax(120px, 180px) minmax(0, 1fr); gap: 32px; align-items: start; }
.rp-years { font-weight: 800; font-size: 22px; line-height: 1.1; }
.rp-loc { font-size: 12px; letter-spacing: 0.08em; text-transform: uppercase; color: var(--n600); margin-top: 6px; }
.rp-item h2 { font-size: clamp(24px, 2.6vw, 34px); line-height: 1.08; margin: 0 0 10px; max-width: 22ch; }
.rp-dept { font-size: 15px; font-weight: 600; color: var(--n800); }
.rp-org { font-size: 15px; margin-bottom: 18px; }
.rp-item ul { list-style: none; margin: 0; padding: 0; display: grid; gap: 12px; max-width: 74ch; }
.rp-item li { display: grid; grid-template-columns: 14px minmax(0, 1fr); gap: 12px;
  font-size: 15px; line-height: 1.5; color: var(--n800); text-wrap: pretty; }
.rp-item li::before { content: "—"; color: var(--accent); font-weight: 800; }
.rp-item li strong { color: var(--text); font-weight: 600; }
.rp[data-detail="off"] .rp-item ul { display: none; }
.rp-foot { padding-top: 40px; font-size: 12px; letter-spacing: 0.1em; text-transform: uppercase;
  color: var(--n600); display: flex; justify-content: space-between; gap: 16px; flex-wrap: wrap; }
@media (max-width: 640px) { .rp-grid { grid-template-columns: 1fr; gap: 16px; } }
</style>

<div class="rp" id="rp" data-detail="on">

<div class="rp-eyebrow"><span>Curriculum Vitae - Waylon J. Howard</span><span>2008 - Present</span></div>
<hr class="rp-rule">
<h1>Research<br>Appointments</h1>
<p class="rp-lede">Quantitative research leadership and collaboration across research institutes, academic medical centers, universities, and life-science analytics organizations.</p>

<div class="rp-stats">
<div><div class="rp-stat-n">13</div><div class="rp-stat-l">Appointments</div></div>
<div><div class="rp-stat-n">18</div><div class="rp-stat-l">Years</div></div>
<div><div class="rp-stat-n">8</div><div class="rp-stat-l">Institutions</div></div>
<div><div class="rp-stat-n">\$21.6M+</div><div class="rp-stat-l">Total Team Grant Funding</div></div>
</div>

<div class="rp-bar">
<button type="button" class="rp-btn" data-filter="all" aria-pressed="true">All</button>
<button type="button" class="rp-btn" data-filter="current" aria-pressed="false">Current</button>
<button type="button" class="rp-btn" data-filter="previous" aria-pressed="false">Previous</button>
<button type="button" class="rp-btn rp-toggle" id="rp-detail">Hide detail</button>
</div>

<article class="rp-item" data-group="current">
<div class="rp-group">Current</div>
<div class="rp-grid">
<div><div class="rp-years">2022 - Present</div><div class="rp-loc">Seattle, WA</div></div>
<div>
<h2>Principal Biostatistician</h2>
<div class="rp-dept">Biostatistics, Epidemiology and Analytics in Research</div>
<div class="rp-org"><a href="https://www.seattlechildrens.org/research">Seattle Children's Research Institute</a></div>
<ul>
<li><span><strong>Lead quantitative research strategy</strong> across clinical, translational, and behavioral science programs, advising investigators on study design, measurement, analytic strategy, and evidence generation.</span></li>
<li><span><strong>Provide senior methodological leadership</strong> across NIH, PCORI, CDC, and foundation-funded programs, contributing to \$19M+ in awarded research funding and an additional \$14M+ active grant pipeline.</span></li>
<li><span><strong>Apply advanced quantitative methods</strong> - longitudinal and multilevel modeling, latent-variable methods, psychometrics, causal inference, and predictive modeling - to complex clinical and behavioral research questions.</span></li>
<li><span><strong>Build reusable analytic frameworks</strong>, reproducible workflows, and research tools that extend methodological capabilities across projects and programs.</span></li>
<li><span><strong>Partner with clinicians, investigators, epidemiologists, and data scientists</strong> to translate complex research questions and data into rigorous designs, analyses, publications, and funding proposals.</span></li>
<li><span><strong>Mentor investigators and quantitative staff</strong> in study design, grant development, advanced methods, reproducible analysis, and scientific communication.</span></li>
<li><span><strong>Authored 20+ peer-reviewed publications since 2024</strong>, spanning pediatric clinical, behavioral, developmental, and translational research.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-group">Previous</div>
<div class="rp-grid">
<div><div class="rp-years">2021 - 2022</div><div class="rp-loc">Bethesda, MD</div></div>
<div>
<h2>Director of Research, Patient-Centered Outcomes</h2>
<div class="rp-dept">Patient-Centered Outcomes</div>
<div class="rp-org"><a href="https://www.openhealthgroup.com/">Open Health</a></div>
<ul>
<li><span><strong>Directed global quantitative analytics operations</strong> supporting oncology real-world evidence programs and $12M annual revenue.</span></li>
<li><span><strong>Led a 10-person US/India analytics organization</strong> delivering statistical programming, data analytics, and evidence generation solutions.</span></li>
<li><span><strong>Built analytics infrastructure</strong> supporting the transition from traditional biostatistical workflows to scalable SQL/cloud-based delivery pipelines.</span></li>
<li><span><strong>Partnered with clinical, product, engineering, and commercial teams</strong> to operationalize analytics capabilities during rapid organizational growth.</span></li>
<li><span><strong>Developed automated R/Shiny tools</strong> reducing analyst training time by approximately 40%.</span></li>
<li><span><strong>Established standardized analytic processes, SOPs, and quality frameworks</strong> improving reproducibility and delivery consistency.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2019 - 2021</div><div class="rp-loc">Boston, MA</div></div>
<div>
<h2>Director of Biostatistics and Data Analytics</h2>
<div class="rp-dept">Health Economics and Outcomes Research</div>
<div class="rp-org"><a href="https://www.concertai.com/">ConcertAI</a></div>
<ul>
<li><span><strong>Directed a 10-person global analytics team (US and India)</strong> supporting $12M in annual revenue during rapid organizational growth and platform transition.</span></li>
<li><span><strong>Scaled analytics operations with zero delivery disruption</strong> through the shift from SAS-based biostatistics to SQL data management and analytics on AWS delivery pipelines.</span></li>
<li><span><strong>Developed R/Shiny workflow tools</strong>, reducing staff training time by ~40%.</span></li>
<li><span><strong>Co-developed 15+ SOPs</strong> to standardize analytics delivery and improve team performance.</span></li>
<li><span><strong>Managed global project delivery, onboarding, and resource allocation</strong> across distributed teams.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2018 - 2019</div><div class="rp-loc">Charlotte, NC</div></div>
<div>
<h2>Director of Research in Biostatistics and Data Management; Associate Professor</h2>
<div class="rp-dept">Center for Outcomes Research and Evaluation</div>
<div class="rp-org"><a href="https://atriumhealth.org/">Atrium Health</a></div>
<ul>
<li><span><strong>Directed biostatistics (6 staff) and data management (4 staff) teams</strong> supporting real-world evidence and patient-centered outcomes research.</span></li>
<li><span><strong>Expanded institutional research capacity</strong> through a 6-course training series reaching 150+ medical residents.</span></li>
<li><span><strong>Oversaw study design, analysis, and reporting</strong> across a diverse clinical portfolio.</span></li>
<li><span><strong>Increased accepted abstracts and publications by 37%</strong> and presentations by 10%.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2015 - 2018</div><div class="rp-loc">Seattle, WA</div></div>
<div>
<h2>Director of Biostatistics, Epidemiology, Econometrics, and Programming Core</h2>
<div class="rp-dept">Center for Child Health, Behavior and Development</div>
<div class="rp-org"><a href="https://www.seattlechildrens.org/research/">Seattle Children's Research Institute</a></div>
<ul>
<li><span><strong>Led a 5-person biostatistics and analytics research support core</strong> with a $600K operating budget, supporting institutional research and grant development.</span></li>
<li><span><strong>Developed automated workflow and capacity management tools</strong> across R, Qualtrics, and Asana to improve efficiency and transparency.</span></li>
<li><span><strong>Expanded Core-supported NIH grant submissions from 10 to 60+ annually</strong>, contributing to ~$5M in new funding.</span></li>
<li><span><strong>Strengthened core infrastructure</strong> to support growing institutional demand.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2014 - 2015</div><div class="rp-loc">Amherst, MA</div></div>
<div>
<h2>Faculty Research Methodologist</h2>
<div class="rp-dept">Institute for Social Science Research</div>
<div class="rp-org"><a href="https://www.umass.edu/">University of Massachusetts</a></div>
<ul>
<li><span><strong>Directed methodology training and consulting services</strong> supporting research across seven colleges.</span></li>
<li><span><strong>Led a team of 5 consultants</strong> delivering internal research support.</span></li>
<li><span><strong>Organized a 12-course advanced methodology conference</strong> training 124 participants.</span></li>
<li><span><strong>Expanded institutional capacity</strong> in research design and analytic methods.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2012 - 2014</div><div class="rp-loc">Baltimore, MD</div></div>
<div>
<h2>Director of Research and Evaluation</h2>
<div class="rp-dept">Maryland Center for Developmental Disabilities</div>
<div class="rp-org"><a href="https://www.kennedykrieger.org/">Kennedy Krieger Institute</a></div>
<ul>
<li><span><strong>Led research, evaluation, and policy-focused initiatives</strong> to improve outcomes for individuals with developmental and intellectual disabilities.</span></li>
<li><span><strong>Led community-based research, program evaluation, and needs assessments</strong> in collaboration with the Senior Director.</span></li>
<li><span><strong>Supported multidisciplinary efforts</strong> spanning public health, policy, and service delivery.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2014</div><div class="rp-loc">Baltimore, MD</div></div>
<div>
<h2>Visiting Assistant Professor</h2>
<div class="rp-dept">Bloomberg School of Public Health</div>
<div class="rp-org"><a href="https://www.jhsph.edu/">Johns Hopkins University</a></div>
<ul>
<li><span><strong>Contributed to graduate teaching and research</strong> in public health methodology, disability research, and epidemiology.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2014</div><div class="rp-loc">Baltimore, MD</div></div>
<div>
<h2>Affiliated Faculty Member</h2>
<div class="rp-dept">Wendy Klag Center for Autism and Developmental Disabilities</div>
<div class="rp-org"><a href="https://www.jhsph.edu/research/centers-and-institutes/wendy-klag-center-for-autism-and-developmental-disabilities/">Johns Hopkins University</a></div>
<ul>
<li><span><strong>Collaborated on interdisciplinary research and training initiatives</strong> in autism and developmental disabilities.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2013 - 2014</div><div class="rp-loc">Baltimore, MD</div></div>
<div>
<h2>Co-Director, Knowledge Acquisition and Scientific Inquiry Core</h2>
<div class="rp-dept">Center for Innovation and Leadership in Special Education</div>
<div class="rp-org"><a href="https://www.kennedykrieger.org/">Kennedy Krieger Institute</a></div>
<ul>
<li><span><strong>Led development of curriculum and training programs</strong> to strengthen research literacy and methodological rigor among special education and research professionals.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2013 - 2015</div><div class="rp-loc">Bayview, MD</div></div>
<div>
<h2>Senior Research Data Analyst</h2>
<div class="rp-dept">Biostatistics, Epidemiology, and Data Management Core</div>
<div class="rp-org"><a href="http://beadcore.jhu.edu/">Johns Hopkins University</a></div>
<ul>
<li><span><strong>Provided statistical design, data management, and analytic support</strong> across funded research programs.</span></li>
<li><span><strong>Contributed to 10+ publications</strong>, presentations, and invited talks.</span></li>
<li><span><strong>Served as methodological consultant</strong> on grant-funded program evaluations.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2008 - 2012</div><div class="rp-loc">Kansas City, KS</div></div>
<div>
<h2>Quantitative Psychology Research Assistant</h2>
<div class="rp-dept">Juniper Gardens Children's Project</div>
<div class="rp-org"><a href="https://jgcp.ku.edu/">University of Kansas</a></div>
<ul>
<li><span><strong>Provided research methods and data analysis support</strong> for community-engaged research on child development, early literacy, and behavioral interventions.</span></li>
<li><span><strong>Contributed to development of the Early Communication Indicator (ECI)</strong>, a standardized early childhood language development tool.</span></li>
</ul>
</div>
</div>
</article>

<article class="rp-item" data-group="previous">
<div class="rp-grid">
<div><div class="rp-years">2010 - 2011</div><div class="rp-loc">Lawrence, KS</div></div>
<div>
<h2>Quantitative Psychology Research Assistant</h2>
<div class="rp-dept">Center for Research Methods and Data Analysis</div>
<div class="rp-org"><a href="https://crmda.ku.edu/">University of Kansas</a></div>
<ul>
<li><span><strong>Provided methodological consulting and analytic support</strong> across academic departments and external partners.</span></li>
<li><span><strong>Assisted with research design, statistical analysis</strong>, and software training workshops.</span></li>
</ul>
</div>
</div>
</article>

<div class="rp-foot"><span>Research Appointments</span><span id="rp-count">13 of 13 appointments shown</span></div>
</div>

<script>
(function () {
  var rp = document.getElementById('rp');
  var items = rp.querySelectorAll('.rp-item');
  var count = document.getElementById('rp-count');
  function apply(filter) {
    var shown = 0;
    items.forEach(function (el) {
      var visible = filter === 'all' || filter === el.dataset.group;
      el.style.display = visible ? '' : 'none';
      if (visible) shown++;
      var label = el.querySelector('.rp-group');
      if (label) label.style.display = (filter === 'all') ? '' : 'none';
    });
    count.textContent = shown + ' of ' + items.length + ' appointments shown';
  }
  rp.querySelectorAll('[data-filter]').forEach(function (b) {
    b.addEventListener('click', function () {
      rp.querySelectorAll('[data-filter]').forEach(function (o) { o.setAttribute('aria-pressed', o === b); });
      apply(b.dataset.filter);
    });
  });
  var toggle = document.getElementById('rp-detail');
  toggle.addEventListener('click', function () {
    var off = rp.dataset.detail === 'off';
    rp.dataset.detail = off ? 'on' : 'off';
    toggle.textContent = off ? 'Hide detail' : 'Show detail';
  });
})();
</script>