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

% This function initialize the first population 
function X=initialization(nP,dim,ub,lb)
Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb

if Boundary_no==1
    X=rand(nP,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        X(:,i)=rand(nP,1).*(ub(i)-lb(i))+lb(i);
    end
end