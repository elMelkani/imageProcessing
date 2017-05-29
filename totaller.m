function totaller( f, thre, row1, row2, col1, col2 )
R1 = row1;
R2 = row2;
C1 = col1;
C2 = col2;

R1 = 400;
R2 = 600;
C1 = 525;
C2 = 725;
%{
%}
cd ../
filenames = dir(f);
len = length(filenames);
cd newCode
finalmat = imgprocess(filenames(1).name, thre, R1, R2, C1, C2 );
for x = 2:len
    finalmat = finalmat + imgprocess(filenames(x).name, thre, R1, R2, C1, C2);
end
figure,imagesc(finalmat);
end

