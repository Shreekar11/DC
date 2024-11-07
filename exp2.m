% Experiment 2 

clc;
clear all;
close all;

n = input("Enter the no. of source element : ");
q = input("Enter the channel matrix P(Y/X) : ");
disp(q);

p = input("Enter source probability : ");
px = diag(p, n, n);
disp("P(X) : ");
disp(px);

pxy = px * q;
disp("P(X Y) : ");
disp(pxy);

py = p*q;
disp("P(Y) : ");
disp(py);

% Entropy of source H(x)
Hx = 0;
for i=1:n
    Hx = Hx + (-p(i) * log2(p(i)));
end

disp("H(x) : ");
disp(Hx);

% Entropy of destination H(y)
Hy = 0;
for i=1:n
    Hy = Hy + (-py(i) * log2(py(i)));
end

disp("H(y) : ");
disp(Hy);

% Mutual Entropy H(x, y)
Hxy=0 
for i = 1:n 
  for j = 1:n 
    Hxy=Hxy+(-pxy(i,j) * log2(pxy(i,j)) );
  end
end


disp("H(xy) : ");
disp(Hxy);

% Conditional Entropy H(y/x)
h1 = Hxy - Hx;
disp("H(y/x) : ");
disp(h1);

% Conditional Entropy H(x/y)
h2 = Hxy - Hy;
disp("H(x/y) : ");
disp(h2);

% Mutual Information I(x,y)
lxy= Hx - h2;
disp('I(x,y): ');
disp(lxy);
disp(' ');

if h2==0
  disp("This channel is a lossless channel ");
end

if lxy==0
  disp ("This channel is a useless channel ");
end

if Hx==Hy 
  if h1==0
    disp("This channel is a noiseless channel ");
  end
endif