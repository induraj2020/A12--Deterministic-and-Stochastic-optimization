function [  ] = problem_2_neuman( N,M )
    
    L=1; T=0.1; delta_x= (L)/(N+1); delta_t= T/(M+1);         
    x = linspace(0,L,N+2);                                  
    t= linspace(0,T,M+2);
    
    for i=1:N+2;
        u(1,i)=problem_2_initial_condition(x(i));         
    end
    
    figure
    subplot(3,1,1)
    plot(x,u(1,:),'r*') ;              
    title('initial condition')          
    
   
    for n=1:M+1;
        for i=2:N+1;
            u(n+1,i)= u(n,i)+ delta_t*((u(n,i+1)+u(n,i-1)-2*u(n,i))/delta_x^2) + (delta_t*u(n,i)) + delta_t*((t(n)-1)*(x(i)-1)); 
        end
        u(n+1,1)=u(n+1,2)-delta_x*(-7*t(n)+sin(10*pi*t(n)));
        u(n+1,N+2)=u(n+1,N+1)+ delta_x*(100*t(n)*t(n));
    end
    subplot(3,1,2)
    plot(t,u(:,1),'*');
    title('1st boundary condtion')
    
    subplot(3,1,3)
    plot(t,u(:,N+2),'*');
    title('2nd boundary condtion')               
    
    
    figure
    subplot(1,1,1);
    plot(x,u(1,:),'r*',x,u((M+1)/2,:),'y*',x,u(M+2,:),'b*');
    
    disp(u((M+1)/4,(N+1)/2))
    
    figure;
    mesh(x,t,u);
    title('3D_view of Discretized Equation')
    
end
