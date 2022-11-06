function [r] = interp_rot(x,y,xq)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s=spline(x,y,xq);

zeros = find(~s);








end