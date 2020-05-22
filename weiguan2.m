fid = fopen('jihuo_test.txt', 'a+')
for i = 1 : K
    lonth = size(he(i).element);
    Lo = lonth(2);
    
    fprintf(fid, '*Elset, elset = cry%i\n', i);
    fprintf(fid, '%2i, %2i, %2i, %2i, %2i, %2i, %2i, %2i, %2i, %2i \n', he(i).element);

    if(mod(Lo, 10) ~= 0 || Lo == 0)
        fprintf(fid, '\n');
    end

    fprintf(fid, '*Solid Section, elset = cry%i, material = CRYSTAL%i\n', i, i);
    fprintf(fid, '%2.1f,', 1.);
    fprintf(fid, ' \n');
end
fclose(fid)