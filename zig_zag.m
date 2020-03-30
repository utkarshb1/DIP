function lvec = zig_zag(mat)
im = mat';
[Out_vec,index] = deal(zeros(size(im,1)*size(im,2),1),1);
for i = 1:size(im,1)
    if mod(size(im,1),2) == 0
        if i < size(im,1)
            if mod(i,2) == 0
                k = i;
                for j = 1:i
                    Out_vec(index)=im(k,j);
                    [k,index] = deal(k-1,index+1);
                end
            elseif mod(i,2) ~= 0
                k = 1;
                for j = i:-1:1
                    Out_vec(index) = im(k,j);
                    [k,index] = deal(k+1,index+1);
                end
            end
        elseif i == size(im,1)
            k = i;
            for j = 1:i
                Out_vec(index)=im(k,j);
                [k,index] = deal(k-1,index+1);
            end
            for j = 2:size(im,1)
                if mod(j,2) == 0
                    k = j;
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(k,l);
                        [k,index] = deal(k+1,index+1);
                    end
                elseif mod(j,2) ~= 0
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(l,j);
                        [j,index] = deal(j+1,index+1);
                    end
                end
            end      
        end
    elseif mod(size(im,1),2) ~= 0
        if i < size(im,1)
            if mod(i,2) == 0
                k = i;
                for j = 1:i
                    Out_vec(index)=im(k,j);
                    [k,index] = deal(k-1,index+1);
                end
            elseif mod(i,2) ~= 0
                k = 1;
                for j = i:-1:1
                    Out_vec(index) = im(k,j);
                    [k,index] = deal(k+1,index+1);
                end
            end
        elseif i == size(im,1)
            k = 1;
            for j = i:-1:1
                Out_vec(index) = im(k,j);
                [k,index] = deal(k+1,index+1);
            end
            for j = 2:size(im,1)
                if mod(j,2) == 0
                    k = j;
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(l,k);
                        [k,index] = deal(k+1,index+1);
                    end
                elseif mod(j,2) ~= 0
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(j,l);
                        [j,index] = deal(j+1,index+1);
                    end
                end
            end      
        end
    end
end
lvec = Out_vec;
end