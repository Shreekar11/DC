% Experiment 1

clc;
clear all;
close all;

pkg load statistics;
x = -5:0.001:5;

% ---------- Normal Distribution ----------

figure;
%Normal Distribution PDF for Varing st. dev.
subplot(2, 2, 1);
y1 = normpdf(x, 0, 0.1);
plot(x, y1, "linewidth", 2);
xlabel("x");
ylabel("pdf");
title("Normal Distribution PDF st. dev = 0.1");

subplot(2, 2, 2);
y2 = normpdf(x, 0, 0.5);
plot(x, y2, "linewidth", 2);
xlabel("x");
ylabel("pdf");
title("Normal Distribution PDF st. dev = 0.5");

subplot(2, 2, 3);
y3 = normpdf(x, 0, 1);
plot(x, y3, "linewidth", 2);
xlabel("x");
ylabel("pdf");
title("Normal Distribution PDF st. dev = 1.0");

subplot(2, 2, 4);
y4 = normpdf(x, 0, 2);
plot(x, y4, "linewidth", 2);
xlabel("x");
ylabel("pdf");
title("Normal Distribution PDF st. dev = 2.0");

figure;
%Normal Distribution PDF for Varing mean
subplot(2, 2, 1);
y1 = normpdf(x, -1, 0.5);
plot(x, y1, "linewidth", 2);
xlabel('x');
ylabel('pdf');
title('Normal Distribution PDF mean =  -1')

subplot(2, 2, 2);
y2 = normpdf(x, 0, 0.5);
plot(x, y2, "linewidth", 2);
xlabel('x');
ylabel('pdf');
title('Normal Distribution PDF mean =  0')

subplot(2, 2, 3);
y3 = normpdf(x, 1, 0.5);
plot(x, y3, "linewidth", 2);
xlabel('x');
ylabel('pdf');
title('Normal Distribution PDF mean =  1')

subplot(2, 2, 4);
y4 = normpdf(x, 2, 0.5);
plot(x, y4, "linewidth", 2);
xlabel('x');
ylabel('pdf');
title('Normal Distribution PDF mean =  2')

% ---------- Uniform Distribution ----------

figure;
%Uniform Distribution PDF for Varing Mean
subplot(2,2,1);
y1 = unifpdf(x,1,2);
plot(x,y1,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Uniform Distribution PDF mean =  1')

subplot(2,2,2);
y2 = unifpdf(x,0,2);
plot(x,y2,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Uniform Distribution PDF mean =  0')

subplot(2,2,3);
y3 = unifpdf(x,-1,2);
plot(x,y3,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Uniform Distribution PDF mean =  -1')

subplot(2,2,4);
y4 = unifpdf(x,-2,2);
plot(x,y4,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Uniform Distribution PDF mean =  -2')

% ---------- Poisen Distribution ----------

figure;
%Poisen Distribution PDF for Varing Mean
subplot(2,2,1);
y1 = poisspdf(x,1);
plot(x,y1,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Poisen Distribution PDF mean =  1')

subplot(2,2,2);
y2 = poisspdf(x,2);
plot(x,y2,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Poisen Distribution PDF mean =  2')

subplot(2,2,3);
y3 = poisspdf(x,3);
plot(x,y3,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Poisen Distribution PDF mean =  3')

subplot(2,2,4);
y4 = poisspdf(x,10);
plot(x,y4,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Poisen Distribution PDF mean =  10')

% ---------- Exponential Distribution ----------

figure;
%Exponential Distribution PDF for Varing Mean
subplot(2,2,1);
y1 = exppdf(x,1);
plot(x,y1,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Exponential Distribution PDF mean =  1')

subplot(2,2,2);
y2 = exppdf(x,2);
plot(x,y2,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Exponential Distribution PDF mean =  2')

subplot(2,2,3);
y3 = exppdf(x,3);
plot(x,y3,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Exponential Distribution PDF mean =  3')

subplot(2,2,4);
y4 = exppdf(x,10);
plot(x,y4,"linewidth",2);
xlabel('x');
ylabel('pdf');
title('Exponential Distribution PDF mean =  10')


% ---------- Experiment 1 - Part B ----------

clc;
clear all;
close all;

%Auto Correlation function and Power Spectral Density
pkg load statistics;
y=normrnd(0,1,1,200);
Gy=periodogram(y);
Ry=abs(ifft(Gy,256));
Ry=[Ry(130:256)' Ry(1:129)'];
t=-127:1:128;
figure;
subplot(1,2,1);
plot(Gy);
xlabel('frequencysamples');
title('PSD');
subplot(1,2,2);
stem(t,Ry);
xlabel('time shift');
title('autocorrection');
