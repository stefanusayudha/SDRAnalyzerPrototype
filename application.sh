#!/opt/homebrew/bin/octave --persist

clear all
close all
clc

addpath("lib")

spectrums = [ 100 200 300 ]
sampling_rate = 44100;
duration_in_second = .05;

compound = compound_signal(spectrums, 44100, .05);
compound.plot;
