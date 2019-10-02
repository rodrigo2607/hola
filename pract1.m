close all
clear all 
clc

%introducir grados y distancia del primer eslabon
prompt = 'introduir el valor (grados) de un angulo';
angDeg = input (prompt);
prompt = 'introduir el valor L1';
L1 = input (prompt);
prompt = 'introduir el valor L2';
L2 = input (prompt)
angRad = deg2rad(angDeg)

%imprimir ejes 2D
printAxis()

%definir punto inicial
p1 =[0 0 0]';

%verificacion del angulo y creacion del vector
if angDeg>=0
    angVec = 0:0.1:angRad
else 
    angVec = 0:-0.1:angRad
end

%
for i=1:length(angVec)
    clf
    printAxis();
    TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0; sin(angVec(i)) cos(angVec(i)) 0 0; 0 0 1 0; 0 0 0 1];
    TTx1 = [1 0 0 L1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T1 = TRz1*TTx1;
    p2 = T1(1:3,4);
    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 1 0],'linewidth',5 )
    
   
    TRz2 = [cos(0) -sin(0) 0 0; sin(0) cos(0) 0 0; 0 0 1 0; 0 0 0 1];
    TTx2 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    T2 = TRz2*TTx2;
    Tf = T1*T2
    p3 = Tf(1:3,4);
    line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 1 1],'linewidth',5 )
    
    pause (0.1)
end


