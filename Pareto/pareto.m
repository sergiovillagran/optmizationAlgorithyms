clc;
clear all;
xInferior = 0;
xSuperior = 4;
xStep = 0.1;

isMin = 1

F = @(x) -(x)^5 + 5*(x)^3 + 20*x -5;
G = @(x) x^5 - 5*(x)^3 - 20*x +5;

counter = 1;

for i = xInferior: xStep: xSuperior
    disp([counter])
    soluciones(counter, 1) = F(i);
    soluciones(counter, 2) = G(i);

    disp(soluciones)
    for j = 1:counter
        if(isMin)
            if(soluciones(counter, :) < soluciones(j, :))
                disp(soluciones(counter, :) < soluciones(j, :));                
                disp([mat2str(soluciones(counter, :)) "min domino" mat2str(soluciones(j, :))]);
                soluciones(j, :) = [];
                disp(soluciones)
                break;
            elseif(soluciones(counter, :) > soluciones(j, :))
                disp(soluciones(counter, :) < soluciones(j, :));                
                disp([mat2str(soluciones(j, :)) "min domino" mat2str(soluciones(counter, :))]);
                soluciones(counter, :) = [];
                disp([soluciones length(soluciones)])
                break;                
            endif
        else
            if(soluciones(counter, :) > soluciones(j, :))
                disp([mat2str(soluciones(counter, :)) "domino" mat2str(soluciones(j, :))]);
                soluciones(j) = [];
                break;                
            elseif(soluciones(counter, :) < soluciones(j, :))
                disp([mat2str(soluciones(j, :)) "domino" mat2str(soluciones(counter, :))]);
                soluciones(counter) = [];
                break;
            end
        endif
    endfor
    counter = (numel(soluciones) / 2) + 1;
    disp([counter])    
endfor
plot(soluciones(:, 1), soluciones(:, 2))