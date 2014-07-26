---
title       : Spectral Leakage 
subtitle    : Demonstration with Shiny App (JHU Coursera)
author      : Mike Jaffe
job         : Cardiorespiratory Consulting, LLC
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Spectral Leakage

**Fourier Analysis** 
- Waveform approximated by sums of sinusoids
- Important tool with time series analysis 
- FFT digital implementation (fft() in R)
- Assumes sequence repeats (i.e. is periodic) - often leads to discontinuity
- Windowing used to handle the resulting "spectral leakage"

<img src="C:/Users/mjaffe/Documents/CourseraandOpenEDx/_DataScience(Hopkins)/DevelopingDataProducts/spectral/assets/fig/discont.jpg" alt="Maxim"/>
(Adapted from Maxim website)

See http://mbjengineering.shinyapps.io/runApp/ to explore these concepts further. 

--- .class #id 

## Ideal Situation (pure sinusoid with no waveform discontinuity)

Over30 db difference between fundamental frequency and surrounding frequencies
 
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1.png) 

--- .class #id 

## Discontinuity - pure sinusoid with discontinuity

The fundamental frequency difficult to visualize.

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2.png) 

--- .class #id 

## Windowing - pure sinusiod with discontinuity and Hanning Window Applied

The fundamental is visible with approx. a 10 db decrease in surrounding frequencies.

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3.png) 
