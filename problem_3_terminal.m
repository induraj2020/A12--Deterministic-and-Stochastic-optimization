function  f = problem_3_terminal(S,K)
    if S<K-2
        f = 0;
    end
    if S>=(K-2) && S<(K+4)
        f = 1;
    end
    if S>=(K+4) 
        f = 0;
    end

end