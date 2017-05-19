function U=MLL(ind,alpha,ind_n,beta,label)
    % Multi-level Logistic Model ,to calculate the U(f)
    %  V1=alpha, if fi = I ¡Ê Ld
    %
    %  V2=beta,  if sites on clique {i, i} = c ¡Ê C2 have the same label
    %    =-beta, otherwise
    
    V1=alpha;
%  compare the labels,
%  ~(~(l_n-l_ind)) denotes the diff,
%  ~(l_n-l_ind) denotes the same

%     w=~(l_n-l_ind)-~(~(l_n-l_ind)); 
%     V2=beta.*w;
    [m,n]=size(label);
    V2=zeros(numel(ind_n),1);
    % -- |   /  \
    % 1  2   3  4
    ind_e=ind_n-ind;
    V2(abs(ind_e)==m)=beta(1);
    V2(abs(ind_e)==1)=beta(2);
    V2(abs(ind_e)==(m-1))=beta(3);
    V2(abs(ind_e)==(m+1))=beta(4);
%     1: same
%    -1: differ
    w=~(label(ind_n)-label(ind))-~(~(label(ind_n)-label(ind)));
    V2=w.*V2;
    U=V1+sum(V2);
end