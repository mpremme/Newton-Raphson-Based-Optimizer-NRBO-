% ---------------------------------------------------------------------------------------------------------------------- % 
%  Authors, Inventors, and Programmers: Dr. Sowmya R, Dr. M. Premkumar, and Dr. Pradeep Jangir 
%  E-Mail: mprem.me@gmail.com
% ---------------------------------------------------------------------------------------------------------------------- %
% ---------------------------------------------------------------------------------------------------------------------- %
% Please Refer the Following:
% Newton-Raphson-based optimizer: A new population-based metaheuristic algorithm for continuous optimization problems
% Engineering Applications of Artificial Intelligence,
% Volume 128, 2024,107532.
% ISSN 0952-1976
% https://doi.org/10.1016/j.engappai.2023.107532.
% https://www.sciencedirect.com/science/article/pii/S0952197623017165)
% Cite As: R. Sowmya, M. Premkumar, and P. Jangir, “Newton-Raphson-Based Optimizer: A New Population-Based Metaheuristic Algorithm for Continuous Optimization Problems,” 
% Engineering Applications of Artificial Intelligence, Vol. 128, pp. 107532, February 2024.
% Website: https://premkumarmanoharan.wixsite.com/mysite/downloads 
% ---------------------------------------------------------------------------------------------------------------------- %

% Newton-Raphson Search Rule Function
function NRSR = SearchRule(Best_Pos, Worst_Pos, Position, rho, Flag)
    % Inputs:
    % Best_Pos, Worst_Pos   - Best and worst positions in the population
    % Position              - Current position
    % rho                   - Step size
    % Flag                  - Indicator for search rule application

    dim = size(Position, 2); % Number of dimensions
    DelX = rand(1, dim) .* abs(Best_Pos - Position); % Delta X for search rule

    % Initial Newton-Raphson step
    NRSR = randn * ((Best_Pos - Worst_Pos) .* DelX) ./ (2 * (Best_Pos + Worst_Pos - 2 * Position));  

    % Adjust position based on flag
    if Flag == 1
        Xa = Position - NRSR + rho;                                   
    else
        Xa = Best_Pos - NRSR + rho;
    end    

    % Further refine the Newton-Raphson step
    r1 = rand; r2 = rand; 
    yp = r1 * (mean(Xa + Position) + r1 * DelX);                   
    yq = r2 * (mean(Xa + Position) - r2 * DelX);                   
    NRSR = randn * ((yp - yq) .* DelX) ./ (2 * (yp + yq - 2 * Position));  
end