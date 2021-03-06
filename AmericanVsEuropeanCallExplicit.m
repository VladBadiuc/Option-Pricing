
%% American Call using Explicit Method
clear all;
clc;
r = 0.2;
sigma = 0.25;
D = 0.3;
Nt = 1600;
Ns = 160;
Smax = 20;
Smin = 0;
T = 1;
E = 10;

dt = T/Nt;
ds = (Smax-Smin)/Ns;

V(1:Ns+1,1:Nt+1) = 0.0;
Vam(1:Ns+1,1:Nt+1) = 0.0;

S = Smin+(0:Ns)*ds;
tau = (0:Nt)*dt;

V(1:Ns+1,1) = max(S-E,0);
Vam(1:Ns+1,1) = max(S-E,0);

%Boundary conditions
% 1) V(0,t) = 0
V(1,1:Nt+1) = 0;
Vam(1,1:Nt+1) = 0;
% 2) V(S,t) = S*e^(-D*(T-t))-E*e^(-r(T-t))
V(Ns+1,1:Nt+1) = Smax*exp(-D*tau)-E*exp(-r*tau);
Vam(Ns+1,1:Nt+1) = Smax*exp(-D*tau)-E*exp(-r*tau);

for j=1:Nt
    for n=2:Ns
        V(n,j+1) = 0.5*dt*(sigma*sigma*n*n-(r-D)*n)*V(n-1,j)+(1-dt*(sigma*sigma*n*n+r))*V(n,j)+0.5*dt*(sigma*sigma*n*n+(r-D)*n)*V(n+1,j);
        Vam(n,j+1) = 0.5*dt*(sigma*sigma*n*n-(r-D)*n)*Vam(n-1,j)*(1-dt*(sigma*sigma*n*n+r))*Vam(n,j)+0.5*dt*(sigma*sigma*n*n+(r-D)*n)*Vam(n+1,j);
    end
    Vam(1:Ns+1,j+1) = max(Vam(1:Ns+1,j+1),Vam(1:Ns+1,1));
end

figure(1)
plot(S,V(:,1),'r--',S,Vam(:,1),'r-*',S,V(:,round(Nt/2)),'g--',S,Vam(:,round(Nt/2)),'g-*',S,V(:,Nt+1),'b--',S,Vam(:,Nt+1),'b-*');
xlabel("S");
ylabel("V(S,t)");




