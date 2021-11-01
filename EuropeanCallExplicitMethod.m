

%% European Call Option Explicit Method

clc
clear all;

Smax = 20;  % max price
Smin = 0;    % min price
E = 10;     % exercise price
sigma = 0.25; % volatility of underlying stock
Nt = 1600;   % time steps
Ns = 160;    % price steps
T = 1.;       % time to expiration
r = 0.2;    % interest rate


dt = (T/Nt);              %time steps
ds = (Smax-Smin)/Ns;    % price steps

%V = ones(Ns+1,Nt+1);    % option value 
V(1:Ns+1,1:Nt+1) = 0.0;
S = Smin+(0:Ns)*ds;
tau = (0:Nt)*dt;

% initial condition --> European --> payoff at expiry
V(1:Ns+1,1) = max(S-E,0);

% boundary conditions
% 1) V(0,t) = 0
V(1,1:Nt+1) = 0;
% 2) V(S,t)= S-E*e^(-r*tau)
V(Ns+1,1:Nt+1) = Smax-E*exp(-r*tau);

% Explicit loop
d1 = log(
% for j = 1:Nt
%     for n = 2:Ns
%         V(n,j+1) = 0.5*dt*(sigma*sigma*n*n-r*n)*V(n-1,j)+(1-dt*(sigma*sigma*n*n*r))*V(n,j)+0.5*dt*(sigma*sigma*n*n+r*n)*V(n+1,j);
%     end
% end

figure(1)
plot(S,V(:,1),'-b',S,V(:,round(Nt/2)),'r',S,V(:,Nt+1),'-c');
%figure(2)
%mesh(tau,S,V);
