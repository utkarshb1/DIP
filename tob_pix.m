function val = tob_pix(i,j,img,ig1)
m = [img(i,j) img(i,j+1) img(i+1,j+1) img(i+1,j) img(i+1,j-1) img(i,j-1) ...
    img(i-1,j-1) img(i-1,j) img(i-1,j+1)];
mn = min(m);
p = find(m == mn);

if p == 1
    val = ig1(i,j);
elseif p == 2
    val = ig1(i,j+1);
elseif p == 3
    val = ig1(i+1,j+1);
elseif p == 4
    val = ig1(i+1,j);
elseif p == 5
    val = ig1(i+1,j-1);
elseif p == 6
    val = ig1(i,j-1);
elseif p == 7
    val = ig1(i-1,j-1);
elseif p == 8
    val = ig1(i-1,j);
elseif p == 9
    val = ig1(i-1,j+1);
end
end