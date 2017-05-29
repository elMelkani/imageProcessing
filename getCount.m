function [ count ] = getCount( M,i,j )

count = abs(M(i-1,j-1)) + abs(M(i-1,j)) + abs(M(i-1,j+1)) + abs(M(i+1,j-1)) + abs(M(i+1,j)) + abs(M(i+1,j+1))+ abs(M(i,j-1)) + abs(M(i,j+1));

end

