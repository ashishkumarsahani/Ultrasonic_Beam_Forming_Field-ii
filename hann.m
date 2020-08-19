function [ win ] = hann(length)
%HANN creates hann window with length 'length'
%   Hann window characteristics:
%     Peak Side-Lobe Amplitude (Relative): -31dB
%     Approximate Width of Main Lobe     : 8 * pi / length
%     Peak Approximation Error           : -44dB
%     Equivalent Kaiser Window           : beta = 3.86
%     Transition Width of eq. Kaiser Win : 5.01 * pi / length
    N = length - 1;
    n = -(N/2) : (N/2);
    win = 0.5 * ( 1 + cos( 2*pi*n/N));
    win = win';
end