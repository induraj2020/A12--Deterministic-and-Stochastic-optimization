function y = problem_3_part2_Black_sholes()
   
    N=99;
    M=1999;
    L=40;                                                   % stock proce
    K=10;                                                    % excersise price
    T=0.5;
    t0=0;
    sig=0.5;
    r=0.1;
    delta_t=(T-t0)/(M+1);
    delta_s=L/(N+1);
    S=linspace(0,L,N+2);
    t=linspace(t0,T,M+2);
    
    %Final Conditions
    for i=1:(N+2)
        u(M+2,i)=problem_3_terminal(S(i),K);
    end
    
    figure;
    subplot(3,1,1)
    plot(S,u(M+2,:),'r-') ;                 
    title('Final condition')

    % Derivative Equation
    for n=M+2:-1:2
        for i=2:N+1
            u(n-1,i) = u(n,i) + delta_t*r*S(i)*(u(n,i+1)-u(n,i-1))/(2*delta_s) + delta_t*(sig^2)*(S(i)^2)*(u(n,i+1)+u(n,i-1)-2*u(n,i))/(2*(delta_s^2)) - delta_t*r*u(n,i);         
        end
        u(n-1,N+2)=u(n-1,N+1);
        u(n-1,1)=u(n-1,2);
    end
    
    subplot(3,1,2)
    plot(t,u(:,1),'*');
    title('1st boundary condtion')
    
    subplot(3,1,3)
    plot(t,u(:,N+2),'*');
    title('2nd boundary condtion')
    
%     figure
%     subplot(1,1,1);
%     plot(x,u(1,M+1),'r*');
    
    disp(u(M+1,N+1))
    figure;
    mesh(S,t,u);
    xlabel('S');
    ylabel('t');

end