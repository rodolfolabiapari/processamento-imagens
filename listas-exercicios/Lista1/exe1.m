% Exercicio 1
matrix = [1:7; 9:-2:-3; 2.^[2:8]];


% Exercicio 2
vect1 = [1:5];
vect2 = [1 1 1];

matrix1 = (vect2') * vect1;

vect1 = [0:4];
matrix1 = vect2 * (vect1');


% Exercicio 3
t = [1:10];

exp1 = ln(2 + t + t.^2);
exp2 = exp(t * (1 + cos(3 * t)));
exp3 = cos(cos (t)) + sin(sin(t));




% Exercicio 5
Notas = [7.5 8.0 9.0 ; 6.7 7.7 5.4 ; 8.0 9.2 7.4 ; 6.6 6.6 6.6 ; 5.0 8.0 7.0];

notasFinais = sum([Notas Notas(:, 3)], 2) / 4
mediaProvas = mean(Notas)
mediasFinal =mean((sum([Notas Notas(:,3)], 2)) ./ 4)
