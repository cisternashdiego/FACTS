%Parámetros iniciales
Ksmin=0.15; lam=2.1 ; Ksop=0.25; L=20e-3; XL=L*100*pi; V=1100*sqrt(2);
syms x;
%b0=pi/(2*lam); bloq=pi; no es necesario
C0=1/(100*pi*Ksmin*XL)
L0=1/(lam^2*(100*pi)^2*C0)
XCeq=Ksop*XL;
Ceq=1/(100*pi*XCeq);
Kbpu= C0/Ceq-1
bet= vpasolve(Kbpu== 2*lam^2/(pi*(lam^2-1))*(2*cos(x)^2/(lam^2-1)*(lam*tan(lam*x))-tan(x)) - x - sin(2*x)/2,x,[0 pi/4]) %beta en rad
%ALPHA CON CORRIENTE SINTETIZADA
del=-25*pi/180; %delta en radianes
I=(V-V*(cos(del)+i*sin(del)))/(XL*(1-Ksop)); %corriente con compensacion
alfa= ((pi-bet) - pi/2 + angle(I))*180/pi %valor de alfa sintetizada en grados
