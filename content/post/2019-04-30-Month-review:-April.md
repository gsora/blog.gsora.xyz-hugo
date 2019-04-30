---
title: "Month Review: April"
date: 2019-04-30T14:57:39+02:00
draft: false
---

```
This is the first of a (hopefully) long series of posts in which I update you, my imaginary public, about what happened during past month, focusing particularly on projects I'm working on and all the achievements reached.

I believe that writing this kind of posts can boost my productivity, by keeping myself accountable for what I did, and what I didn't. 
```

This month's review will focus on what I'm mostly occupying my time with, creating Ocean and my bachelor's thesis.

<!--more-->

## Ocean

Ocean's development is going strong.

I'm focusing more on concluding all those university exams I yet have to give - just three! - but I really love this cute little _pet project_ so I tried finding enough time to care about it.

After all, I'm writing Ocean to ease one of the activities I love doing the most in the morning and evening, interacting with the fine people on [lobste.rs](https://lobste.rs).

The approach I originally thought for Ocean implied a server-side component, `oceanserver`, which acted like a proxy between the Android app itself and lobste.rs, by doing web scraping server-side and delivering JSON-formatted data.

I wasn't aware that lobste.rs already serializes in JSON most of the available data by just _asking it to do so_, simply appending `.json` at the end of a page URL (except for some endpoints, like the Recent one).

`oceanserver` was my baby just like Ocean, I loved the idea of having a piece of **Go** finally in production for a product I'm writing myself but managin one less piece of code is indeed easier.

It was a fun experience though! 

I learned that Go is an excellent tool to do blazing fast web scraping, and refined my scraping skills further.

## Bachelor's thesis

April has been an excellent month for my bachelor's thesis too.

I'm not yet ready to talk publicly about its content, but I can safely say it will be _interesting_, to say the least.

My thesis supervisor is happy regarding the development process I'm employing, I'm really happy about that!

I'm also working on an **hardware** proof-of-concept, which will partially realize what I'll express in the thesis paper itself.

I won't be able to add the PoC development in the paper though, I don't have enough time to do so, but I'm happy: just seeing such complex idea (at least for my technical skills!) realized in an almost finished product is awesome.

Anyway, I'm not a great writer - the average published post per month frequency agrees with me - and as a matter of fact I'm still at the initial drafting phase of the paper.


Since this is a rigorous document, I _must_ write it using **LaTeX**, which I love.

Unfortunately I find its syntax quite annoying, so I've hacked a small Makefile which allows me to write my thesis in **Markdown**, compile it in LaTeX with my custom template via **Pandoc** and then build a PDF with `pdflatex`.

This way I keep my focus on actually writing stuff instead of arguing with the LaTeX compiler!

I'm setting a new goal for May: having the first three chapters ready to be included in the final paper.

I truly hope to make it in time!

## Home server died!

My dearly Metropolis, the home server, has been offline for about two weeks.

No hardware faults though, rather my home connection has been a little bit unreliable lately.

Around mid-April I decided to take some time off and go visit my girlfriend, which lives at around 4 hours of train time from my house.

The morning before the departure an electrical failure essentially broke all the ISP's fiber equipment in a couple kilometers radius, and that was the last time Metropolis ever replied.

Some days after the failure the ISP itself replaced all the broken routers, but still Metropolis wasn't responding and sadly it won't before I come back home, around the beginning of May.

All this issue made me thing: having an home server is cool, but the connectivity and power delivery system simply isn't enough to run services with 99.9% SLA uptime.

This is why I decided to move most of of Metropolis services in a separate server (either virtual or dedicated) and keep just the Samba shares and seedbox at home, if any of those services dies I won't be _that_ concerned.

I yet have to decide **where** to host the services I need but I won't settle for the bare minimum, I want something that can host a Matrix and Pleroma private instance.

I should be able to find enough power for no more than 8€ per month, but we'll see.

## ThinkPad T400 small review

<a href="/assets/images/t400.jpg"><img src="/assets/images/t400.jpg" style="margin: 0 auto; display: block; width:75%"></a>

A couple years ago a dear friend (hello Edo!) found a crazy deal for a couple of decommissioned T400s, and as a ThinkPad aficionado I couldn't miss this opportunity.

This amazing machine, nicknamed _retroBFG_, is equipped with a 900p TN display, 6GB RAM, 128GB of solid state storage, Intel Core2Duo P8700 CPU, Intel+ATI graphics processors (!!), and obviously an amazing keyboard.

Until late-March, retroBFG have been used as home server (the first iteration of Metropolis ran on it!) but since my father needed a small, fast, portable notebook for his new job, I decided to gift him my X230.

So here I am, using an 11 years old notebook as my daily driver!

It runs _fine_ for most of my needs, but the old CPU simply cannot handle today's Javascript-riddled web experiences: it does lag with more than a couple tabs open in Firefox. 

All this time I spent with retroBFG made me realize what I really want from a notebook:

 - an IPS, 14 / 15.6 inches monitor with **exactly** 1080p resolution - I don't want to deal with high DPI nonsense anymore
 - at least 4 core/8 threads CPU, possibly AMD
 - NVMe SSD, at least 512GB
 - 16GB RAM, possibly expandable
 - full Linux/BSD compatibility

The Huawei Matebook D ticks most of those boxes, but right now I cannot afford one, and to be honest I'm not exactly sure it is fully Linux/BSD compatible.

The alternative is one of the new AMD-equipped ThinkPad, of course!

## Album of the month

April has been _th0ll_.

The album I listened the most this month has been **Periphery IV: HAIL STAN**.

Reccomended if you like harsh, hard, beautiful albums.
