function u = fuzzy_functions(matrix)
    matrix2 = matrix .^ 2;
    h1 = sum(matrix(1,:));
    h2 = sum(matrix(2,:));
    h3 = sum(matrix(3,:));
    l1 = sum(matrix(:,1));
    l2 = sum(matrix(:,2));
    l3 = sum(matrix(:,3));
    h1_2 = sum(matrix2(1,:));
    h2_2 = sum(matrix2(2,:));
    h3_2 = sum(matrix2(3,:));
    l1_2 = sum(matrix2(:,1));
    l2_2 = sum(matrix2(:,2));
    l3_2 = sum(matrix2(:,3));
    u = fuzzy_function1(matrix, matrix2, h1, h2, h3, h1_2, h2_2, h3_2);
    u = max(u, fuzzy_function2(matrix, matrix2, h1, h2, h3, h1_2, h2_2, h3_2));
    u = max(u, fuzzy_function3(matrix, matrix2, l1, l2, l3, l1_2, l2_2, l3_2));
    u = max(u, fuzzy_function4(matrix, matrix2, l1, l2, l3, l1_2, l2_2, l3_2));
    u = max(u, fuzzy_function5(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function6(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function7(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function8(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function9(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function10(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function11(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function12(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function13(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function14(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function15(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function16(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function17(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function18(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function19(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function20(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function21(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function22(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function23(matrix, matrix2, h1, h3, h1_2, h3_2));
    u = max(u, fuzzy_function24(matrix, matrix2, l1, l3, l1_2, l3_2));
    u = max(u, fuzzy_function25(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function26(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function27(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function28(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function29(matrix, matrix2, l1, l1_2));
    u = max(u, fuzzy_function30(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function31(matrix, matrix2, l3, l3_2));
    u = max(u, fuzzy_function32(matrix, matrix2, l3, l3_2));
end

function u = getU(C, G)
    uC = exp(-C/625);
    uG = 1 - exp(-G/1600);
    u = min(uC, uG);
end

function u = fuzzy_function1(~, ~, h1, h2, h3, h1_2, h2_2, h3_2)
    %global h1 h2 h3;
    %A A A
    %B B B
    %B B B
    %A_avg = matrix(1,1) + matrix(1,2) + matrix(1,3);
    A_avg = h1;
    %B_avg = matrix(2,1) + matrix(2,2) + matrix(2,3) + matrix(3,1) + matrix(3,2) + matrix(3,3);
    B_avg = h2 + h3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + 3*A_avg2 - 2*A_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3));
    %A = h1_2 + 3*A_avg2 - 2*A_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3));
    A = h1_2 + 3*A_avg2 - 2*A_avg*h1;
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    %B = B + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(2,1) + matrix2(2,2) + matrix2(2,3) + matrix2(3,1) + matrix2(3,1) + matrix2(3,2) + matrix2(3,3);
    B = h2_2 + h3_2;
    %B = B - 2*B_avg*(matrix(2,1)+matrix(2,2)+matrix(2,3)+matrix(3,1)+matrix(3,2)+matrix(3,3)) + 6*B_avg2;
    B = B - 2*B_avg*(h2 + h3);
    %B = (B / 6)^0.5;
    B2 = B / 6;
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function2(~, ~, h1, h2, h3, h1_2, h2_2, h3_2)
    %global h1 h2 h3;
    %B B B
    %B B B
    %A A A
    %A_avg = matrix(3,1) + matrix(3,2) + matrix(3,3);
    A_avg = h3;
    %B_avg = matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1) + matrix(2,2) + matrix(2,3);
    B_avg = h1 + h2;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    %A = (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + 3*A_avg2;
    A = h3_2 + 3*A_avg2;
    %A = A - 2*A_avg*(matrix(3,1) + matrix(3,2) + matrix(3,3));
    A = A - 2*A_avg*h3;
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(2,2) + matrix2(2,3);
    B = h1_2 + h2_2;
    %B = B - 2*B_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3)+matrix(2,1)+matrix(2,2)+matrix(2,3)) + 6*B_avg2;
    B = B - 2*B_avg*(h1 + h2) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function3(~, ~, l1, l2, l3, l1_2, l2_2, l3_2)
    %global l1 l2 l3;
    %A B B
    %A B B
    %A B B
    %A_avg = matrix(1,1) + matrix(2,1) + matrix(3,1);
    A_avg = l1;
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,2)) + sum(matrix(:,3));
    B_avg = l2 + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + 3*A_avg2;
    A = l1_2 + 3*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1));
    A = A - 2*A_avg*l1;
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,2)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = B + (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(1,2) + matrix2(2,2) + matrix2(3,2) + matrix2(1,3) + matrix2(2,3) + matrix2(3,3);
    B = l2_2 + l3_2;
    %B = B - 2*B_avg*(matrix(1,2)+matrix(2,2)+matrix(3,2)+matrix(1,3)+matrix(2,3)+matrix(3,3)) + 6*B_avg2;
    B = B - 2*B_avg*(l2 + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function4(~, ~, l1, l2, l3, l1_2, l2_2, l3_2)
    %global l1 l2 l3;
    %B B A
    %B B A
    %B B A
    %A_avg = matrix(1,3) + matrix(2,3) + matrix(3,3);
    A_avg = l3;
    %B_avg = sum(matrix(:,1)) + sum(matrix(:,2));
    B_avg = l1 + l2;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + 3*A_avg2;
    A = l3_2 + 3*A_avg2;
    %A = A - 2*A_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3));
    A = A - 2*A_avg*l3;
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(1,2)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(1,2) + matrix2(2,2) + matrix2(3,2);
    B = l1_2 + l2_2;
    %B = B - 2*B_avg*(matrix(1,1)+matrix(2,1)+matrix(3,1)+matrix(1,2)+matrix(2,2)+matrix(3,2)) + 6*B_avg2;
    B = B - 2*B_avg*(l1 + l2) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function5(matrix, matrix2, l3, l3_2)
    %global l3;
    %A A B
    %A B B
    %B B B
    A_avg = matrix(1,1) + matrix(1,2) + matrix(2,1);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(3,1) + matrix(2,2) + matrix(3,2) + sum(matrix(:,3));
    B_avg = matrix(3,1) + matrix(2,2) + matrix(3,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(2,1)-A_avg)^2;
    A = matrix2(1,1) + matrix2(1,2) + matrix2(2,1) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + matrix(2,1));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,3)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(2,3)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(1,3) + matrix2(2,2) + matrix2(3,1) + matrix2(2,3) + matrix2(3,2) + matrix2(3,3);
    B = matrix2(3,1) + matrix2(2,2) + matrix2(3,2) + l3_2;
    %B = B - 2*B_avg*(matrix(1,3)+matrix(2,2)+matrix(3,1)+matrix(2,3)+matrix(3,2)+matrix(3,3)) + 6*B_avg2;
    B = B - 2*B_avg*(matrix(3,1)+matrix(2,2)+matrix(3,2)+l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function6(matrix, matrix2, l1, l1_2)
    %global l1
    %B A A
    %B B A
    %B B B
    A_avg = matrix(1,2) + matrix(1,3) + matrix(2,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(2,2) + matrix(3,2) + matrix(3,3);
    B_avg = l1 + matrix(2,2) + matrix(3,2) + matrix(3,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2;
    A = matrix2(1,2) + matrix2(1,3) + matrix2(2,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(1,2) + matrix(1,3) + matrix(2,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,2) + matrix2(3,3) + matrix2(2,1) + matrix2(3,1) + matrix2(3,2);
    B = l1_2 + matrix2(2,2) + matrix(3,2) + matrix(3,3);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(2,2)+matrix(3,3)+matrix(2,1)+matrix(3,1)+matrix(3,2)) + 6*B_avg2;
    B = B - 2*B_avg*(l1+matrix(2,2)+matrix(3,2)+matrix(3,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function7(matrix, matrix2, l1, l1_2)
    %global l1;
    %B B B
    %B B A
    %B A A
    A_avg = matrix(2,3) + matrix(3,2) + matrix(3,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(2,2) + matrix(1,3);
    B_avg = l1 + matrix(1,2) + matrix(2,2) + matrix(1,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,3)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    A = matrix2(2,3) + matrix2(3,2) + matrix2(3,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,3) + matrix(3,2) + matrix(3,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(2,2) + matrix2(3,1);
    B = l1_2 + matrix2(1,2) + matrix2(2,2) + matrix(1,3);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3)+matrix(2,1)+matrix(2,2)+matrix(3,1)) + 6*B_avg2;
    B = B - 2*B_avg*(l1 + matrix(1,2) + matrix(2,2) + matrix(1,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function8(matrix, matrix2, l3, l3_2)
    %global l3;
    %B B B
    %A B B
    %A A B
    A_avg = matrix(2,1) + matrix(3,1) + matrix(3,2);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(1,1) + matrix(1,2) + matrix(2,2) + sum(matrix(:,3));
    B_avg = matrix(1,1) + matrix(1,2) + matrix(2,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    A = matrix2(2,1) + matrix2(3,1) + matrix2(3,2) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,1) + matrix(3,1) + matrix(3,2));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,2) + matrix2(2,3) + matrix2(3,3);
    B = matrix2(1,1) + matrix2(1,2) + matrix2(2,2) + l3_2;
    %B = B - 2*B_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3)+matrix(2,2)+matrix(2,3)+matrix(3,3)) + 6*B_avg2;
    B = B - 2*B_avg*(matrix(1,1) + matrix(1,2) + matrix(2,2) + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function9(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %A A A
    %A B B
    %B B B
    %A_avg = matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1);
    A_avg = h1 + matrix(2,1);
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = sum(matrix(3,:)) + matrix(2,2) + matrix(2,3);
    B_avg = h3 + matrix(2,2) + matrix(2,3);
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2 + (matrix(2,1)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + 4*A_avg2;
    A = h1_2 + matrix2(2,1) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1));
    A = A - 2*A_avg*(h1 + matrix(2,1));
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    %B = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + matrix2(2,2) + matrix2(2,3) + 5*B_avg2;
    B = h3_2 + matrix2(2,2) + matrix2(2,3) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(3,1) + matrix(3,2) + matrix(3,3) + matrix(2,2) + matrix(2,3));
    B = B - 2*B_avg*(h3 + matrix(2,2) + matrix(2,3));
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function10(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %B A A
    %B B A
    %B B A
    %A_avg = matrix(1,2) + matrix(1,3) + matrix(2,3) + matrix(3,3);
    A_avg = matrix(1,2) + l3;
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = sum(matrix(:,1)) + matrix(2,2) + matrix(3,2);
    B_avg = l1 + matrix(2,2) + matrix(3,2);
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(1,2) + matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + 4*A_avg2;
    A = matrix2(1,2) + l3_2 + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,2) + matrix(1,3) + matrix(2,3) + matrix(3,3));
    A = A - 2*A_avg*(matrix(1,2) + l3);
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(2,2)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(2,2) + matrix2(3,2) + 5*B_avg2;
    B = l1_2 + matrix2(2,2) + matrix2(3,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(2,2) + matrix(3,2));
    B = B - 2*B_avg*(l1 + matrix(2,2) + matrix(3,2));
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function11(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %B B B
    %B B A
    %A A A
    %A_avg = matrix(2,3) + matrix(3,1) + matrix(3,2) + matrix(3,3);
    A_avg = h3 + matrix(2,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = sum(matrix(1,:)) + matrix(2,1) + matrix(2,2);
    B_avg = h1 + matrix(2,1) + matrix(2,2);
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,3)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(2,3) + matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + 4*A_avg2;
    A = h3_2 + matrix2(2,3) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(2,3) + matrix(3,1) + matrix(3,2) + matrix(3,3));
    A = A - 2*A_avg*(h3 + matrix(2,3));
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(2,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1) + matrix(2,2));
    B = h1_2 + matrix2(2,1) + matrix2(2,2) + 5*B_avg2;
    B = B - 2*B_avg*(h1 + matrix(2,1) + matrix(2,2));
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function12(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %A B B
    %A B B
    %A A B
    %A_avg = matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(3,2);
    A_avg = l1 + matrix(3,2);
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = matrix(1,2) + matrix(2,2) + sum(matrix(:,3));
    B_avg = matrix(1,2) + matrix(2,2) + l3;
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(3,2) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(3,2));
    A = l1_2 + matrix2(3,2) + 4*A_avg2;
    A = A - 2*A_avg*(l1 + matrix(3,2));
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(1,2)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    %B = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(1,2) + matrix2(2,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3) + matrix(1,2) + matrix(2,2));
    B = matrix2(1,2) + matrix2(2,2) + l3_2 + 5*B_avg2;
    B = B - 2*B_avg*(matrix(1,2) + matrix(2,2) + l3);
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function13(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %A A A
    %B B A
    %B B B
    %A_avg = matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,3);
    A_avg = h1 + matrix(2,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = matrix(1,2) + matrix(2,2) + sum(matrix(3,:));
    B_avg = matrix(1,2) + matrix(2,2) + h3;
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,3) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,3));
    A = h1_2 + matrix2(2,3) + 4*A_avg2;
    A = A - 2*A_avg*(h1 + matrix(2,3));
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    %B = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + matrix2(2,1) + matrix2(2,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(3,1) + matrix(3,2) + matrix(3,3) + matrix(2,1) + matrix(2,2));
    B = matrix2(1,2) + matrix2(2,2) + h3_2 + 5*B_avg2;
    B = B - 2*B_avg*(matrix(1,2) + matrix(2,2) + h3);
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function14(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %B B A
    %B B A
    %B A A
    %A_avg = matrix(1,3) + matrix(2,3) + matrix(3,2) + matrix(3,3);
    A_avg = matrix(3,2) + l3;
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(2,2);
    B_avg = l1 + matrix(1,2) + matrix(2,2);
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    %A = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(3,2) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3) + matrix(3,2));
    A = matrix2(3,2) + l3_2 + 4*A_avg2;
    A = A - 2*A_avg*(matrix(3,2) + l3);
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(1,2)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(1,2) + matrix2(2,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(1,2) + matrix(2,2));
    B = l1_2 + matrix2(1,2) + matrix2(2,2) + 5*B_avg2;
    B = B - 2*B_avg*(l1 + matrix(1,2) + matrix(2,2));
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function15(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %B B B
    %A B B
    %A A A
    %A_avg = matrix(2,1) + matrix(3,1) + matrix(3,2) + matrix(3,3);
    A_avg = matrix(2,1) + h3;
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = sum(matrix(1,:)) + matrix(2,2) + matrix(2,3);
    B_avg = h1 + matrix(2,2) + matrix(2,3);
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(2,1) + matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(2,1) + matrix(3,1) + matrix(3,2) + matrix(3,3));
    A = matrix2(2,1) + h3_2 + 4*A_avg2;
    A = A - 2*A_avg*(matrix(2,1) + h3);
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(2,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1) + matrix(2,2));
    B = h1_2 + matrix2(2,2) + matrix2(2,3) + 5*B_avg2;
    B = B - 2*B_avg*(h1 + matrix(2,2) + matrix(2,3));
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function16(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %A A B
    %A B B
    %A B B
    %A_avg = matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(1,2);
    A_avg = l1 + matrix(1,2);
    %B_avg = (sum(matrix, 'all') - A_avg) / 5;
    %B_avg = matrix(2,2) + matrix(3,2) + sum(matrix(:,3));
    B_avg = matrix(2,2) + matrix(3,2) + l3;
    B_avg = B_avg / 5;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 4;
    A_avg2 = A_avg^2;
    
    %A = (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(1,2) + 4*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(1,2));
    A = l1_2 + matrix2(1,2) + 4*A_avg2;
    A = A - 2*A_avg*(l1 + matrix(1,2));
    %A = (A / 4)^0.5;
    A2 = A / 4;
    %B = (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(2,2)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(2,2) + matrix2(3,2) + 5*B_avg2;
    %B = B - 2*B_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3) + matrix(2,2) + matrix(3,2));
    B = matrix2(2,2) + matrix2(3,2) + l3_2 + 5*B_avg2;
    B = B - 2*B_avg*(matrix(2,2) + matrix(3,2) + l3);
    %B = (B / 5)^0.5;
    B2 = B / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function17(matrix, matrix2, l1, l1_2)
    %global l1;
    %A A A
    %A B B
    %A B B
    B_avg = matrix(2,2) + matrix(2,3) + matrix(3,2) + matrix(3,3);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(1,3);
    A_avg = l1 + matrix(1,2) + matrix(1,3);
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    B = matrix2(2,2) + matrix2(2,3) + matrix2(3,2) + matrix2(3,3) + 4*B_avg2;
    B = B - 2*B_avg*(matrix(2,2) + matrix(2,3) + matrix(3,2) + matrix(3,3));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2;
    %A = A + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(3,1) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(2,1) + matrix(1,2) + matrix(1,3) + matrix(2,1) + matrix(3,1));
    A = l1_2 + matrix2(1,2) + matrix2(1,3) + 5*A_avg2;
    A = A - 2*A_avg*(l1 + matrix(1,2) + matrix(1,3));
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function18(matrix, matrix2, l3, l3_2)
    %global l3;
    %A A A
    %B B A
    %B B A
    B_avg = matrix(2,1) + matrix(2,2) + matrix(3,1) + matrix(3,2);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = matrix(1,1) + matrix(1,2) + sum(matrix(:,3));
    A_avg = matrix(1,1) + matrix(1,2) + l3;
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    B = matrix2(2,1) + matrix2(2,2) + matrix2(3,1) + matrix2(3,2) + 4*B_avg2;
    B = B - 2*B_avg*(matrix(2,1) + matrix(2,2) + matrix(3,1) + matrix(3,2));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2;
    %A = A + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,3) + matrix(3,3));
    A = matrix2(1,1) + matrix2(1,2) + l3_2 + 5*A_avg2;
    A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + l3);
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function19(matrix, matrix2, l3, l3_2)
    %global l3;
    %B B A
    %B B A
    %A A A
    B_avg = matrix(1,1) + matrix(1,2) + matrix(2,1) + matrix(2,2);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = matrix(3,1) + matrix(3,2) + sum(matrix(:,3));
    A_avg = matrix(3,1) + matrix(3,2) + l3;
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(2,2)-B_avg)^2;
    B = matrix2(1,1) + matrix2(1,2) + matrix2(2,1) + matrix2(2,2) + 4*B_avg2;
    B = B - 2*B_avg*(matrix(1,1) + matrix(1,2) + matrix(2,1) + matrix(2,2));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = A + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    %A = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(3,1) + matrix2(3,2) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3) + matrix(3,1) + matrix(3,2));
    A = matrix2(3,1) + matrix2(3,2) + l3_2 + 5*A_avg2;
    A = A - 2*A_avg*(matrix(3,1) + matrix(3,2) + l3);
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function20(matrix, matrix2, l1, l1_2)
    %global l1;
    %A B B
    %A B B
    %A A A
    B_avg = matrix(1,2) + matrix(1,3) + matrix(2,2) + matrix(2,3);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = sum(matrix(:,1)) + matrix(3,2) + matrix(3,3);
    A_avg = l1 + matrix(3,2) + matrix(3,3);
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2 + (matrix(2,2)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    B = matrix2(1,2) + matrix2(1,3) + matrix2(2,2) + matrix2(2,3) + 4*B_avg2;
    B = B - 2*B_avg*(matrix(1,2) + matrix(1,3) + matrix(2,2) + matrix(2,3));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2;
    %A = A + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(3,2) + matrix(3,3));
    A = l1_2 + matrix2(3,2) + matrix2(3,3) + 5*A_avg2;
    A = A - 2*A_avg*(l1 + matrix(3,2) + matrix(3,3));
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function21(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %A A A
    %A B A
    %B B B
    %B_avg = matrix(2,2) + matrix(3,1) + matrix(3,2) + matrix(3,3);
    B_avg = h3 + matrix(2,2);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = sum(matrix(1,:)) + matrix(2,1) + matrix(2,3);
    A_avg = h1 + matrix(2,1) + matrix(2,3);
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,2)-B_avg)^2 + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(2,2) + matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + 4*B_avg2;
    %B = B - 2*B_avg*(matrix(2,2) + matrix(3,1) + matrix(3,2) + matrix(3,3));
    B = h3_2 + matrix2(2,2) + 4*B_avg2;
    B = B - 2*B_avg*(h3 + matrix(2,2));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2;
    %A = A + (matrix(2,1)-A_avg)^2 + (matrix(2,3)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(2,3) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(1,2) + matrix(1,3) + matrix(2,1) + matrix(2,3));
    A = h1_2 + matrix2(2,1) + matrix2(2,3) + 5*A_avg2;
    A = A - 2*A_avg*(h1 + matrix(2,1) + matrix(2,3));
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function22(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %B A A
    %B B A
    %B A A
    %B_avg = matrix(2,2) + matrix(1,1) + matrix(2,1) + matrix(3,1);
    B_avg = l1 + matrix(2,2);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = matrix(1,2) + matrix(3,2) + sum(matrix(:,3));
    A_avg = matrix(1,2) + matrix(3,2) + l3;
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,2)-B_avg)^2 + (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = matrix2(2,2) + matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + 4*B_avg2;
    %B = B - 2*B_avg*(matrix(2,2) + matrix(1,1) + matrix(2,1) + matrix(3,1));
    B = l1_2 + matrix2(2,2) + 4*B_avg2;
    B = B - 2*B_avg*(l1 + matrix(2,2));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = A + (matrix(1,2)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    %A = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(1,2) + matrix2(3,2) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,3) + matrix(2,3) + matrix(3,3) + matrix(1,2) + matrix(3,2));
    A = matrix2(1,2) + matrix2(3,2) + l3_2 + 5*A_avg2;
    A = A - 2*A_avg*(matrix(1,2) + matrix(3,2) + l3);
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function23(matrix, matrix2, h1, h3, h1_2, h3_2)
    %global h1 h3;
    %B B B
    %A B A
    %A A A
    %B_avg = matrix(2,2) + matrix(1,1) + matrix(1,2) + matrix(1,3);
    B_avg = h1 + matrix(2,2);
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = matrix(2,1) + sum(matrix(3,:)) + matrix(2,3);
    A_avg = matrix(2,1) + h3 + matrix(2,3);
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,2)-B_avg)^2 + (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = matrix2(2,2) + matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + 4*B_avg2;
    %B = B - 2*B_avg*(matrix(2,2) + matrix(1,1) + matrix(1,2) + matrix(1,3));
    B = h1_2 + matrix2(2,2) + 4*B_avg2;
    B = B - 2*B_avg*(h1 + matrix(2,2));
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    %A = A + (matrix(2,1)-A_avg)^2 + (matrix(2,3)-A_avg)^2;
    %A = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + matrix2(2,1) + matrix2(2,3) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(3,1) + matrix(3,2) + matrix(3,3) + matrix(2,1) + matrix(2,3));
    A = matrix2(2,1) + h3_2 + matrix2(2,3) + 5*A_avg2;
    A = A - 2*A_avg*(matrix(2,1) + h3 + matrix(2,3));
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function24(matrix, matrix2, l1, l3, l1_2, l3_2)
    %global l1 l3;
    %A A B
    %A B B
    %A A B
    %B_avg = matrix(2,2) + matrix(1,3) + matrix(2,3) + matrix(3,3);
    B_avg = matrix(2,2) + l3;
    %A_avg = (sum(matrix, 'all') - B_avg) / 5;
    %A_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(3,2);
    A_avg = l1 + matrix(1,2) + matrix(3,2);
    A_avg = A_avg / 5;
    A_avg2 = A_avg^2;
    B_avg = B_avg / 4;
    B_avg2 = B_avg^2;
    
    %B = (matrix(2,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(2,2) + matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + 4*B_avg2;
    %B = B - 2*B_avg*(matrix(2,2) + matrix(1,3) + matrix(2,3) + matrix(3,3));
    B = matrix2(2,2) + l3_2 + 4*B_avg2;
    B = B - 2*B_avg*(matrix(2,2) + l3);
    %B = (B / 4)^0.5;
    B2 = B / 4;
    %A = (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2;
    %A = A + (matrix(1,2)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    %A = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(1,2) + matrix2(3,2) + 5*A_avg2;
    %A = A - 2*A_avg*(matrix(1,1) + matrix(2,1) + matrix(3,1) + matrix(1,2) + matrix(3,2));
    A = l1_2 + matrix2(1,2) + matrix2(3,2) + 5*A_avg2;
    A = A - 2*A_avg*(l1 + matrix(1,2) + matrix(3,2));
    %A = (A / 5)^0.5;
    A2 = A / 5;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function25(matrix, matrix2, l3, l3_2)
    %global l3;
    %A A B
    %B A B
    %B B B
    A_avg = matrix(2,2) + matrix(1,1) + matrix(1,2);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(2,1) + matrix(3,1) + matrix(3,2) + sum(matrix(:,3));
    B_avg = matrix(2,1) + matrix(3,1) + matrix(3,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(1,1)-A_avg)^2 + (matrix(1,2)-A_avg)^2;
    A = matrix2(2,2) + matrix2(1,1) + matrix2(1,2) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(1,1) + matrix(1,2));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(2,1) + matrix2(3,1) + matrix2(3,2);
    %B = B - 2*B_avg*(matrix(1,3)+matrix(2,3)+matrix(3,3)+matrix(2,1)+matrix(3,1)+matrix(3,2)) + 6*B_avg2;
    B = matrix2(2,1) + matrix2(3,1) + matrix2(3,2) + l3_2;
    B = B - 2*B_avg*(matrix(2,1) + matrix(3,1) + matrix(3,2) + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function26(matrix, matrix2, l1, l1_2)
    %global l1;
    %B A A
    %B A B
    %B B B
    A_avg = matrix(2,2) + matrix(1,2) + matrix(1,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(3,2) + matrix(2,3) + matrix(3,3);
    B_avg = l1 + matrix(3,2) + matrix(2,3) + matrix(3,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(1,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2;
    A = matrix2(2,2) + matrix2(1,2) + matrix2(1,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(1,2) + matrix(1,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(2,3)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(2,3) + matrix2(3,2) + matrix2(3,3);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(2,1)+matrix(3,1)+matrix(2,3)+matrix(3,2)+matrix(3,3)) + 6*B_avg2;
    B = l1_2 + matrix2(3,2) + matrix2(2,3) + matrix2(3,3);
    B = B - 2*B_avg*(l1 + matrix(3,2) + matrix(2,3) + matrix(3,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function27(matrix, matrix2, l1, l1_2)
    %global l1;
    %B B A
    %B A A
    %B B B
    A_avg = matrix(2,2) + matrix(1,3) + matrix(2,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(3,2) + matrix(3,3);
    B_avg = l1 + matrix(1,2) + matrix(3,2) + matrix(3,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(1,3)-A_avg)^2 + (matrix(2,3)-A_avg)^2;
    A = matrix2(2,2) + matrix2(1,3) + matrix2(2,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(1,3) + matrix(2,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(2,1)-B_avg)^2;
    %B = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + matrix2(1,1) + matrix2(1,2) + matrix2(2,1);
    %B = B - 2*B_avg*(matrix(3,1)+matrix(3,2)+matrix(3,3)+matrix(1,1)+matrix(1,2)+matrix(2,1)) + 6*B_avg2;
    B = l1_2 + matrix2(1,2) + matrix2(3,2) + matrix2(3,3);
    B = B - 2*B_avg*(l1 + matrix(1,2) + matrix(3,2) + matrix(3,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function28(matrix, matrix2, l1, l1_2)
    %global l1;
    %B B B
    %B A A
    %B B A
    A_avg = matrix(2,2) + matrix(2,3) + matrix(3,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(3,2) + matrix(1,3);
    B_avg = l1 + matrix(1,2) + matrix(3,2) + matrix(1,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(2,3)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    A = matrix2(2,2) + matrix2(2,3) + matrix2(3,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(2,3) + matrix(3,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,1) + matrix2(3,1) + matrix2(3,2);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3)+matrix(2,1)+matrix(3,1)+matrix(3,2)) + 6*B_avg2;
    B = l1_2 + matrix2(1,2) + matrix2(3,2) + matrix2(1,3);
    B = B - 2*B_avg*(l1 + matrix(1,2) + matrix(3,2) + matrix(1,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function29(matrix, matrix2, l1, l1_2)
    %global l1;
    %B B B
    %B A B
    %B A A
    A_avg = matrix(2,2) + matrix(3,2) + matrix(3,3);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = sum(matrix(:,1)) + matrix(1,2) + matrix(1,3) + matrix(2,3);
    B_avg = l1 + matrix(1,2) + matrix(1,3) + matrix(2,3);
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(3,2)-A_avg)^2 + (matrix(3,3)-A_avg)^2;
    A = matrix2(2,2) + matrix2(3,2) + matrix2(3,3) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(3,2) + matrix(3,3));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(2,1)-B_avg)^2 + (matrix(3,1)-B_avg)^2;
    %B = B + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(2,1) + matrix2(3,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,3);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(2,1)+matrix(3,1)+matrix(1,2)+matrix(1,3)+matrix(2,3)) + 6*B_avg2;
    B = l1_2 + matrix2(1,2) + matrix2(1,3) + matrix2(2,3);
    B = B - 2*B_avg*(l1 + matrix(1,2) + matrix(1,3) + matrix(2,3)) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function30(matrix, matrix2, l3, l3_2)
    %global l3;
    %B B B
    %B A B
    %A A B
    A_avg = matrix(2,2) + matrix(3,1) + matrix(3,2);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(1,1) + matrix(2,1) + matrix(1,2) + sum(matrix(:,3));
    B_avg = matrix(1,1) + matrix(2,1) + matrix(1,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(3,1)-A_avg)^2 + (matrix(3,2)-A_avg)^2;
    A = matrix2(2,2) + matrix2(3,1) + matrix2(3,2) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(3,1) + matrix(3,2));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(2,1)-B_avg)^2;
    %B = matrix2(1,3) + matrix2(2,3) + matrix2(3,3) + matrix2(1,1) + matrix2(1,2) + matrix2(2,1);
    %B = B - 2*B_avg*(matrix(1,3)+matrix(2,3)+matrix(3,3)+matrix(1,1)+matrix(1,2)+matrix(2,1)) + 6*B_avg2;
    B = matrix2(1,1) + matrix2(2,1) + matrix2(1,2) + l3_2;
    B = B - 2*B_avg*(matrix(1,1) + matrix(2,1) + matrix(1,2) + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function31(matrix, matrix2, l3, l3_2)
    %global l3;
    %B B B
    %A A B
    %A B B
    A_avg = matrix(2,2) + matrix(2,1) + matrix(3,1);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(1,1) + matrix(1,2) + matrix(3,2) + sum(matrix(:,3));
    B_avg = matrix(1,1) + matrix(1,2) + matrix(3,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(2,1)-A_avg)^2 + (matrix(3,1)-A_avg)^2;
    A = matrix2(2,2) + matrix2(2,1) + matrix2(3,1) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(2,1) + matrix(3,1));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(1,1)-B_avg)^2 + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2;
    %B = B + (matrix(2,3)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = matrix2(1,1) + matrix2(1,2) + matrix2(1,3) + matrix2(2,3) + matrix2(3,2) + matrix2(3,3);
    %B = B - 2*B_avg*(matrix(1,1)+matrix(1,2)+matrix(1,3)+matrix(2,3)+matrix(3,2)+matrix(3,3)) + 6*B_avg2;
    B = matrix2(1,1) + matrix2(1,2) + matrix2(3,2) + l3_2;
    B = B - 2*B_avg*(matrix(1,1) + matrix(1,2) + matrix(3,2) + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end

function u = fuzzy_function32(matrix, matrix2, l3, l3_2)
    %global l3;
    %A B B
    %A A B
    %B B B
    A_avg = matrix(2,2) + matrix(1,1) + matrix(2,1);
    %B_avg = (sum(matrix, 'all') - A_avg) / 6;
    %B_avg = matrix(3,1) + matrix(1,2) + matrix(3,2) + sum(matrix(:,3));
    B_avg = matrix(3,1) + matrix(1,2) + matrix(3,2) + l3;
    B_avg = B_avg / 6;
    B_avg2 = B_avg^2;
    A_avg = A_avg / 3;
    A_avg2 = A_avg^2;
    
    %A = (matrix(2,2)-A_avg)^2 + (matrix(1,1)-A_avg)^2 + (matrix(2,1)-A_avg)^2;
    A = matrix2(2,2) + matrix2(1,1) + matrix2(2,1) + 3*A_avg2;
    A = A - 2*A_avg*(matrix(2,2) + matrix(1,1) + matrix(2,1));
    %A = (A / 3)^0.5;
    A2 = A / 3;
    %B = (matrix(3,1)-B_avg)^2 + (matrix(3,2)-B_avg)^2 + (matrix(3,3)-B_avg)^2;
    %B = B + (matrix(1,2)-B_avg)^2 + (matrix(1,3)-B_avg)^2 + (matrix(2,3)-B_avg)^2;
    %B = matrix2(3,1) + matrix2(3,2) + matrix2(3,3) + matrix2(1,2) + matrix2(1,3) + matrix2(2,3);
    %B = B - 2*B_avg*(matrix(3,1)+matrix(3,2)+matrix(3,3)+matrix(1,2)+matrix(1,3)+matrix(2,3)) + 6*B_avg2;
    B = matrix2(3,1) + matrix2(1,2) + matrix2(3,2) + l3_2;
    B = B - 2*B_avg*(matrix(3,1) + matrix(1,2) + matrix(3,2) + l3) + 6*B_avg2;
    %B = (B / 6)^0.5;
    B2 = B / 6;
    
    G = A_avg2 + B_avg2 - 2*A_avg*B_avg;
    C = min(A2, B2);
    u = getU(C, G);
end
