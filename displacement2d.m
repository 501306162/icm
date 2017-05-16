function displacement_ind=displacement2d(ind,image,range)
% return the neighbors'index of 'ind ' pixel
[r,c]=ind2sub(size(image),ind);
subfirst=[range,range];
subend=size(image);

% subscript in moving image
neig_sub_begin=max(subfirst,[r,c]-subfirst);
neig_sub_end=min(subend,[r,c]+subfirst);

row_size=neig_sub_end(1)-neig_sub_begin(1)+1;
col_size=neig_sub_end(2)-neig_sub_begin(2)+1;

row=repmat((neig_sub_begin(1):1:neig_sub_end(1)),col_size,1);   % row(:)-->111 222 333
col=repmat((neig_sub_begin(2):1:neig_sub_end(2)),1,row_size);   % col(:)-->123 123 123

% the neighbors include the 'ind' pixel
displacement_ind=sub2ind(size(image),row(:),col(:));
% the neighbors exclude the 'ind' pixel
displacement_ind(displacement_ind==ind)=[];
% % translate the current pixel to the first one
% neighbors_ind=[ind,neighbors_ind(:)];

% % form the cliques
% clique
end