clc;                                               
clear all;

fprintf('algoritmo engambre de particulas(PSO)\n\n')
fprintf('Fx = -(x^5)+5*(x^3)+20*x-5\n')


%se inicalizan los valores constantes 
c1=1;
c2=1;

% funcion objetivo
Fx = @(x) -(x^5)+5*(x^3)+20*x-5;


%1. posiciones iniciales 
x1(1) = -2.0;
x2(1) = 0.0;
x3(1) = 1.0;
x4(1) = 3.0;

fprintf('\n1. posiciones iniciales\n x1(1)=-2\n x2(1)=0\n x3(1)=1\n x4(1)=3\n\n')

%2. evaluar primer fitness
f1(1) = Fx(x1(1));
f2(1) = Fx(x2(1));
f3(1) = Fx(x3(1));
f4(1) = Fx(x4(1));

fprintf('2. fitness inicial\n f1(%.0f)=%.4f',1,f1(1));
fprintf('\n f2(%.0f)=%.4f',1,f2(1));
fprintf('\n f3(%.0f)=%.4f',1,f3(1));
fprintf('\n f4(%.0f)=%.4f\n',1,f4(1));



%condicion inicial para encontrar el mejor pbest
fi1=f1(1);
fi2=f1(1);
fi3=f1(1);
fi4=f1(1);
pbest1=x1(1);
pbest2=x2(1);
pbest3=x3(1);
pbest4=x4(1);

%3. velocidad inicial
v1(1)=0;
v2(1)=0;
v3(1)=0;
v4(1)=0;

fprintf('\n3. velocidad inicial\n v1(%.0f)=%.4f',1,v1(1));
fprintf('\n v2(%.0f)=%.4f',1,v2(1));
fprintf('\n v3(%.0f)=%.4f',1,v3(1));
fprintf('\n v4(%.0f)=%.4f\n',1,v4(1));


% 4. a.hallar mejor valor historico pbest

for x=2:100
    
     fprintf('\n\niteracion numero %.0f\n\n',x-1);
     
     for y=2:x
        if(f1(y-1)>fi1)
        fi1=f1(y-1);
        pbest1 = x1(y-1);
        end 
        if(f2(y-1)>fi2)
        fi2=f2(y-1);
        pbest2 = x2(y-1);
        end 
        if(f3(y-1)>fi3)
        fi3=f3(y-1);
        pbest3 = x3(y-1);
        end 
        if(f4(y-1)>fi4)
        fi4=f4(y-1);
        pbest4 = x4(y-1);
        end  
     end
     
     fprintf('\n4.\n a. hallar pbest \n pbest1=%.4f',pbest1);
     fprintf('\n pbest2=%.4f',pbest2);
     fprintf('\n pbest3=%.4f',pbest3);
     fprintf('\n pbest4=%.4f\n',pbest4);
   
    
    % hallar gbest
    
    best=Fx(pbest1);
    gbest=pbest1;
    
    if(Fx(pbest2)>best)
        best=Fx(pbest2);
        gbest=pbest2;
    end
    if(Fx(pbest3)>best)
        best=Fx(pbest3);
        gbest=pbest3;
 	  end
    if(Fx(pbest4)>best)
        best=Fx(pbest4);
        gbest=pbest4;
    end
    
    fprintf('\n hallar gbest \n gbest=%.4f\n',gbest);
    
    %hallar las probabilidades aleatorias r1 y r2 
    
    r1=rand(1);
    r2=rand(1);
    
     fprintf('\n b. hallar r1 y r2 \n r1=%.4f\n r2=%.4f\n',r1,r2);
    
    % b. hallar la velocidad
    
    v1(x)=v1(x-1)+c1*r1*(pbest1-x1(x-1))+c2*r2*(gbest-x1(x-1));
    v2(x)=v2(x-1)+c1*r1*(pbest2-x2(x-1))+c2*r2*(gbest-x2(x-1));
    v3(x)=v3(x-1)+c1*r1*(pbest3-x3(x-1))+c2*r2*(gbest-x3(x-1));
    v4(x)=v4(x-1)+c1*r1*(pbest4-x4(x-1))+c2*r2*(gbest-x4(x-1));
    
  
    fprintf('\n3. hallar velocidad \n v1(%.0f)=%.4f',x-1,v1(x));
    fprintf('\n v2(%.0f)=%.4f',x-1,v2(x));
    fprintf('\n v3(%.0f)=%.4f',x-1,v3(x));
    fprintf('\n v4(%.0f)=%.4f\n',x-1,v4(x));

    %c. nuevos valores de x
    
    x1(x)=x1(x-1)+v1(x);
    x2(x)=x2(x-1)+v2(x);
    x3(x)=x3(x-1)+v3(x);
    x4(x)=x4(x-1)+v4(x);
    
    fprintf('\n3. hallar nuevos valores de x\n x1(%.0f)=%.4f',x,x1(x));
    fprintf('\n x2(%.0f)=%.4f',x,x2(x));
    fprintf('\n x3(%.0f)=%.4f',x,x3(x));
    fprintf('\n x4(%.0f)=%.4f\n',x,x4(x));
    
    % 5. evaluar los nuevos fitnes 
    
        f1(x) = Fx(x1(x));
        f2(x) = Fx(x2(x));
        f3(x) = Fx(x3(x));
        f4(x) = Fx(x4(x));
        
    fprintf('\n2. hallar los nuevos fitness \n f1(%.0f)=%.4f',x,f1(x));
    fprintf('\n f2(%.0f)=%.4f',x,f2(x));
    fprintf('\n f3(%.0f)=%.4f',x,f3(x));
    fprintf('\n f4x(%.0f)=%.4f\n',x,f4(x));
    l = [x1 x2 x3 x4];
    
end
scatter(l, zeros(x * 4, 1)', [],  sqrt (l.^2 + 0^2), 'filled')

