#!/opt/homebrew/bin/octave --persist

addpath("lib");

% arguments buffer
spectrums=[];
sampling_rate=44100;
duration_in_second=.5;

% decoding input arguments
arg_list = argv ();

for i = 1:nargin
  switch (arg_list{i})
    case "-s"
      sampling_rate = str2num(arg_list{i+1});
    case "-f"
      for fr = strsplit (arg_list{i+1}, ",")
        spectrums(length(spectrums)+1) = str2num(fr{1});
      endfor
    case "-d"
      duration_in_second = str2num(arg_list{i+1});
    otherwise
      
  endswitch
endfor

% running simulation
compound = compound_signal(spectrums, sampling_rate, duration_in_second);
compound.plot;

%exit