+++
Description = ""
Tags = [
]
Categories = [
"project update"
]
menu = ""
date = "2017-05-02T14:40:06-04:00"
title = "Systematization and Project Roadmap"
+++

# Spring Deliverable
As part of the [University of Virginia](http://virginia.edu)'s Spring 2017 [graduate seminar
on Transport Layer Security (TLS)](https://tlseminar.github.io/), our project
team has continued to investigate modern issues surrounding usable privacy and
security of web browsing.
The Line of Trust project seeks to understand the security, privacy, and human-factors related to a class of phishing 
and picture-in-picture attacks known collectively as the [Line of Death](https://textslashplain.com/2017/01/14/the-line-of-death/). 
Contextualizing relevant literature and systematically analyzing the underlying
problems in the Line of Death space will contribute to a Systematization of
Knowledge (SoK) paper, which we intend to augment with a thoughtful user study. 
The goal of this blog post is to present the culmination of our work throughout the last
six weeks of the semester and provide a roadmap for our team's plans to move
forward through the summer months.

TODO: Add anything else relevant to the project overview and this post's
overview here.

# Presentation
<script async class="speakerdeck-embed"
data-id="710bc0557e1240d9a9d209d1ed14ddde" data-ratio="1.33333333333333"
src="//speakerdeck.com/assets/embed.js"></script>

[TLSeminar](https://tlseminar.github.io/)'s mini-conference provided our team
the opportunity to motivate and present our project work during the latter half
of the semester. Our presentation (above) focused on describing the research
problem through a case study of an elaborate picture-in-picture [Microsoft Support Webpage
Scam](https://www.tripwire.com/state-of-security/latest-security-news/tech-support-scam-uses-website-elements-spoof-microsoft-support-page/) 
reported in March 2017.

TODO: Talk about the presentation and its slides for a few paragraphs and relate it to what we are
posting below. In particular, discuss the relevance of the Microsoft support
picture-in-picture case study.

# Introduction
The state of web browser client UI today is best described as a disjoint medley of vulnerabilities, contradictory design principles, and implied security conditions.  Apart from the overarching design paradigm of a URL bar perched above page content with a tab-interface situated nearby, almost all aspects of contemporary web browsers vary from one vendor to the next.  There exist no universal security indicators, nor are the relative levels of security—think mixed HTTPS vs full HTTPS—ever explicitly presented to consumers of these products.  Warning prompts, pop-ups, and alerts are all handled differently.  Settings are difficult to find.  Extensive assortments of flags, optional settings, and advanced content featuers are tucked away far beneath the visible surface of the browser interface. 

This industry-wide abuse of basic UI principles has resulted in a number of frightening security implications for everday users—issues that have largely gone unaddressed in the security community for the past decade.  Though major vendors like Google (developer of the Chromium project and the Chrome web browser) have taken steps to address some of the more sophisticated UI security issues plaguing web browsers, much more must be done to provide a sense of security for the vast majority of average Internet users who are most vulnerable.

This post is the result of six weeks of brainstorming, reading, contemplating, presenting, and concerted discussion surrounding web browser UI security.  In it, we seek to provide a framework to systematize current and proposed approaches aimed at improving web browser client UI, venturing as far as offering a few suggestions of our own.

Before we delve into that, however, some motivation is in order.

## The Line of Death
In January of this year, Eric Lawrence, writing for _text/plain_, published an [article](https://textslashplain.com/2017/01/14/the-line-of-death/) about an intriguing concept he coined the "Line of Death" that demarcates trusted from untrusted content in a web browser.  Consider the image below.

![The Line of Death (text/plain)](https://textplain.files.wordpress.com/2017/01/image36.png?w=1440&h=584 "The Line of Death")

As you can see, the page, _www.example.com_, exercises full control over the content below the red dotted line—the "line of death."  Consequently, as a user, you should not trust anything below this line that appears to be imitating a legitimate browser function.  For example, consider a malicious page attempting to redirect you to a spyware site.  The page may generate a fake element that looks like a generic "alert" box, but since it appears below the line of death, the user should assume that it may be fake and thus refrain from clicking.  As one would imagine, this notion is problematic—_real_ alert boxes actually _do_ appear in the untrusted page content!  How are average users expected to differentiate between legitimate alerts hovering _above_ the browser window and fake alerts displayed _within_ the browser window?  Making matters worse, malicious developers can even deploy JQuery scripts that cause their fake alert boxes to mimic the UI functionality of legitimate boxes—click and drag, "cancel," etc.  This mimicry is not limited to alert boxes; page elements such as download prompts, microphone/camera permission prompts, and plugin prompts are all vulnerable to imitation.  

We can extend this basic line of death example even further by imaging a scenario in which the _entire trusted UI_ —tab bar, URL bar, bookmarks, HTTPS status—are spoofed within the untrusted content area.  _But that would be so obvious_, you exclaim!  Well, as we shall see, this so-called "picture-in-picture" attack is most potent when the user enters full-screen mode, wherein the trusted UI portion disappears from view to provide the user with more screen space.  An unsuspecting user could _easily_ forget that a URL bar should not be present and simply trust the URL bar and security indicators that happen to be dispalyed in the spoofed UI.  For example, in the image below, the entire legitimate, trusted browser UI one would expect to see while visiting PayPal.com is spoofed and displayed _inside the untrusted content area_.

![Picture-in-Picture Attack (text/plain)](https://textplain.files.wordpress.com/2017/01/image40.png?w=1516&h=982 "Picture-in-Picture")

## Certified Malice
In a [follow-up piece](https://textslashplain.com/2017/01/16/certified-malice/) to _Line of Death_ published only two days following the original article, Eric Lawrence presented another, more insidious browser UI weakness:  malicious websites can just as easily acquire HTTPS certificates as legitimate websites.  This so-called "certified malice" renders the identification of illegitimate spoofing sites nearly impossible.  In this threat model, phishing sites attempting to masquerade as legitimate sites "secure" their pages with HTTPS certificates, leading users— _generations of whom have been trained to trust the green lock_ —to believe the malicious site is "good."  (We cannot help but point out the obvious irony:  HTTPS certificate proliferation helps the bad guys, too!)

Clearly, this intricate web of UI, security, and social engineering issues necessitates attention to ensure average web browsers do not go astray attempting to check email online.  The two articles referenced above were published _less than four months ago_ and represent the _only_ contemporary inquiries into web browser UI problems.  In fact, it seems that most serious academic work in this area ceased about ten years ago.  This abrupt end to the study of web phishing attacks could mean one of three things:

1. Web phishing is a hard problem with few clear answers, therefore it's difficult to be published, hence the lack of published papers.
2. No one cares about web phishing anymore.  It's not cool.
3. The research community has been focusing on other pursuits in the past decade but would certainly investigate these issues if given a friendly reminder.

We maintain a firm belief in option #3, and in the potential for future investigation and academic work.  This systematization and roadmap seeks to codify that belief.

# Systematization
## Overview
TODO: Describe the general approach to our systematization (talk about the 6 questions
Bill came up with and why we choose them for our analysis). A couple paragraphs
in total should suffice. Just take the six questions below and justify/summarize
them with a few sentences each.

1. What problem(s) does the resource address?
2. How does the problem relate to web browser UI?  If so, how?
3. What solution(s) is proposed?
4. Are the solutions relevant to web browser UI? If so, how?
5. What are the pros and cons of the solutions with respect to security,
   usability, and ease of adoption?
6. [only if viable] Based on the resource, how would you suggest proceeding with
   the implementation of the solution?

## Paper 1
TODO: Perform the systematization analysis on each paper you have read using our
methodology as described aboce.

## Paper 2

## Paper N ... etc

## Conclusion/Tie-In
TODO: Relate the systematizations and discuss their purpose in our target of
motivating the need for research in the Line of Death class of attacks.

# Deliverable Conclusion and Project Roadmap
In this blog post, we first motivated and described our semester's efforts 
towards the Line of Trust project, using our class presentation slides and a
[compelling case
study](https://www.tripwire.com/state-of-security/latest-security-news/tech-support-scam-uses-website-elements-spoof-microsoft-support-page/). 
Secondly, we detailed and evaluated our methodology for systematizing research 
literature and community blog posts of significance to
 the Line of Death class of attacks.
Thirdly, we coalesced and analyzed a variety of literature according to our
systematization techniques, and constructed general relationships between the class of
problems uncovered in our literature systematization.

As the semester is coming to an end, our plans for the future of the project
are as follows:

- We intend to continue work on the Line of Trust project during the summer
months, with the goal of submitting a qualitative Systematization of Knowledge
research paper to a conference in the fall term.
TODO: 
- Discuss our goals in designing and carrying out a thoughtful user study
- Discuss our goals in polishing/refining our systematization techniques
- Discuss other ideas/routes/directions for the SoK that we want to consider

# References
TODO: Include all paper references and blog posts as links in the post's
content. Remove this section once you're done!
