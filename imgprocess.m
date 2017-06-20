function [fmat] = imgprocess( filename, thre1, thre2, fX, fY, scale )

%Relevant parameters:
threshold = thre1;
cleanLoop = 2;

cd ../
mat = imread(filename);
cd abhijeetCode
global smat

%Use small matrix smat from now on...
if fX==0 && fY ==0
    smat = mat;
else
    [mR,mC] = size(mat);
    R1 = round(fY - 0.5*scale*mR);
    R2 = round(fY + 0.5*scale*mR);
    C1 = round(fX - 0.5*scale*mC);
    C2 = round(fX + 0.5*scale*mC);
    smat = mat(R1:R2,C1:C2);
end
[r,c]=size(smat);

%Threshold check:
for i=1:r;
    for j=1:c;
        if smat(i,j)>=threshold && smat(i,j) < thre2
            smat(i,j)=threshold;
        else
            smat(i,j)=0;
        end
    end
end

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

%Discretization:
fmat = zeros(size(smat));

for i=1:r;
    for j=1:c;
        if smat(i,j) > 0
            O = recursor(i, j);
            II = O(1);
            JJ = O(2);
            cnt = O(3);

            XX = round(II/cnt);
            YY = round(JJ/cnt);
            fmat(XX,YY)= fmat(XX,YY)+1;
            fmat(XX+1,YY)= fmat(XX+1,YY)+1;
            fmat(XX-1,YY)= fmat(XX-1,YY)+1;
            fmat(XX,YY+1)= fmat(XX,YY+1)+1;
            fmat(XX,YY-1)= fmat(XX,YY-1)+1;
            
        end
    end
end
end

