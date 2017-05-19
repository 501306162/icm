clc
clear all
close all

label_num=3;
label=randi(1,128,128);
range =1; %3*3
alpha=0;
beta=[1,1,1,-1];
maxiter=50;
iter=0;

label_f=label;
% zeros(100,100);
while iter<maxiter
    for ind=1:numel(label_f)
        % Figure 3.7 :(2.1)
        d=ind;
        label_f(d)=randi(label_num);
        l_i=label_f(d);
        %当前点的邻域 & 邻域标记
        neigh_ind=neighborhood(d,label_f,8);
        l_n=label_f(neigh_ind);
%         label_f(neigh_ind)=l_n;
        
        %计算能量 U=V1+sum(V2) :(2.2)
        U_i=MLL(d,alpha,neigh_ind,beta,label_f);
    %     U_n=zeros(1,numel(neigh_ind));
    %     for k=1:numel(neigh_ind)
        k=randi(numel(neigh_ind));
        label_f(d)=l_n(k);
        U_n=MLL(d,alpha,neigh_ind,beta,label_f);
    %     end
        U_e=U_n-U_i;
        P=min(1,exp(-U_e));
        if rand(1)<P
            label_f(d)=l_n(k);
        else label_f(d)=l_i;
        end
    end
    iter=iter+1;
end
figure,
imshow(label_f,[]);