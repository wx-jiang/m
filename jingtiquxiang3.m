% Ang's size is [grains, 3]
Ang = rand(K, 3);
Ang(:, 2) = 0;
Ang(:, 3) = 0;
Ang = Ang.*90;
Ang = ceil(Ang);

L1 = size(Ang);
L = L1(1);
for i = 1 : L
    curr1 = cos(Ang(i, 1)) * cos(Ang(i, 3)) - sin(Ang(i, 1)) * sin(Ang(i, 3)) * cos(Ang(i, 2));
    curr2 = sin(Ang(i, 1)) * cos(Ang(i, 3)) + cos(Ang(i, 1)) * sin(Ang(i, 3)) * cos(Ang(i, 2));
    curr3 = sin(Ang(i, 3)) * sin(Ang(i, 2));
    curr4 = -cos(Ang(i, 1)) * sin(Ang(i, 3)) - sin(Ang(i, 1)) * cos(Ang(i, 3)) * cos(Ang(i, 2));
    curr5 = -sin(Ang(i, 1)) * sin(Ang(i, 3)) + cos(Ang(i, 1)) * cos(Ang(i, 3)) * cos(Ang(i, 2));
    curr6 = cos(Ang(i, 3)) * sin(Ang(i, 2));
    curr7 = sin(Ang(i, 1)) * sin(Ang(i, 2));
    curr8 = -cos(Ang(i, 1)) * sin(Ang(i, 2));
    curr9 = cos(Ang(i, 2));
    hkl = [curr1, curr2, curr3; curr4, curr5, curr6; curr7, curr8, curr9];
    HKL(2 * i - 1, :) = [hkl(1, 3) hkl(2, 3) hkl(3, 3)];
    HKL(2 * i, :) = [hkl(1, 1), hkl(2, 1), hkl(3, 1)];
end

for i = 1 : L
    O(2 * i - 1, :) = [HKL(2 * i - 1, :), 0.0, 0.0, 1.0, 0.0, 0.0];
    O(2 * i, :) = [HKL(2 * i, :), 1.0, 0.0, 0.0, 0.0, 0.0];
end