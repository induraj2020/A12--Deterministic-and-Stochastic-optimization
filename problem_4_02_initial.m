function [ f ] = problem_4_02_initial( x )
A=5;
x0=4;
sig=0.5;
q=2*pi;

f = A*exp(-(x-x0)^2/(2*sig*sig) )* ( (x-x0)^2/(sig*sig)*cos(q*(x-x0))*cos(q/2)+2*sin(q*(x-x0))*sin(q/2)) ;
