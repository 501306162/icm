%  Basic demon registration code. (To easy understand the algorithm)

% Clean
clc; clear all; close all;

% Compile the mex files
compile_c_files
functionname='basic_demon_example.m';
functiondir=which(functionname);
functiondir=functiondir(1:end-length(functionname));
addpath([functiondir '/functions_nonrigid'])
addpath([functiondir '/functions_affine'])
addpath([functiondir '/functions'])
addpath([functiondir '/lianxi'])
% Read two images
I1=im2double(imread('images/lenag1.png'));  
I2=im2double(imread('images/lenag2.png')); 

% Set static and moving image
S=I2; M=I1;

% Alpha (noise) constant
alpha=2.5;

% Velocity field smoothing kernel
Hsmooth=fspecial('gaussian',[60 60],10);

% The transformation fields
Tx=zeros(size(M)); Ty=zeros(size(M));

[Sy,Sx] = gradient(S);
uux=zeros(1,size(I1,1));
uuy=zeros(1,size(I1,2));

for itt=1:200
	    % Difference image between moving and static image
        Idiff=M-S;

        % Default demon force, (Thirion 1998)
        %Ux = -(Idiff.*Sx)./((Sx.^2+Sy.^2)+Idiff.^2);
        %Uy = -(Idiff.*Sy)./((Sx.^2+Sy.^2)+Idiff.^2);

        % Extended demon force. With forces from the gradients from both
        % moving as static image. (Cachier 1999, He Wang 2005)
        [My,Mx] = gradient(M);
        Ux = -Idiff.*  ((Sx./((Sx.^2+Sy.^2)+alpha^2*Idiff.^2))+(Mx./((Mx.^2+My.^2)+alpha^2*Idiff.^2)));
        Uy = -Idiff.*  ((Sy./((Sx.^2+Sy.^2)+alpha^2*Idiff.^2))+(My./((Mx.^2+My.^2)+alpha^2*Idiff.^2)));
 
        % When divided by zero
        Ux(isnan(Ux))=0; Uy(isnan(Uy))=0;
        
        % Smooth the transformation field
        Uxs=3*imfilter(Ux,Hsmooth);
        Uys=3*imfilter(Uy,Hsmooth);

        % Add the new transformation field to the total transformation field.
        Tx=Tx+Uxs;
        Ty=Ty+Uys;
        M=movepixels(I1,Tx,Ty); 
end
figure,
subplot(1,3,1), imshow(I1,[]); title('image 1');
subplot(1,3,2), imshow(I2,[]); title('image 2');
subplot(1,3,3), imshow(M,[]); title('Registered image 1');

%Ô­Ê¼Íø¸ñ
figure,
r=1:size(I1,1);
c=1:size(I1,2);
co = rand(size(r,2)*size(c,2),3); 
for i=1:size(r,2)
    plot(repmat(r(i),1,numel(c))+Tx(i,:),c,'color',co(i,:));
    plot(r,repmat(c(i),1,numel(r))+Ty(:,i)','color',co(i,:));
    hold on 
end
% set(gca,'xtick',[]);
% set(gca,'ytick',[]);
	