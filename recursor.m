function [ output ] = recursor( I, J )

global smat;
output = [I, J, 1];
smat(I,J) = 0;
if smat(I,J+1) > 0
    output = output + recursor( I,J+1);
end
if smat(I,J-1) > 0
    output = output + recursor( I,J-1);
end
if smat(I+1,J) > 0
    output = output + recursor( I+1,J);
end
if smat(I-1,J) > 0
    output = output + recursor( I-1,J);
end

end