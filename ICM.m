clc
clear
close all
moving_img = double(randi(10,10,10));
fixed_img = double(randi(10,10,10));
label_num = 10;
maxiter = 60;
sigma= 0.5;
%-------------随机初始化标签----------------
label_m = randi([1,label_num],size(moving_img));
label_f = randi([1,label_num],size(fixed_img));
%-----------kmeans最为初始化预分割----------
% label = kmeans(img(:),cluster_num);
% label = reshape(label,size(img));
iter = 0;
E=zeros(1,label_num);
label=label_m;
smooth=zeros(1,label_num);
data=zeros(1,label_num);
 while iter < maxiter
    for ind=1:numel(label)
        label_i=label(ind);
        neigh_ind=neighborhood(ind,label_m,8);
        label_neigh=label(neigh_ind);
        %计算像素点8领域标签相对于该点的不相同个数
        for l=1:label_num
            smooth(l)=sum(~(~(label_neigh-l)));
            data(l)=((label_f(ind)-l).^2)/sigma;
        end
         E=data+smooth;
        %找到最小能量对应的标签,作为下一次迭代使用标签
         [E_min,label_new]=min(E);
         label(ind)=label_new;
    end
         iter = iter + 1;   
 end
 figure,
 subplot(1,2,1);
 imshow(label,[]);
 title('label_m');
 subplot(1,2,2);
 imshow(label_f,[]);
 title('label_f')
 
%         % 更新标签
%         while true
%             old=label_i;
%             label_i=randi([1,cluster_num]);
%             if label_i==old
%                 break;
%             end
%         end

    
%  %---------显示----------------
%     if ~mod(iter,6) 
%         figure;
%         n=1;
%     end
%     subplot(2,3,n);
%     imshow(label,[])
%     title(['iter = ',num2str(iter)]);
%     pause(0.1);
%     n = n+1;
%    