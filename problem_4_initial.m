function [ f ] = problem_4_initial( x )
A=5;
x0=4;
sig=0.5;
q=2*pi;

% f = A*exp(-(x-x0)^2/(2*sig*sig) )*cos(q*(x-x0));
f=A*exp(-(x-x0)^2/(2*sig^2))*cos(q*(x-x0));
end