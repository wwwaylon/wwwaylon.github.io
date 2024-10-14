# Level of Involvement: FTE Support and Expected Contributions

<p><h2>Table of Contents</h2>
<nav id="TableOfContents">
<ul>
<li><a href="#introduction">Introduction</a></li>
<li><a href="#qqq-involvement">QQQ Involvement</a></li>
<li><a href="#a-need-for-innovation">A Need for Innovation</a></li>
<li><a href="#the-next-generation">The Next Generation</a>
<ul>
<li><a href="#extensive-involvement">Extensive Involvement</a></li>
<li><a href="#jax">JAX</a></li>
</ul></li>
<li><a href="#conclusion">Conclusion</a></li>
<li><a href="#references">References</a></li>
</ul>
</nav>

<h2 id="introduction">Introduction</h2>

<p>As the demands of research projects vary widely in scope and complexity, defining levels of support—ranging from extensive to very limited involvement—becomes crucial. Each level not only clarifies the roles and responsibilities of biostatisticians but also ensures that the project&rsquo;s needs are adequately met. Let’s delve deeper into why these distinctions are necessary.<sup class="footnote-ref" id="fnref:mlcoursera"><a href="#fn:mlcoursera">1</a></sup>.</p>

1. Tailored Expertise for Project Needs
Different research projects require varying degrees of statistical expertise. By categorizing involvement levels, organizations can effectively match biostatistical resources with the specific needs of a project. For instance, projects that require methodological development—such as designing innovative statistical models or handling intricate study designs—benefit greatly from the Extensive Involvement level, where statisticians lead and shape the analytical framework. This tailored approach ensures that the right expertise is applied where it’s most needed, enhancing the overall quality and reliability of the research.

2. Efficient Resource Allocation
When biostatisticians are assigned roles based on their level of involvement, it allows for better resource management. For example, a project requiring only routine statistical analyses may not need a full-time biostatistician leading methodological developments. By defining a Regular Involvement level (15% FTE), organizations can allocate biostatisticians effectively, reserving more intensive support for projects that truly warrant it. This efficiency not only optimizes costs but also helps maintain a balanced workload among team members.

3. Clear Communication and Expectations
Defining levels of involvement establishes clear communication channels and expectations between researchers and biostatisticians. When a biostatistician’s role is clearly articulated, all parties involved understand what to expect in terms of support, contributions, and deliverables. For instance, in a Limited Involvement scenario (10% FTE), where the biostatistician primarily offers consultation and minimal analysis, the Principal Investigator (PI) knows that they need to prepare for self-directed statistical work. This transparency helps prevent misunderstandings and fosters a collaborative environment.

4. Facilitating Professional Development
When biostatisticians are aware of their expected level of involvement, it provides a framework for professional growth. Those in Extensive Involvement roles have opportunities to lead, innovate, and develop advanced methods, while those in Very Limited Involvement roles (5% FTE) can gain exposure to different projects and understand the demands of higher levels of engagement. This structure allows biostatisticians to gradually build their skills and experience, enhancing their overall competency and career progression.

5. Ensuring Quality and Accountability
By establishing specific levels of involvement, organizations can uphold high standards of quality and accountability. Each level comes with distinct responsibilities and expected contributions, making it easier to assess performance and outcomes. For instance, a biostatistician actively leading publications in the Extensive Involvement category is accountable for the rigor of the methodologies and analyses presented. In contrast, those in Limited or Very Limited Involvement roles can focus on providing essential insights without the pressure of full authorship. This tiered approach ultimately leads to better research quality and credibility.

6. Adaptability to Project Dynamics
Research projects are often dynamic, with changing requirements as they progress. Having defined levels of involvement allows for adaptability; if a project transitions from a routine analysis to more complex demands, statisticians can adjust their roles accordingly. This fluidity ensures that all statistical aspects of the research remain robust and responsive to evolving needs.

---

<p>So what made AlexNet stand out so much? I believe the answer lies in the tools researchers had at their disposal, enabling them to run artificial neural networks on GPU accelerators,
a relatively novel idea at the time.
In fact, Alex Krizhevsky&rsquo;s former colleagues recall that many meetings before the competition consisted of Alex describing his progress with the CUDA quirks and features.</p>

<p>Now let us travel back to 2015 when ML research article submissions started blowing up across the board,
including (re-)emergence of many now promising approaches such as generative adversarial learning, deep reinforcement learning,
meta-learning, self-supervised learning, federated learning, neural architecture search, neural differential equations, neural graph networks, and many more.</p>

<p><img src="/assets/img/bar-support.png" alt="" />
<span class="source">Adapted from <a href="https://onlinelibrary.wiley.com/doi/epdf/10.1002/sta4.679" target="_blank">Slade, et al. (2024)</a>. </span> <sup class="footnote-ref" id="fnref:flextime"><a href="#fn:flextime">1</a></sup></p>


<p>One could claim that this is just a natural outcome of the AI hype. However, I believe a significant factor was the emergence of the second generation of general-purpose
ML frameworks such as TensorFlow<sup class="footnote-ref" id="fnref:tf"><a href="#fn:tf">4</a></sup> and PyTorch<sup class="footnote-ref" id="fnref:pt"><a href="#fn:pt">5</a></sup>, along with NVIDIA going all-in on AI. The frameworks that existed before, such as Caffe<sup class="footnote-ref" id="fnref:caffe"><a href="#fn:caffe">6</a></sup> and Theano<sup class="footnote-ref" id="fnref:theano"><a href="#fn:theano">7</a></sup>,
were challenging to work with, and awkward to extend, which slowed down the research and development of novel ideas.</p>

