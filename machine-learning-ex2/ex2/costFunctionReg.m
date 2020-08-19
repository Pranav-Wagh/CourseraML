function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i=1:m
  J += (-y(i,1)*log(sigmoid(X(i,:)*theta)) - (1-y(i,1))*log(1-sigmoid(X(i,:)*theta)))
endfor
J=J/m;

n=size(theta,1)
regular=0;
for j=2:n
  regular += theta(j,1)**2;
endfor
regular=lambda*(1/(2*m))*regular;

J+=regular;

for j=1:n
  for i=1:m
    grad(j,1) += (sigmoid(X(i,:)*theta) - y(i,1))*X(i,j);
  endfor
  if j>1
    grad(j,1)+=(lambda*theta(j,1));
  endif
endfor

grad = grad ./ m;




% =============================================================

end
