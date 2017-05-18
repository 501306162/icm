label=randi(10,10,10);
range =1; %3*3
alpha=0.5;
beta=0.7;
for ind=1:numel(label)
    d=ind;
    l_i=label(d);
    %当前点的邻域 & 邻域标记
    neigh_ind=neighborhood(d,label,8);
    l_n=label(neigh_ind);
    %计算能量 U=V1+sum(V2)
    U_i=MLL(l_i,alpha,l_n,beta);
%     U_n=zeros(1,numel(neigh_ind));
%     for k=1:numel(neigh_ind)
    k=randi(numel(neigh_ind));
    U_n=MLL(l_n(k),alpha,l_n,beta);
%     end
    U_e=U_n-U_i;
    P=min(1,exp(-U_e/T));
    if rand(1)<P
        label(d)=l_n(k);
    end
end