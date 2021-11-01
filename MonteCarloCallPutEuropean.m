
% Monte Carlo Call/Put Pricing

clc
clear all

S = 50;        %Value underlying
K = 55;        %Strike 
r = 0.2;       %interest rate
sigma = 0.25;
T = 1;         %Expiration time
n = 1000;     %number iterations


SS = S*exp((r-1/2*sigma^2)*T+sigma*randn(n,1)*sqrt(T));

%Call
CallValue = max(SS-K,0);
CallPrice = exp(-r*T)*mean(CallValue);
CallError = std(CallValue)/sqrt(n);

display(CallPrice);
display(CallError);

%Put
PutValue = max(K-SS,0);
PutPrice = exp(-r*T)*mean(PutValue);
PutError = std(PutValue)/sqrt(n);

display(PutPrice);
display(PutError);
