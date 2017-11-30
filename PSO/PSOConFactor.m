clc;
clear all;
%% Funcion objetivo
fo = @(x) -(x)^5 + 5*(x)^3 + 20*x -5;
%% Constantes
nParticulas = 4; %Numero de particulas
xInferior = -4;
xSuperior = 4;
nIteraciones = 100;
thetaMax = 0.9;
thetaMin = 0.4;
c1 = 2;
c2 = 2;
%% Variables
x = randi([xInferior xSuperior],1,4);
solucionActual = zeros(1,nParticulas);
mejorSolucionPBest = zeros(1,nParticulas);
velocidad = zeros(1,nParticulas);
PBest = zeros(1,nParticulas);
theta = 0;
GBest = 0;
r1 = 1;
r2 = 1;
vDesviacion = zeros(nIteraciones,1);
%% Ejecucion del programa

fprintf('x iniciales\n');
for j=1:nParticulas
    fprintf('x(%d) = %f  ',j,x(j))
end
x = [-2 0 1 3];
fprintf('\n\nFuncjon objetjvo\n')
for j=1:nParticulas
    solucionActual(j) = fo(x(j));
    fprintf('f(%d) = %f  ',j,solucionActual(j))
end

Gbest = rand + 1;
PBest(1,:) = x;
PBest(1,:)

mayor  =  solucionActual(1);
GBest = x(1);

for j=2:nParticulas
    if(solucionActual(j) > mayor)
        mayor = solucionActual(j);
        GBest = x(j);
    end
end

for i=1:nIteraciones
    
    r1 = rand;
    r2 = rand;
    scatter(x, zeros(nParticulas, 1)', 'filled')
    axis([xInferior xSuperior])
    
    theta = thetaMax - ((thetaMax - thetaMin)/nIteraciones) * i;
    for j=1:nParticulas
        velocidad(j) = theta* velocidad(j) + c1*r1*(PBest(j) - x(j)) + c2*r2*(GBest - x(j));
        x(j) = x(j) + velocidad(j);
        solucionActual(j) =  fo(x(j));
        
    end
    
    for j=1:nParticulas
        mejorSolucionPBest(j) = fo(PBest(j));
    end
    
    mejorG = fo(GBest);
    
    for j=1:nParticulas
        if(x(j) >= xInferior && x(j) <= xSuperior)
            if(solucionActual(j) > mejorSolucionPBest(j))
                PBest(j) = x(j);
                if(solucionActual(j) > mejorG)
                    GBest = PBest(j);
                end
            end
        end
    end

    disp([PBest GBest])
    drawnow()
end
fprintf('\nGBest =  %f, Funcion objetivo = %f ',GBest, fo(GBest))