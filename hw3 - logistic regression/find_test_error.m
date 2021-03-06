function [ test_error ] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   This function takes as inputs the weight vector representing a linear
%   separator (w), the test examples in matrix form with each row
%   representing an example (X), and the labels for the test data as a
%   column vector (y). X does not have a column of 1s as input, so that 
%   should be added. The labels are assumed to be plus or minus one. 
%   The function returns the error on the test examples as a fraction. The
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )

[N, ~] = size(X);
x = [ones(N, 1) X];
% We can use sign because we have to use a prob. of 0.5 as the threshold
% If P was different to 0.5, we would use sigmoid(y.*(x*w')) > P
errors = sign(x*w') - y;
test_error = sum(errors ~= 0) / N;
end