classdef sin_signal < signal
  methods

    function obj = sin_signal(phase, freq, sampling_rate, duration_in_sec)
      t = signal.time_stream(sampling_rate, duration_in_sec);
      s = sin(phase+2*pi*freq*t);
      obj@signal(s, sampling_rate, duration_in_sec);
    end

  endmethods
endclassdef
