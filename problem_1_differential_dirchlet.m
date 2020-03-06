function [  ] = problem_1_differential_dirchlet(  )
    N=49;
    M=4999;
    t0=0;
    L=1; T=0.1; delta_x= (L)/(N+1); delta_t= (T-t0)/(M+1);         
    x = linspace(0,L,N+2);                                  
    t= linspace(0,T,M+2);
    
    for i=1:N+2;
        u(1,i)=problem_1_initialcondition(x(i));         
    end 
    figure;
    subplot(3,1,1)
    plot(x,u(1,:),'r*') ;                 %for each coordinate x 
    title('initial condition')                       
    
    for n=2:M+2;
        u(n,1)=-8*t(n);
        u(n,N+2)=10*t(n);
    end
    
    subplot(3,1,2)
    plot(t,u(:,1),'*');
    title('1st boundary condtion')
    
    subplot(3,1,3)
    plot(t,u(:,N+2),'*');
    title('2nd boundary condtion') 
    
    for n=1:M+1;
        for i=2:N+1;
            u(n+1,i)= u(n,i)+ delta_t*((u(n,i+1)+u(n,i-1)-2*u(n,i))/delta_x^2)+(2*x(i)*delta_t*((u(n,i+1)-u(n,i-1))/2*delta_x))+ (3*t(n)*u(n,i)*delta_t)+  (delta_t*t(n)*t(n)*(x(i)-1));
        end
    end
    figure
    subplot(1,1,1);
    plot(x,u(1,:),'r*',x,u((M+1)/2,:),'y*',x,u(M+2,:),'b*');
    
    disp(u((M+1)/4,(N+1)/2))
    figure;
    mesh(x,t,u);
    title('Discretized equations 3d-view')
    
end


