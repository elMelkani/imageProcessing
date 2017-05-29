function [fmat] = imgprocess( filename, thre, R1, R2, C1, C2 )

%Relevant parameters:
threshold = thre;
cleanLoop = 2;

cd ../
mat = imread(filename);
cd newCode
global smat

%Use small matrix smat from now on...
smat = mat(R1:R2,C1:C2);
[r,c]=size(smat);
%figure,imagesc(smat);
%Threshold check:
for i=1:r;
    for j=1:c;
        if smat(i,j)>=threshold
            smat(i,j)=threshold;
        else
            smat(i,j)=0;
        end
    end
end
%figure,imagesc(smat);
%Cleaning noise:
for k=1:cleanLoop  
    for i=1:r;
        for j=1:c;
            if i==1 || i==r || j==1 || j==c
                smat(i,j)=0;
            elseif smat(i,j) ~= 0
                count = getCount(smat,i,j);
                count = count/threshold;
                if count<2
                    smat(i,j) = -threshold;
                end
            end
        end
    end
    for i=1:r;
        for j=1:c;
            if smat(i,j) < 0
                smat(i,j) = 0;
            end
        end
    end
end
%figure,imagesc(smat);
%Discretization:
fmat = zeros(size(smat));

for i=1:r;
    for j=1:c;
        if smat(i,j) > 0
            O = recursor(i, j);
            II = O(1);
            JJ = O(2);
            cnt = O(3);
            %fmat(round(II/cnt),round(JJ/cnt)) = 1;
            XX = round(II/cnt);
            YY = round(JJ/cnt);
            fmat(XX,YY)= fmat(XX,YY)+2;
            fmat(XX+1,YY)= fmat(XX+1,YY)+1;
            fmat(XX-1,YY)= fmat(XX-1,YY)+1;
            fmat(XX,YY+1)= fmat(XX,YY+1)+1;
            fmat(XX,YY-1)= fmat(XX,YY-1)+1;
            
        end
    end
end
%figure,imagesc(fmat);

end

