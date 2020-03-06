function [  ] = problem4_hyperbolic_02( )
N=99;
M=4999;
L = 8;                  % when L is 2 you are getting the reflection, when L
A= 5;
T = 5;                  %try with big n as 399
t0 = 0;
x0 = 4;
sig=0.5;
q=4*pi;

delta_t = (T-t0)/(M+1);
delta_x = (L-x0)/(N+1);
velocity = 2;
x = linspace(x0,L,N+2);
t = linspace(t0,T,M+2);

for i=1:N+2
    u(1,i) = problem_4_initial(x(i));
    u(2,i) = u(1,i);
end
figure;
subplot(4,1,1);
plot(x,u(1,:),'r')
plot(x,u(2,:),'-')
title('initial condition')

for n = 2:M+1
    for i= 2:N+1
        u(n+1,i) = 2*u(n,i) - u(n-1,i) + velocity * ((delta_t/delta_x)^2) * (u(n,i+1) + u(n,i-1) - 2*u(n,i)) + velocity * ((delta_t/delta_x)^2)* ((u(n,i+1)-u(n,i-1))/2*delta_x);
    end
    u(n+1,N+2)=u(n+1,2);
    u(n+1,1)=u(n+1,N+1);
end

subplot(4,1,2);
plot(t,u(:,1), '*');
title('1st boundary')

subplot(4,1,3);
plot(t,u(:,N+2), '*');
title('2nd boundary')

subplot(4,1,4);
plot(x,u(1000,:),x,u(2000,:),x,u(3000,:));
title('wave in 2-dimension');

figure
    subplot(1,1,1);
    plot(x,u(1,:),'r*',x,u((M+1)/2,:),'y*',x,u(M+2,:),'b*');

    figure;
mesh(x,t,u);

axis([0,L,-10,10])
set(gca,'Nextplot','replacechildren');

for n=1:10:M+2
    plot(x,u(n,:))
    Guitar(n)=getframe;
end

movie(Guitar);
end
