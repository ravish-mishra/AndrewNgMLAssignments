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
Xtranspose = X';

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

z = X*theta; % Calculating the hypothesis
predictions = sigmoid(z); % Predictions for logistic regression ~ h(x)
J = (-1/m)*sum((y .* log(predictions)) .+ ((1 .- y) .*log(1 .- predictions))) + (lambda/(2*m))*sum(theta(2:size(theta,1), 1).^2);
error = predictions - y;
grad = (1/m)*Xtranspose*error + [0;(lambda/m)*theta(2:size(theta,1), 1)];


% =============================================================

end
