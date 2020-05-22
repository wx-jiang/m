% A.inp is the *Node in the original inp
% B.inp is the *Element in the original inp
load A.inp;
load B.inp;
xlow = min(A(:, 2)) * 1000;
xtop = max(A(:, 2)) * 1000;
ylow = min(A(:, 3)) * 1000;
ytop = max(A(:, 3)) * 1000;
% zlow = min(A(:, 4));
% ztop = max(A(:, 4));

L = size(B); % L is the number of element
L = L(1);
N_side = input('please enter the size of grains you wanted: ', 's');
N_side = str2num(N_side);
x_num = round((xtop - xlow) / N_side);
y_num = round((ytop - ylow) / N_side);
grain_num = x_num * y_num;
side = (-1 + (1 - (-1)) * rand(grain_num, 2)) * (N_side / 10);
K = size(side);
K = K(1);
rand('state', 0);
for i = 1 : x_num
    for j = 1 : y_num
        Side((i - 1) * y_num + j, 1) = xlow + (N_side/2) + (i-1) * N_side + side((i - 1) * y_num + j, 1);
        Side((i - 1) * y_num + j, 2) = ylow + (N_side/2) + (j-1) * N_side + side((i - 1) * y_num + j, 2);
%    Side(i, 3) = zlow * 0.9 + (ztop - zlow) * 0.9 * side(i, 3);
    end
end

Numele = 0;
Ngrain = 0;
he(K + 1).element(1) = 0;
for i = 1 : L
    for j = 1 : K
        node2 = B(i, 2);
        node4 = B(i, 4);
        node = [(A(node2, 2) + A(node4, 2)) / 2 * 1000, (A(node2, 3) + A(node4, 3)) / 2 * 1000,];
% three dimension        d = sqrt((node(1) - Side(j, 1)) ^ 2 + (node(2) - Side(j, 2)) ^ 2 + (node(3) - Side(j, 3)) ^ 2);
        d = sqrt((node(1) - Side(j, 1)) ^ 2 + (node(2) - Side(j, 2)) ^ 2);
        if j == 1
            dim = d;
            d1 = d;
        end
        if d < dim
            dim = d;
            Numele = i;
            Ngrain = j;
        end
    end
    if dim == d1
        d1 = 0;
        lo = size(he(1).element);
        lo = lo(2);
        he(1).element(lo + 1) = i;
    else
        lo = size(he(Ngrain).element);
        lo = lo(2);
        he(Ngrain).element(lo + 1) = Numele;
    end
end