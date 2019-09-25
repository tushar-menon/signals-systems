%%Financial system
%Setting the constants
R_p=0.04;
R_m= 0.07;
R_s= 0.06;
R_i= 0.07;
E=0.85;
I=0.1;
kstep=1;

%Defining the state space model
A=[1+R_p 0 0 0 0;0 1+R_m 0 0 0; 0 0 1+R_s 0 0;0 0 1-E-I 1 0;0 0 I 0 1+R_i];
B=transpose([0 0 0 0 1]);
C=[0 0 0 1 1];
D=[0];
sys =ss(A,B,C,D,kstep);
k=0:40;
u=zeros([41 1]);
u(1)=100;
x0=transpose([1 1 70 20 0]);
[y,k,x] = lsim(sys,u,k,x0);

%plotting
figure
w_1=x(:,1);
w_2=x(:,2);
w_3=x(:,3);
plot(k,w_1,'-.',k,w_2,':',k,w_3/70,'-')
ylim([0 50])
title('CPI, SMI and Salary growth')
xlabel('Time')
ylabel('Indices')
legend('CPI', 'SMI', 'Salary growth')
hold off

figure
w_5=x(:,5);
plot(k, w_3,'-.',k,w_5,'-');
ylim([0 20000]);
title('Salary and Investment accounts')
xlabel('Time')
ylabel('Money')
legend('Salary','Investment accounts')

figure
w_5=x(:,5);
plot(k, w_3./w_1,'-.',k,w_5./w_1,'-');
ylim([0 2000]);
title('Salary and Investment accounts adjusted for inflation')
xlabel('Time')
ylabel('Money')
legend('Salary','Investment accounts')
