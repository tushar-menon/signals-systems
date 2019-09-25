
%%Rotational Mechanical system
%Setting the constants
Bd=2;
J=1;
K=101;

%Defining the state space model
A=[0 1;-K/J -Bd/J];
B=[0;1/J];
C=[1 0];
D=[0];
sys =ss(A,B,C,D);

% Deriving the input output model
iom = tf(sys);
iomd=iom*tf('s')^(-1);
interpret=tfdata(sys,'v');

%PLotting Theta and omega
t=linspace(0,5,2000);
u=zeros(length(t),1);
[y,t,x]=lsim(sys,u,t,[-1 0]);
figure
subplot(2,1,1)
plot(t,y)
ylim([-1 1.2])
title('Angular displacement')
xlabel('Time')
ylabel('\Theta')
w=x(:,2);

hold on
subplot(2,1,2); 
plot(t,w,'-',t,5*y,'-.')
ylim([-10 10])
title('Angular velocity compared to angular displacement')
xlabel('Time')
ylabel('\omega:solid, 5\Theta: dashed')
hold off


%PLotting the energies
ke=0.5*J*w.*w;
se=0.5*K*y.*y;
e=ke+se;
figure
plot(t,ke,'-.',t,se,':',t,e,'-')
xlim([0 1])
ylim([0 55])
title('Energy of the system')
xlabel('Time')
ylabel('Energy')
legend('Kinetic energy e_k','Spring energy e_s', 'Total energy e')


