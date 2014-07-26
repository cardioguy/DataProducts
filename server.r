library(shiny)

# Server Logic for Spectral Leakage Demonstration - MBJaffe 7/26/14
shinyServer(function(input, output) {
        
        # Generates two plots (all calculations embedded)
        # one of waveform (with windowing applied) and output
        # Also indicates location of peak and value

        
        output$distPlot <- renderPlot({
                offsetdeg    = input$Phase    # offset in degrees
                samplingrate = input$SRate    # samples per second
                leninsec     = input$NSecs    # number of secs
                nbrcycles    = input$NCycl    # number of cycles
                windowing    = input$Window   # boolean for windowing
                HFCycle      = input$HFCycle  # boolean for half cycle to illustrate leakage
                
                if (HFCycle) nbrcycles = nbrcycles + 0.5 
                
                nbrpts = samplingrate*leninsec
                offset = offsetdeg*(2*pi)/360
                
                indices = nbrcycles*c(0:(nbrpts-1))*(2*pi)/(nbrpts)
                waveform = sin(indices+offset)
                
                
                # windowing
                if (windowing) {
                        # Hanning
                        windices = c(0:(nbrpts-1))*((2*pi)/(nbrpts-1))
                        window= 0.5*(1-cos(windices))
                        waveform = window * waveform  
                }
                
                par( mfrow = c( 1, 2 ) )
                timeindices = c(0:(nbrpts-1))/samplingrate
                plot(timeindices,waveform, type='l',xlab="Time(seconds)", col = 'darkgray')
                
                # Fourier Transform
                finput = waveform - mean(waveform)
                fftout = fft(finput)
                realpart = Re(fftout)
                imagpart = Im(fftout)
                magn = sqrt (realpart*realpart+imagpart*imagpart)
                
                # symmetric - toss half and only plot region around peak
                ptstoplot = (nbrpts/2)
                submagn    = magn[1:ptstoplot]
                maxval = max(submagn)
                maxpos = which.max(submagn)
                maxfreq= samplingrate/(maxpos-1)
                if ((maxpos*2) < ptstoplot) {
                        ptstoplot =maxpos*2
                        submagn    = submagn[1:ptstoplot]
                }

                subindices = (0:(ptstoplot-1))*(samplingrate/nbrpts)
                logsubmagn = log(submagn)
                plot(subindices,logsubmagn,ylab="log(Magnitude)",xlab="Frequency(Hz)",type='p')
                
        })
        
        output$text1 <- renderText({ 
                paste("Max Freq at", (input$NCycl/input$NSecs)," Hz")
        })
})