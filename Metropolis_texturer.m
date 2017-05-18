label_num=3;
label=randi(label_num,100,100);
range =1; %3*3
alpha=0;
beta=[1,1,1,1];
maxiter=50;
iter=0;

label_f=zeros(100,100);
while iter<maxiter
    for ind=1:numel(label_f)
        % Figure 3.7 :(2.1)
        d=ind;
        label_f(d)=randi(label_num);
        l_i=label_f(d);
        
        %当前点的邻域 & 邻域标记
        neigh_ind=neighborhood(d,label_f,8);
        l_n=label_f(neigh_ind);
        %计算能量 U=V1+sum(V2)
        U_i=MLL(l_i,alpha,l_n,beta);
    %     U_n=zeros(1,numel(neigh_ind));
    %     for k=1:numel(neigh_ind)
        k=randi(numel(neigh_ind));
        U_n=MLL(l_n(k),alpha,l_n,beta);
    %     end
        U_e=U_n-U_i;
        P=min(1,exp(-U_e));
        if rand(1)<P
            label_f(d)=l_n(k);
        end
    end
    iter=iter+1;
end
figure,
imshow(label_f,[]);