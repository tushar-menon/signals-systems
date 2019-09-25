%moving diff
n = [ 1 -1];
d = [ 2 0];
thetas = [-pi: pi/100: pi];
dfresp(n,d,thetas);
subplot(2,1,1);
title('Frequency Response')
grid
subplot(2,1,2);
grid
hold off

theta = [pi/2; pi];
z = exp(-1i*theta);
H = (1-z.^(-1))/2;
gain = abs(H);
phase = angle(H);
K = 20; 
k = [0:K]; 
m = 1000;
u = cos(theta*k);
angles = theta*k + phase*ones(size(k));
yss = diag(gain)*cos(angles);
axes =[min(k),max(k),-1.5,1.5];

subplot(2,2,1)
stem(k, u(1,:))
xlabel(['Time k: \theta=' num2str(theta(1))])
ylabel('Input')
axis(axes)
title('Input')
grid
subplot(2,2,2)
stem(k, yss(1,:))
xlabel(['Time k: \theta=' num2str(theta(1))])
ylabel('y_{ss}(k)')
title('Steady state Response')
axis(axes)
grid
subplot(2,2,3)
stem(k, u(2,:))
xlabel(['Time k: \theta=' num2str(theta(2))])
ylabel('Input')
axis(axes)
title('Input')
grid
subplot(2,2,4)
stem(k, yss(2,:))
xlabel(['Time k: \theta=' num2str(theta(2))])
ylabel('y_{ss}(k)')
title('Steady state Response')
axis(axes)
grid
