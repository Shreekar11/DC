% Experiment 4

clc;
clear all;
close all;

n = input("Enter no. of code bits : ");
k = input("Enter no. of message bits : ");
p = input("Enter parity matrix : ");
disp("Parity matrix : ");
disp(p);

I = eye(k);
p = [1 1 0; 1 0 1; 1 1 1; 0 1 1];
G = [I, p];
disp("Generator matrix G = [I(k), p]: ");
disp(G);

% message word;
m = dec2bin(0:2^k-1);
disp("message word");
disp(m);

C = m*G;
for i=1:2^k-1
    for j=1:n
        C(i, j) = mod(C(i, j), 2);
    end
end

disp("Codeword are : ");
disp(C);

weight = sum(C');
disp("Hamming weight : ");
disp(weight');
weight(1, 1) = weight(1, 2);
d = min(weight);
disp("Minimum weight : ");
disp(d);

Td = d-1;
disp(Td);

Tc = (d-1)/2;
disp(Tc);

H = [p', eye(n-k)];
disp("H = [transpose(P):I(n-k)");
disp(H);
disp("H transpose")
disp(H');
E = [eye(n, n)];
r = input("Enter recieved codeword(r) : ");
s = r*H;
for i=1:n-k
    s(1, i) = mod(s(1, i), 2);
end

h = H';
disp("Syndrome is (S) : ");
disp("S = r * transpose(H)");
disp(s);
if (s == [0 0 0])
    disp("Valid code word");
else
    for i=1:n
        if(s ==h(i,:))
            error = i;
            disp("error is in")
            disp(i);
            break;
        end
    end
end
disp("Error pattern(e)= ");
disp(E(error,:));
c = mod(r + E(error,:),2);
disp("error corrected code word");
disp("C = r + e");
disp(c);