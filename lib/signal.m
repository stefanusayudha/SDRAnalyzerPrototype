classdef signal
  properties
    signal_stream;
    sampling_rate;
    duration_in_sec;
  endproperties

  methods(Static)

    function [y] = time_stream(sampling_rate, duration_in_sec)
      y = (0:1/sampling_rate:duration_in_sec)';
    endfunction

  endmethods

  methods

    function obj = signal(signal_stream,sampling_rate,duration_in_sec)
      obj.signal_stream = signal_stream;
      obj.sampling_rate = sampling_rate;
      obj.duration_in_sec = duration_in_sec;
    endfunction

    function plot(obj)
      time = signal.time_stream(obj.sampling_rate, obj.duration_in_sec);
      plot(time,obj.signal_stream);
    endfunction

  endmethods
endclassdef
