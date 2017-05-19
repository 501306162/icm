 label=[1 2 5;
     5 5 6;
     2 5 5]   
     [m,n]=size(label);ind=2;
     ind_n=neighborhood(ind,label,8)
     
     beta=[1 1 1 1]
    V2=zeros(numel(ind_n),1);
    % -- |   /  \
    % 1  2   3  4
    ind_e=ind_n-ind
    V2(abs(ind_e)==m)=beta(1)
    V2(abs(ind_e)==1)=beta(2)
    V2(abs(ind_e)==(m-1))=beta(3)
    V2(abs(ind_e)==(m+1))=beta(4)
w=~(label(ind_n)-label(ind))-~(~(label(ind_n)-label(ind)))
V2=V2.*w