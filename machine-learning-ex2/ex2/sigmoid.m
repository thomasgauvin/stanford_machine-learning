function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

size = size(z);

if(size(1)==1 && size(2)==1)
  g = 1/(1+e^(-z));
elseif(size(2)==1)
  for i = 1:size(1)
    g(i)=1/(1+e^(-z(i)));
  endfor
else(size(1)==2 && size(2)==2)
  for i = 1:size(1)
    for j = 1:size(2)
      g(i,j)=1/(1+e^(-z(i,j)));
    endfor
  endfor
endif




% =============================================================

end
