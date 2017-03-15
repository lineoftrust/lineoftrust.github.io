+++
menu = ""
date = "2017-03-15T13:51:23-04:00"
title = "Welcome!"
Description = ""
Tags = [
  "talk",
  "lineoftrust",
]
Categories = [
  "project update",
]

+++

## Introducing the Line of Trust (LOTr)

***Erasing the line of death for fun and pleasure***

### Motivation
The [Line of Death (LoD)](https://textslashplain.com/2017/01/14/the-line-of-death/) is a class of web
browser attacks that target the very pixels of a browser UI on a given webpage,
especially with regards to the (presumably) browser-controlled portion of the UI above
webpage content.

![](/images/lod.png)
The Line of Death. *[Image credit](https://textslashplain.com/2017/01/14/the-line-of-death/)*

LoD attacks span the spectrum from manipulating URL names and tabs to spoofing new browser windows within the
webpage's content area:

![](/images/zone4.png)
Webpage controlled content. *[Image credit](https://textslashplain.com/2017/01/14/the-line-of-death/)*


[Certified Malice](https://textslashplain.com/2017/01/16/certified-malice/) is a
phishing attack that deceives users into trusting a page that looks nearly identical 
to the real site, including TLS certificates with realistic naming schemes.
This threat becomes even more potent if combined with URL pixel manipulation.

Given the broad range of LoD-inspired attacks that have surfaced in the past
year, the [Line of Trust](/) project seeks to improve the level of security a
browser provides when compromises to trusted UI pixels and spoofed browser notifications are
detected.

### Goals for Line of Trust

Specifically, we are interested in developing baked-in browser warnings for content that is
suspected to be a LoD attack. We will be using [Google
Chromium](https://chromium.org) to develop LOTr.

Our overarching goal is to reduce the feasibility of LoD attacks while providing
increased transparency to the end-user. We are currently considering various computer
vision techniques to build LOTr.

### Contributors
- Sam Havron, undergraduate student at the University of Virginia
- Anant Kharkar, undergraduate student at the University of Virginia
- Bill Young, graduate student at the University of Virginia
- Dave Evans, project advisor and computer science professor at the University of Virginia