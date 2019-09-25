time=[1 2 3 5 40];
x=0:.005:1;
f=sin((pi/5)*x);
figure;
pfserie(f,1,time);
figure;
fseries(f,1,5);
