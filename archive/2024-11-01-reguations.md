---
layout: post
title: NIH- vs FDA-Regulated Clinical Trials
subtitle: Statistical Process Differences 
#thumbnail-img: /assets/img/PD_Cube.png
#gh-repo: wwwaylon/beautiful-jekyll
#gh-badge: [star, fork, follow]
tags: [Leadership Biostatistics Regulations]
---

When transitioning from an NIH-funded clinical trial to an FDA-regulated clinical trial, biostatisticians face new layers of regulatory oversight and specific procedural requirements. While the statistical principles and modeling techniques may be similar, the rigor of documentation, validation, and adherence to regulations within FDA-regulated trials introduces unique challenges. 

<p><h2>Table of Contents</h2>
<nav id="TableOfContents">
<ul>
<li><a href="#differences-in-trial-oversight">Differences in Trial Oversight</a></li>
<li><a href="#statistical-process-in-fdaregulated-trials">Statistical Processes in FDA-Regulated Trials</a></li>
<li><a href="#compliance-and-documentation">Compliance and Documentation</a></li>
<li><a href="#references">References</a></li>
</ul>
</nav>
</p>

<h2 id="differences-in-trial-oversight">Differences in Trial Oversight</h2>

### NIH vs. FDA Oversight

NIH-funded trials are primarily governed by scientific rigor and ethical standards, with a focus on producing high-quality, reproducible research. FDA-regulated trials, on the other hand, must meet stringent requirements because their findings can directly impact drug approvals, medical devices, or therapies intended for widespread public use. As a result, FDA-regulated trials have stricter documentation standards and require adherence to Good Clinical Practices (GCP) and FDA-specific guidelines, such as 21 CFR Part 11.

### Regulatory Submissions and Monitoring

In FDA-regulated trials, the biostatistician’s work often feeds into key regulatory submissions, such as Investigational New Drug (IND) applications and New Drug Applications (NDA). As a result, statisticians are tasked with ensuring that data analyses are not only scientifically valid but also meet the regulatory submission standards, including the use of validated software and transparent reporting of results.

For example, biostatisticians must ensure that all statistical outputs are fully reproducible and that all analysis code is validated for accuracy. This is often not a requirement in NIH trials, where the focus is more on the soundness of the statistical methods rather than the formal validation of the software or code used to implement them.

<h2 id="statistical-process-in-fdaregulated-trials">Statistical Processes in FDA-Regulated Trials</h2>

### Pre-Specified Statistical Analysis Plans

In FDA-regulated trials, a well-defined *Statistical Analysis Plan* (SAP) must be prepared and finalized before any analysis begins. The SAP includes all planned statistical methods, hypotheses, and decision rules for data analysis. Pre-specification is critical because post-hoc analyses, or any deviation from the SAP, can raise concerns about data dredging or bias. The FDA’s guidance on [Statistical Principles for Clinical Trials](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/e9-statistical-principles-clinical-trials) highlights the importance of pre-specified analysis plans and transparent data handling practices.

In contrast, NIH trials often allow more flexibility, where exploratory analyses and post-hoc hypothesis generation are more accepted. In FDA trials, any deviation from the SAP requires thorough justification and may need approval from regulatory authorities.

### Handling Missing Data

Both NIH and FDA-regulated trials require robust strategies for dealing with missing data. However, in FDA-regulated trials, handling missing data becomes especially crucial because of the potential impact on regulatory approval. Techniques like *multiple imputation*, *inverse probability weighting*, or *sensitivity analyses* are often employed, and it’s essential to pre-specify how missing data will be addressed in the SAP.

Additionally, sensitivity analyses in FDA trials are critical for demonstrating that the results are not biased or overly dependent on how missing data is handled, adding another layer of rigor to the analysis.<sup class="footnote-ref" id="fnref:missing"><a href="#fn:missing">1</a></sup>

### Data Monitoring Committees (DMCs)

FDA-regulated trials often require an independent Data Monitoring Committee (DMC), also known as a Data Safety Monitoring Board (DSMB), to review interim data for safety concerns. The biostatistician plays a crucial role in preparing interim analyses for these reviews. These interim analyses must be handled carefully to avoid introducing bias into the study while ensuring participant safety.

Interim analysis for NIH trials also occurs, but FDA-regulated trials may impose stricter guidelines, including the potential for early stopping based on pre-defined criteria (such as efficacy or futility), which must be tightly controlled.

### Adaptive Trial Designs and Real-World Evidence

FDA regulations allow for innovative trial designs, such as adaptive trials, where modifications to the trial’s protocol can be made based on interim data. These adaptations could include adjusting sample sizes, changing treatment groups, or even modifying endpoints. However, to maintain the scientific validity of the trial, these adaptations must be scientifically justified, pre-approved, and supported by statistical approaches that account for potential biases. These adaptations, while flexible, must not undermine the credibility of the trial’s findings, a principle highlighted in the [FDA Adaptive Design Guidance](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/adaptive-design-clinical-trials-drugs-and-biologics).

