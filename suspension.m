
%Suspension
m = 1; 
b = 0.4; 
k = 1; 
omega = [0: 0.01: 10];
s =1i *omega;
H = (b*s+k)./(m*s.^2+b*s+k);
gain = abs(H);
phase = angle(H);
subplot(2,1,1);
plot(omega,gain)
grid
xlabel('frequency \omega')
ylabel('gain |H(i\omega)|')
title('Frequency Response vs. Frequency')
subplot(2,1,2);
plot(omega,phase)
grid
xlabel('frequency \omega')
ylabel('phase (rad) \angleH(i\omega)')


t = [0:.01:20];
omega = [1 ; 10];
s =1i *omega;
H = (b*s+k)./(m*s.^2+b*s+k);
gain = abs(H); 
phase = angle(H);
u = cos(omega*t);
angles = omega*t + phase*ones(size(t));
ys = diag(gain)*cos(angles);
axes = [0 20 -3 3];

subplot(2,2,1)
plot(t,u(1,:),'-')
title('Input')
xlabel(['Time t \omega=' num2str(omega(1))] )
ylabel('Input u(t)')
axis(axes)
grid
subplot(2,2,2)
plot(t,ys(1,:),'-')
title('Steady-state Response')
xlabel(['Time t \omega=' num2str(omega(1))] )
ylabel('y_{ss}(t)')
axis(axes)
grid
subplot(2,2,3)
plot(t,u(2,:),'-')
title('Input')
xlabel(['Time t \omega=' num2str(omega(2))] )
ylabel('Input u(t)')
axis(axes)
grid
subplot(2,2,4)
plot(t,ys(2,:),'-')
title('Steady-state Response')
xlabel(['Time t \omega=' num2str(omega(2))] )
ylabel('y_{ss}(t)')
axis(axes)
grid

