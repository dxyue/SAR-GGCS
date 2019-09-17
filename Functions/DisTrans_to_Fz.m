function [Lz,u] = DisTrans_to_Fz(Fz,centers_z,Lx)
% ��������Lx��ת��Ϊ0,1����ľ��ȷֲ�u����ת��Ϊ�����ۻ��ֲ�����Fz�ķֲ�

h = length(centers_z);
if nargin == 3
    [row,col] = size(Lx);
    Lx = reshape(Lx,1,[]);
    [counts,centers_x] = hist(Lx,h);
    Px = counts./length(Lx)./(centers_x(end)-centers_x(end-1));
    Fx = cdf_pr(Px,centers_x);
    u = Cdf_fun(centers_x,Fx,Lx);
elseif nargin == 2
    row = 100;
    col = 100;
    a = 0;
    b = 1;
    rng(1000);
    u = unifrnd(a,b,row,col);
    u = reshape(u,1,[]);
else
    disp('wrong input!');
end
Lz = InvCdf_fun(Fz,centers_z,u);
Lz = reshape(Lz,row,col);
u = reshape(u,row,col);