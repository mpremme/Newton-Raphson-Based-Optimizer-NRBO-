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

clear;
close all;
clc;

Population=30;      % Number of Population

Func_name='F10';     % Name of the Test Function

MaxIt=500;          % Maximum number of iterations

% Load details of the selected benchmark function
[LB,UB,dim,fobj]=Get_Functions_details(Func_name);

[Best_Score,Best_Pos,CG_curve] = NRBO(Population,MaxIt,LB,UB,dim,fobj);

%% Plots
figure('Position',[500 500 660 290])

% Draw Search Space
subplot(1,2,1);
func_plot(Func_name);
title('Parameter Space')
xlabel('X_1');
ylabel('X_2');
zlabel([Func_name,'( X_1 , X_2 )'])

% Draw Objective Space
subplot(1,2,2);
semilogy(CG_curve,'Color','r')
title('Objective Space')
xlabel('Iteration');
ylabel('Best Fitness');
axis tight
grid on
box on
legend('NRBO')

display(['Best solution obtained by NRBO is : ', num2str(Best_Pos)]);
display(['Best fitness found by NRBO is     : ', num2str(Best_Score)]);