%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%- Calculating Shapley Value in the Cooperative Games --------------------
%- Programmed by Hamidreza Mahini ----------------------------------------
%- 11/25/2018 ------------------------------------------------------------
%- Email: hamidreza.mahini@gmail.com -------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [shapleyValues, temp] = shapleyValue(n, coalitionOutcomes)
    seq = (n:-1:1);
    grandCoals = perms(seq);
    payoffs = zeros(n,1);
    temp = zeros(size(grandCoals,1),n);
    for row=1:size(grandCoals,1)
        j = 0;
        for col=1:size(grandCoals,2)
            k = j;
            i = grandCoals(row, col);
            j = j + 2^(i-1);
            if(k>0)
                payoffs(i) = payoffs(i) + coalitionOutcomes(j)-coalitionOutcomes(k);
                temp(row, i) = coalitionOutcomes(j)-coalitionOutcomes(k);
            else
                payoffs(i) = payoffs(i) + coalitionOutcomes(j);
                temp(row, i) = coalitionOutcomes(j);
            end    
        end
    end    
    shapleyValues = mean(temp);
end