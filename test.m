clc
clear
close all
ind=35;
image=randi(10,10,10);
[r,c]=ind2sub(size(image),ind);
subfirst=[1,1];
subend=size(image);

% subscript in moving image
neig_sub_begin=max(subfirst,[r,c]-[2,2]);
neig_sub_end=min(subend,[r,c]+[2,2]);


row_size=neig_sub_end(1)-neig_sub_begin(1)+1;
col_size=neig_sub_end(2)-neig_sub_begin(2)+1;

row=repmat((neig_sub_begin(1):1:neig_sub_end(1)),col_size,1);   % row(:)-->111 222 333
col=repmat((neig_sub_begin(2):1:neig_sub_end(2)),1,row_size);   % col(:)-->123 123 123

% the neighbors include the 'ind' pixel
neighbors_ind=sub2ind(size(image),row(:),col(:));
% the neighbors exclude the 'ind' pixel
neighbors_ind(neighbors_ind==ind)=[];