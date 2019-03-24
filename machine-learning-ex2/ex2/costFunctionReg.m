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


%calculates sum of thetas
sumOfTheta = 0;
for i = 2:size(theta)
  sumOfTheta += theta(i)^2;
endfor

%calculates cost J(theta)
J = (1/m)*((-y' * log(sigmoid(X*theta)))-((-y'.+1)*log(1-sigmoid(X*theta))))+(lambda/(2*m))*sumOfTheta;

%gets x at j = 0
tempX = X(:,1);

%gets grad at j = 0
grad = (1/m)*tempX'*((sigmoid(X*theta))-y);

%gets x at all j =/= 0
tempX2 = X;
tempX2(:,1)=[];

%gets all theta j =/= 0
tempTheta = theta;
tempTheta(1) = [];

%gets all the grad j =/= 0
restOfGrad = (1/m)*tempX2'*((sigmoid(X*theta))-y)+(lambda/m*tempTheta);

%puts all grad together
grad = [grad; restOfGrad];

% =============================================================

end
