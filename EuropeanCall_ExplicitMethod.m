

%% European Call Option Explicit Method


Smax = 100;  % max price
Smin = 0;    % min price
Ex = 25;     % exercise price
sigma = 0.5; % volatility of underlying stock
Nt = 2000;   % time steps
Ns = 200;    % price steps
T = 1;       % time to expiration
r = 0.02;    % interest rate


dt = T/Nt;              %time steps
ds = (Smax-Smin)/Ns;    % price steps

V = ones(Ns+1,Ns+1);    % option value 
S = Smin+(1:Ns)*ds;
tau = (0:Nt)*dt;

% initial condition --> European --> payoff at expiry
V(1:Ns+1,1) = max(S-Ex∫,0);

% boundary conditions
% 1) V(0,t) = 0
V(1:Nt+1) = 0;
% 2) V(S,t)= S-E*e^(-r*tau)
V(Ns+1,1:Nt+1) = Smax-E*exp(-r*tau);

% Explicit loop
for j = 1:Nt
    for i = 2:Ns
        V(i,j+1) = 0.5*dt*(sigma*sigma*i*i-r*i)*V(i-1,j)+(1-dt*(sigma*sigma*i*i*r))*V(i,j)+0.5*dt*(sigma*sigma*i*i+r*i)*V(i+1,j);
    end
end

figure(1)
plot(S,V(:,1),-b);
plot(S,V(:,Nt/2));
plot(S,V(:,Nt+1));
figure(2)
surf(tau,S,V);