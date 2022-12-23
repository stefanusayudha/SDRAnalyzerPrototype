classdef cos_signal < signal

  methods

    function obj = cos_signal(phase, freq, sampling_rate, duration_in_sec)
      t = signal.time_stream(sampling_rate, duration_in_sec);
      s = cos(phase+2*pi*freq*t);
      obj@signal(s, sampling_rate, duration_in_sec);
    end

  endmethods

endclassdef
