

S = 50;
K = 50;
r = 0.05;
sigma = 0.25;
T = 0.1;

M = 800;
N = 2000;
Szero = 0; 
Smax = 150;

d1 = (log(S/K) + (r+0.5*sigma^2)*T)/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);
% N1 = 0.5*(1+erf(-d1/sqrt(2)));
% N2 = 0.5*(1+erf(-d2/sqrt(2)));
% value = K.*exp(-r*T).*N2-S.*N1;
N1 = -0.5*(1+erf(-d1/sqrt(2)));
N2 = -0.5*(1+erf(-d2/sqrt(2)));
value = S.*N1-K.*exp(-r*T).*N2;


display(value);