library(shiny)

# setwd("C:/Users/mjaffe/Documents/CourseraandOpenedx/_DataScience(Hopkins)/DevelopingDataProducts")
# runApp()

# UI for Spectral Leakage Demo - MBJaffe 7/24/2014
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Spectral Leakage Demonstration (MBJ)"),
        
        # Sidebar with a sliders and checkboxes
        
        sidebarLayout(
                
                sidebarPanel(
                        headerPanel("Settings"),
                        sliderInput("Phase","Offset (degrees):",min = 0, max = 90, value=0),
                        sliderInput("SRate","Sampling Rate (samples/sec):",min = 16, max = 2048, value=128),
                        sliderInput("NSecs","Length (seconds):",min = 1, max = 32, value=8),
                        sliderInput("NCycl","Cycles:",min = 1, max = 16, value=4),
                        checkboxInput("Window", label = "Enable Windowing (Hanning)", value = FALSE),
                        checkboxInput("HFCycle", label = "Half Cycle", value = FALSE),
                        h6("Offset-Varies the phase from 0 to 90 degrees for the waveform (at zero a sine is displayed at 90 a cosine is displayed)"),
                        h6("Sampling Rate-varies the sampling rate (in samples/sec)"),
                        h6("Length-varies the length of the waveform (in seconds)"),
                        h6("Cycles-varies the number of waveform cycles over the time interval"),
                        h6("Enable Windowing (Hanning)   - enables windowing"),
                        h6("Half Cycle-Adds a 1/2 cycle to the waveform - creating a discontinuity")
                                
                        
                        ),
                
               
                
                # Show plots of waveform (if windowed) and log magnitude of output
                mainPanel(
                        
                        plotOutput("distPlot"),
                        textOutput("text1"),
                        h6("Background- One of the most important tools with time series analysis is the Fourier Transform which allows one to see the underlying frequency components of a waveform.  With Fourier analysis, the waveform is approximated by the sums of a series of sinusoidal functions (e.g. sine and cosine). In this demonstration a sampled periodic input signal (e.g. a sinusoid) is used.  Note that the Fourier transform math assumes the input is periodic.  If the sequence does finish on a whole number of periods the results match the theoretical but if not (as usually is the case with real data) - a discontinuity is introduced, complicating the interpretation of the results. (for a more detailed discussion see http://astro.berkeley.edu/~jrg/ngst/fft/leakage.html) To address this problem, window functions are applied so that this discontinuity is eliminated.  There is a literature on optimal windowing functions that vary based on what you are trying to discern from the time series.  For example, if you are trying to discern two closely spaced frequency components one windowing function is more optimal and if you are trying to discern two frequency components that are not closed spaced by have substantial difference in magnitude then another windowing function would be appropriate. However, most of the time this is not known so general purpose windowing functions such as the Hanning are used."),
                        h6("Suggested-Try running without using the checkboxes.  To see the effect of windowing select the windowing checkbox and observe the effect on the waveform and frequency content. Note that the frequency components are plotted on a log scale.  The idealized sine drops off by over 30 dB whereas the Hanning windowed sine only exhibits about a 10 db dropoff (after the sidelobe). Note that the introduction of the discontinuity (check half cycle) make discerning the sine very difficult but if you then enable windowing the max frequency can better visualized.")  

                )
        )
))