In addition to adaptive designs, the FDA has recently emphasized the use of real-world evidence in regulatory decisions. Real-world evidence refers to clinical data collected outside of traditional randomized controlled trials (RCTs), such as through electronic health records (EHRs), insurance claims, patient registries, and even wearable devices. This data provides insights into how treatments work in everyday medical practice, capturing the effects of interventions in broader, more diverse populations.

The FDA’s updated guidance on real-world evidence opens new possibilities for biostatisticians and clinical researchers. By integrating real-world data with traditional trial data, researchers can provide more comprehensive evidence about a treatment’s safety and effectiveness. However, applying real-world data to regulatory submissions requires careful attention to its quality, relevance, and reliability, since this data is often less controlled than that collected in RCTs. Understanding how to meet the FDA’s standards for using real-world evidence is essential for teams aiming to leverage this approach effectively (see [FDA Real-World Evidence Guidance](https://www.fda.gov/science-research/science-and-research-special-topics/real-world-evidence)).

<h2 id="compliance-and-documentation">Compliance and Documentation</h2>

### Good Clinical Practice (GCP) and FDA Audits

Compliance with GCP is a cornerstone of FDA-regulated clinical trials. As a biostatistician, this means maintaining impeccable documentation of all analyses, including audit trails of all decisions, analysis steps, and versions of datasets and code. The FDA may audit any aspect of the trial, including statistical analyses, to ensure compliance with regulations.

In contrast, NIH trials may not be subjected to the same level of external audits, although internal audits are common. For an FDA trial, adherence to GCP ensures that the data and statistical processes are reproducible and transparent, which is critical for regulatory submissions.

### 21 CFR Part 11 Compliance

Another specific requirement for FDA trials is 21 CFR Part 11 compliance, which governs electronic records and electronic signatures. Biostatisticians must ensure that any software used for analysis complies with these regulations, which may involve validation of the software environment and electronic data handling procedures.

In NIH-funded trials, while data security and integrity are important, Part 11 compliance may not be as stringently enforced. Consider popular statistical software:

## FDA Regulatory Environment

### SAS
- **Compliance Features**: SAS is often preferred for FDA-regulated trials due to established procedures for Part 11 compliance. Built-in functions log data changes, manage electronic signatures, and create secure audit trails.
- **Macros**: You’ll frequently work with validated SAS macros for tasks like adverse event summarization or randomization scheme generation. These macros require extensive documentation to ensure reproducibility and traceability.

### Stata
- **Compliance Adaptation**: Stata provides some Part 11 compliance features, though custom scripts or commands may be needed for specific requirements.
- **Macro Use**: Macro use in Stata may be more limited than in SAS, but it’s crucial to document all steps, particularly for any custom scripts created for data handling or analysis.

### R
- **Challenges and Customization**: Open-source tools like R require extra steps for compliance. In R, you may need to implement custom logging functions or use packages such as `validate` to ensure data integrity. Additionally, new versions of packages may require additional validation measures. 
- **Validation of Custom Code**: Every custom function, macro, or script needs rigorous documentation and validation to meet FDA standards ([read more here](https://www.r-project.org/doc/R-FDA.pdf)). 
  
### Macros and Functions
In FDA settings, macros and functions undergo stringent testing and validation. For example, each macro may include documented input/output specifications, expected vs. actual results, and limitations to meet regulatory standards.

## NIH-Funded Environment

While **data security and integrity** are still essential in NIH-funded studies, Part 11 compliance is typically not required, allowing more flexibility.

### SAS and Stata
- **Focus on Replicability**: You might still use SAS and Stata for NIH studies, but emphasis is on replicability rather than strict compliance documentation.
- **Macro Development**: Macros can be developed with more flexibility, focusing on efficiency. Documentation is still important for reproducibility but is generally less detailed than for FDA trials.

### R
- **Flexibility in Use**: R is widely used in NIH-funded studies due to its cost-effectiveness and flexibility. Part 11 compliance isn’t required, so validation is limited to ensuring project-team reproducibility. Commenting and version control remain best practices.
  
### Mplus
- **Modeling Focus**: With SEM programs like Mplus in NIH trials, you can focus more on modeling rather than validating each function for compliance. Scripts are developed with reproducibility in mind but without extensive regulatory documentation.

### Macros and Functions
Custom macros and functions are often created to streamline analyses, especially for complex tasks. Documentation is typically lighter, emphasizing reproducibility within the research team (e.g. annotated code) rather than regulatory standards.


<h2 id="references">References</h2>
<div class="footnotes">

<hr />

<ol>
<li id="fn:missing">O'Kelly, M., & Ratitch, B. (2014). Clinical trials with missing data: a guide for practitioners. John Wiley & Sons.<a class="footnote-return" href="#fnref:missing">↑</a></li>
