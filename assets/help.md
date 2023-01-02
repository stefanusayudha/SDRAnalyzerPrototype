# FFT Analyzer Symulator

options:
  -h Show help
  -f Spectrum list / list of frequencies seprated by ","
  -s Sampling rate. Default = 44100
  -d Duration in second. Default = .5
  -p Pinch, select frequency you want to observe, ex: 100. Default = -1. to observe full bandwidth.
  -b Band Gap. Chose frequency range. Ex: if pinch set to 150 and band gap 100, plot will display frequency in range 50 to 250 hz. Default = -1 to observe full bandwidth.

example:
./fft_simulation.sh -f 100,200 -d .1 -s 44100 -p 150 -b 100

created by : stefanus.ayudha@gmail.com
github : https://github.com/stefanusayudha

# end help
