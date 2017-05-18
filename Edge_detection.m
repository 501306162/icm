%edge detection
% 灰度突变..是边缘..fe值为1...否则为0...没有三目运算符...
fe=((ind-neighbor).^2-alpha)>0;
% 每个像素点的smoothcost
Uf=((ind-neighbor).^2)*(1-fe)+alpha*fe;

Uf_d=datacost+lamda*Uf;