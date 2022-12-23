classdef compound_signal
  properties
    frequencies;
    signal_stream;
    sampling_rate;
    duration_in_second;
  endproperties

  methods(Access=private)

    function [] = subplot_components(obj)
      plot_counter = 0;
      plot_col = length(obj.frequencies);
      for i =  obj.frequencies
        s = sin_signal(0,i,obj.sampling_rate,obj.duration_in_second);

        subplot(2,plot_col,plot_counter+1);
        s.plot
        xlabel ("time");
        ylabel ("magnitude");
        title (sprintf ("freq = %d", i));

        plot_counter = plot_counter + 1;
      endfor
    endfunction

    function [] = subplot_compound(obj)
      time = (0:1/obj.sampling_rate:obj.duration_in_second)';
      plot_col = length(obj.frequencies);

      subplot(2,plot_col,plot_col+1);
      plot(time,obj.signal_stream);
      xlabel ("time");
      ylabel ("magnitude");
      title ("Compound Signal");
    endfunction

    function [] = subplot_fft(obj)
      time = (0:1/obj.sampling_rate:obj.duration_in_second)';
      plot_col = length(obj.frequencies);

      mfft = fft(obj.signal_stream);
      L = length(time);
      P2 = abs(mfft/L);
      P1 = P2(1:L/2+1);
      P1(2:end-1) = 2*P1(2:end-1);
      f = obj.sampling_rate*(0:(L/2))/L;

      subplot(2,plot_col,plot_col+2);
      plot(f,P1);
      xlabel ("freq");
      ylabel ("magnitude");
      title ("FFT");
    endfunction

  endmethods

  methods

    function obj = compound_signal(array_freq,sampling_rate,duration_in_second)
      buffer = sin_signal(0,0,sampling_rate,duration_in_second).signal_stream;

      for i = array_freq
        buffer = buffer + sin_signal(0,i,sampling_rate,duration_in_second).signal_stream;
      endfor

      obj.frequencies =  array_freq;
      obj.signal_stream = buffer;
      obj.sampling_rate = sampling_rate;
      obj.duration_in_second = duration_in_second;

    endfunction

    function [] = plot(obj)
      obj.subplot_components
      obj.subplot_compound
      obj.subplot_fft
    endfunction

  endmethods
endclassdef