<h2 id="a-need-for-innovation">A Need for Innovation</h2>

<p>TensorFlow and PyTorch were undoubtedly a net positive, and the teams worked hard to improve the libraries.
Recently, they delivered TensorFlow 2.0 with a more straightforward interface along with eager mode<sup class="footnote-ref" id="fnref:tfe"><a href="#fn:tfe">8</a></sup>,
and PyTorch 1.0 with JIT compilation of the computation graph<sup class="footnote-ref" id="fnref:ts"><a href="#fn:ts">9</a></sup> as well as support for XLA<sup class="footnote-ref" id="fnref:xla"><a href="#fn:xla">10</a></sup> based accelerators such as TPUs<sup class="footnote-ref" id="fnref:tpu"><a href="#fn:tpu">11</a></sup>.
However, these frameworks are also beginning to reach their limits, forcing researchers into some paths while closing doors on others, just like their predecessors.</p>

<p>High-profile DRL projects such as AlphaStar<sup class="footnote-ref" id="fnref:alphastar"><a href="#fn:alphastar">12</a></sup> and OpenAI Five<sup class="footnote-ref" id="fnref:dota"><a href="#fn:dota">13</a></sup> not only utilized large-scale computational clusters
but also pushed the limits of deep learning architecture components by combining deep transformers, nested recurrent networks, deep residual towers, among others.</p>

<p>In his <a href="https://www.thetimes.co.uk/article/demis-hassabis-interview-the-brains-behind-deepmind-on-the-future-of-artificial-intelligence-mzk0zhsp8" target="_blank">interview with The Times newspaper</a>,
Demis Hassabis has stated that DeepMind will be focusing on applying AI directly for scientific breakthroughs.
We can already see a glimpse of that shift in direction with some of their recent Nature articles on neuroscience<sup class="footnote-ref" id="fnref:dopamine"><a href="#fn:dopamine">14</a></sup> and protein folding<sup class="footnote-ref" id="fnref:alphafold"><a href="#fn:alphafold">15</a></sup>.
Even a brief skim through the publications is enough to see that the projects required some unconventional approaches when it comes to engineering.</p>

<p>At NeurIPS 2019, probabilistic programming and bayesian inference were hot topics, especially uncertainty estimation and causal inference.
Leading AI researchers presented their visions on what the future of ML might look like.
Notably, Yoshua Bengio described transitioning to <a href="https://slideslive.com/38921750/from-system-1-deep-learning-to-system-2-deep-learning" target="_blank">system 2 deep learning</a>
with out-of-distribution generalization, sparse graph networks, and causal reasoning.</p>

<p>To summarize, some of the requirements for next-gen ML tools are:</p>

<ul>
<li>fine-grained control flow use</li>
<li>non-standard optimization loops</li>
<li>higher-order differentiation as a first-class citizen</li>
<li>probabilistic programming as a first-class citizen</li>
<li>support for multiple heterogeneous accelerators in one model</li>
<li>seamless scalability from a single machine to gigantic clusters</li>
</ul>

<p>Ideally, the tools should also maintain a clean, straightforward, and extensible API, enabling scientists to research and develop their ideas rapidly.</p>


---

<h2 id="extensive-involvement">Extensive Involvement</h2>    

*More than 20% FTE*

- **Methodological Development**: Leads the development and application of new or advanced methods.
- **Study Design**: Develops and applies complex study designs.
- **Analysis**: Performs complex statistical analyses.
- **Publications**: Actively leads publications, writing most of the methods and results sections.
- **Conferences**: Participates in conferences (panels, posters, talks) with potential travel required.
- **Meetings**: Attends all relevant project/department meetings.

---

**Regular Involvement**  
*15% FTE*

- **Study Design**: Contributes to study design and implementation.
- **Analysis**: Handles routine statistical design and analysis using standard statistical software.
- **Publications**: Actively contributes to writing methods and results sections of publications.
- **Meetings**: Attends all relevant project/department meetings.

---

**Limited Involvement**  
*10% FTE*

- **Consultation**: Provides consultation to the Principal Investigator (PI) on appropriate statistical methods.
- **Advisement**: Primarily advises study staff on performing statistical analyses.
- **Analysis**: Conducts limited statistical analyses.
- **Publications**: Involved in publications by helping interpret statistical results and outlining limitations (minimal writing).
- **Meetings**: Attends project/department meetings occasionally, typically to address specific issues or questions.

---

**Very Limited Involvement**  
*5% FTE*

- **Consultation**: Offers minimal consultation to the PI regarding statistical methods.
- **Advisement**: Provides restricted advice to study staff on conducting analyses.
- **Analysis**: Does not perform any statistical analyses.
- **Publications**: Does not contribute to publications or authorship.
- **Meetings**: Does not regularly attend meetings.


<h2 id="references">References</h2>
<div class="footnotes">

<hr />

<ol>
<li id="fn:flextime">Slade, E., Robbins, S. J. K., McQuerry, K. J., & Mangino, A. A. (2024). The value of flexible funding for collaborative biostatistics units in universities and academic medical centres. Stat, 13(2), e679. <a class="footnote-return" href="#fnref:flextime">↑</a></li>
