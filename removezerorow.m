function array_out=removezerorow(array_in)
% function used to remove all zero rows of a matric
array_in (all(array_in == 0, 2),:) = [];
array_out=array_in;