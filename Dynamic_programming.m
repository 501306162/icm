label_f=randi(10,10,10);
label_m=randi(10,10,10);
sigma=0.01^2;
beta=[1 1 1 1];
alpha=0;
[m,n]=size(label_m);
for ind=1:numel(label_m)
neigh_ind=neighborhood(ind,label_m,8);
[r,c]=ind2sub(ind);
[r_n,c_n]=ind2sub(neigh_ind);
ind_k=neigh_ind((c_n-c)==1);
V_k=MLL(ind,alpha,ind_k,beta,label_m);
l_fk=label()
E_k=neighborhood();
end