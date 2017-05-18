function U=MLL(l_ind,alpha,l_n,beta)
    % Multi-level Logistic Model ,to calculate the U(f)
    %  V1=alpha, if fi = I ¡Ê Ld
    %
    %  V2=beta,  if sites on clique {i, i} = c ¡Ê C2 have the same label
    %    =-beta, otherwise
    
    V1=alpha;
%  compare the labels,
%  ~(~(l_n-l_ind)) denotes the diff,
%  ~(l_n-l_ind) denotes the same
    w=~(l_n-l_ind)-~(~(l_n-l_ind)); 
    V2=beta.*w;
    U=V1+sum(V2);
end