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
size(grad)
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h= sigmoid(X*theta);

j = y'*log(h) + (1-y)'*log(1-h);
thetasq= (theta'*theta) -(theta(1,1)^2);
r = (lambda*.5/m)*(thetasq);
J = j/-m + r;

g=(h-y)'*X;
grad = (g/m)' + ((lambda/m)*theta);
size(grad);

grad(1,1)-= ((lambda/m)*theta(1,1));


% =============================================================

end
