clc
clear
close all
% % x=[1 2 1 1 1 1];
% % y=[1 2 3 4 5 6];
% % u=[1 0.5 1 1 1 1];
% % v=[0.5 1 0.5 1 1 1];
% % quiver(x,y,u,v);
% % grid on
% % annotation('arrow',[0.2 0.8],[0.1 0.5]);
% % label_f=randi(10,10,10);
% % [r,c]=ind2sub(label_f,1:numel(label_f));
% label_f=randi(10,10,10);
% figure(3),
% dispalce=[0,rand(1,10-2),0];
% [r,c]=ind2sub(label_f,1:numel(label_f));
% [r_e,c_e]=ind2sub(label_f,displace);
% 
% co = rand(size(x,2)*size(y,2),3); 
% for i=2:size(x,2)-1
%     plot(repmat(x(i),1,size(y,2)),y,'color',co(i,:));
%     plot(x,repmat(y(i),1,size(x,2)),'color',co(i,:));
%     hold on 
% end
% set(gca,'xtick',[]);
% set(gca,'ytick',[]);

% I = imread('lena.png');
% imshow(I);
% tform = affine2d([1 0 0; .5 1 0; 0 0 1]);
% J = imwarp(I,tform);
% figure
% imshow(J)
% 
% imregdemons
    U_n=MLL((1:4),0.5,(1:4),beta);