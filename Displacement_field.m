clc
clear
close all
figure(1),
x=0:25;
y=0:25;

z=zeros(size(x,2),size(y,2));
[X,Y]=meshgrid(x,y);
mesh(X,Y,z,'EdgeColor','g');
axis off
view(2)

% figure(2),
% y_full=repmat(y,size(x,2),1);
% w=randn(size(y_full,1)-2,size(y_full,2)-2)/2;
% w=[zeros(size(w,1),1),w,zeros(size(w,1),1)];
% y_full=y_full+[zeros(1,size(w,2));w;zeros(1,size(w,2))];
% 
% x_full=repmat(x',1,size(y,2));
% w2=randn(size(x_full,1)-2,size(x_full,2)-2)/10;
% w2=[zeros(size(w2,1),1),w2,zeros(size(w2,1),1)];
% x_full=x_full+[zeros(1,size(w2,2));w2;zeros(1,size(w2,2))];
% mesh(x_full,y_full,z)
% axis off
% view(2)

figure(2),

c = rand(size(x,2)*size(y,2),3);  
for i=1:size(x,2)
    plot(repmat(x(i),1,size(y,2)),y,'color',c(i,:));
    plot(x,repmat(y(i),1,size(x,2)),'color',c(i,:));
    hold on  
end
set(gca,'xtick',[]);
set(gca,'ytick',[]);
figure(3),

for i=2:size(x,2)-1
    plot(repmat(x(i),1,size(y,2))+[0,rand(1,size(y,2)-2),0],y,'color',c(i,:));
    plot(x,repmat(y(i),1,size(x,2))+[0,rand(1,size(x,2)-2),0],'color',c(i,:));
    hold on 
end
set(gca,'xtick',[]);
set(gca,'ytick',[]);
