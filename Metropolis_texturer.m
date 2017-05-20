clc
clear 
close all

label_num=4;
% Figure 3.7 :(1)
label=randi(label_num,128,128);
% label_f=zeros(128,128);
figure,
imshow(label,[]);
alpha=0;
beta=[1,1,1,1];
maxiter=50;
iter=0;
T=1; 
label_f=label;
while iter<maxiter
    for ind=1:numel(label_f)
        % Figure 3.7 :(2.1.1)
        d=ind;

        %当前点的邻域 & 邻域标记
        neigh_ind=neighborhood(d,label_f,8);
        l_n=label_f(neigh_ind);
        
         % Figure 3.7 :(2.1.2)
        l_i=label_f(d);
        
        %计算能量 U=V1+sum(V2) :(2.2)
        U_i=MLL(d,alpha,neigh_ind,beta,label_f);

        %随机选取一个标签计算能量
            k=0;
        while label_f(d)==l_i
            k =randi(label_num);
            label_f(d)=k;
         end
        U_n=MLL(d,alpha,neigh_ind,beta,label_f);

        %判断是否满足接受概率
        label_f(d)=l_i;
        
        U_e=U_n-U_i;
        P=min(1,exp(-U_e));
        if rand(1)<P
            label_f(d)=k;
        end
    end
    iter=iter+1;
end
figure,
imshow(label_f,[]);