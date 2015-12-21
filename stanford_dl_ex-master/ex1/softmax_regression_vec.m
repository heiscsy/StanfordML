function [f,g] = softmax_regression_vec(theta, X,y)
  %
  % Arguments:
  %   theta - A vector containing the parameter values to optimize.
  %       In minFunc, theta is reshaped to a long vector.  So we need to
  %       resize it to an n-by-(num_classes-1) matrix.
  %       Recall that we assume theta(:,num_classes) = 0.
  %
  %   X - The examples stored in a matrix.
  %       X(i,j) is the i'th coordinate of the j'th example.
  %   y - The label for each example.  y(j) is the j'th example's label.
  %

  m=size(X,2);  % number of items
  n=size(X,1);  % feature size

  % theta is a vector;  need to reshape to n x num_classes.
  theta=reshape(theta, n, []);
  num_classes=size(theta,2)+1;

  % initialize objective value and gradient.
  f = 0;
  g = zeros(size(theta));

  %
  % TODO:  Compute the softmax objective function and gradient using vectorized code.
  %        Store the objective function value in 'f', and the gradient in 'g'.
  %        Before returning g, make sure you form it back into a vector with g=g(:);
  %
%%% YOUR CODE HERE %%%

  normalization_vec = sum(exp(theta'*X));

  y_measure = [1:num_classes]';



  for i = 1: m
    f=f-sum((y(i)==y_measure).*log(exp([theta';zeros(1,n)]*X(:,i))/normalization_vec(i)));
    g_temp = X(:,i)*((y(i)==y_measure)-exp([theta';zeros(1,n)]*X(:,i))/normalization_vec(i))';
    g=g-g_temp(:,1:9);
  end


  g=g(:); % make gradient a vector for minFunc
