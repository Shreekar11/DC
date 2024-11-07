%Halitman code using MATLAB/Octave. Determine Efficiency and redundancy for the
%given Source Coding technique. (D1)

clc;
close all;
clear all;

pkg load communications;

symbols = 1:5;
prob = [0.4 0.19 0.16 0.15 0.10];

disp("Symbols : ");
disp(symbols);
disp(" ");

disp("Probalities : ");
disp(prob);
disp(" ");

dict = huffmandict(symbols,prob);


disp("Huffman Dict. : ");
disp(dict);
disp(" ");


inputSig = randsrc(1,10,[symbols;prob]);
disp("Input Signal : ");
disp(inputSig);
disp(" ");

code = huffmanenco(inputSig,dict);
disp("Coded signal : ");
disp(code);
disp(" ");

decoded = huffmandeco(code,dict);
disp("decoded signal : ");
disp(decoded);
disp(" ");

avg_code_len = 0;
for i = 1:length(symbols)
    avg_code_len = avg_code_len + (prob(i)*length(dict{i}));
end

disp("Avg code len (L) : ");
disp(avg_code_len);
disp(" ");


H = 0 ;
for i = 1:length(symbols)
    H = H - sum(prob(i)*log2(prob(i))) ;
end

disp("Entropy (H) : ");
disp(H);
disp(" ");


efficency = (H/avg_code_len)*100;
disp("Efficiency : ");
disp(efficency);
disp("");

redundancy = 100 - efficency;
disp("redundacy : ");
disp(redundancy);
disp("");