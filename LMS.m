Fs = 1000;
ts = 1/Fs;
t = 0:ts:1;
u = 0.1;
disp(t);
x = sin(8*pi*t);
N = size(x);

xn = x + 0.1*randn(1,N(2));

figure(1) ; plot(t, x); legend('x');
figure(2) ; plot(t, xn);legend('xn');

wn = zeros(1,N(2));
hn = (1/N(2))*ones(1,N(2));
%dn = sin(8*pi*t);
dn = randn(1,2*N(2)-1);
yn = zeros(1,2*N(2)-1);
en = zeros();

for I = 1:N

    d1 = size(xn);
    n1 = d1(2);
    d2 = size(wn);
    n2 = d2(2);
    n = n1+n2-1;
    xn = [xn, zeros(1,n-n1)];
    wn = [wn, zeros(1,n-n2)];
    for i=1:n
        for j = 1:i
            yn(i) = yn(i) + xn(j)*wn(i-j+1) ;
        end
    end

    en = dn - yn;
    
    for i=1:n
        wn(i+1) = wn(i)+u*en(i)*xn(i);
    end
end
figure(3);
plot(wn,'-');legend('wn');
xlabel('nth wt');

figure(4);
plot(en,'-');legend('en');
xlabel('nth wt');