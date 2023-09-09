randn('seed',314);
t=linspace(0,1,1000);
n=length(t);
x=sin(10*t);
figure(1)
plot(t,x)
axis([0,1,-1.5,1.5]);
y=x+0.1*randn(size(t));
figure(2)
plot(t,y)

L=sparse(n-1,n);
for i=1:n-1
    L(i,i)=1;
    L(i,i+1)=-1;
end
lambda=100;
xde=(speye(n)+lambda*L'*L)\y(:);
figure(3)
plot(t,xde);

calculate_xde(t, y, 100, 4, '-');

%{
randn('seed',314);
x=zeros(1000,1);
x(1:250)=1;
x(251:500)=3;
x(501:750)=0;
x(751:1000)=2;
n=length(x);
figure(1)
plot(1:1000,x,'.');
axis([0,1000,-1,4]);
title('Original Signal')

y=x+0.05*randn(size(x));
figure(2)
plot(1:1000,y,'.');
axis([0,1000,-1,4]);
title('Noisy Signal')

calculate_xde(1:1000,y,0.1,3,'.');
axis([0,1000,-1,4]);


lambda=1;
mu=zeros(n-1,1);
for i=1:1000
    mu=mu-0.25*L*(L'*mu)+0.5*(L*y);
    mu=lambda*mu./max(abs(mu),lambda);
    xde=y-0.5*L'*mu;
end
figure(5)
plot(t,xde,'.');
axis([0,1,-1,4]);
%}
%{
randn('seed',314);
t=linspace(0,1,1000);
n=length(t);
x=sin(10*t);
figure(1)
plot(t,x)
axis([0,1,-1.5,1.5]);
y=x+0.1*randn(size(t));
figure(2)
plot(t,y)
axis([0,1,-1.5,1.5]);

calculate_xde(t, y, 100, 4, '-');
axis([0,1,-1.5,1.5]);

calculate_pce(t, y', 10, 100, 5, '-');
axis([0,1,-1.5,1.5]);
%}
