function u = tao_functions(matrix)
    matrix1 = matrix;
    matrix1(1,1) = abs(matrix(1,1) - matrix(2,2));
    matrix1(1,2) = abs(matrix(1,2) - matrix(2,2));
    matrix1(1,3) = abs(matrix(1,3) - matrix(2,2));
    matrix1(2,1) = abs(matrix(2,1) - matrix(2,2));
    matrix1(2,3) = abs(matrix(2,3) - matrix(2,2));
    matrix1(3,1) = abs(matrix(3,1) - matrix(2,2));
    matrix1(3,2) = abs(matrix(3,2) - matrix(2,2));
    matrix1(3,3) = abs(matrix(3,3) - matrix(2,2));
    u = tao_function1(matrix1);
    u = max(u, tao_function2(matrix1));
    u = max(u, tao_function3(matrix1));
    u = max(u, tao_function4(matrix1));
    u = max(u, tao_function5(matrix1));
    u = max(u, tao_function6(matrix1));
    u = max(u, tao_function7(matrix1));
    u = max(u, tao_function8(matrix1));
    u = max(u, tao_function9(matrix1));
    u = max(u, tao_function10(matrix1));
    u = max(u, tao_function11(matrix1));
    u = max(u, tao_function12(matrix1));
    u = max(u, tao_function13(matrix1));
    u = max(u, tao_function14(matrix1));
    u = max(u, tao_function15(matrix1));
    u = max(u, tao_function16(matrix1));
end

function u = getU(a, b)
    uB = 1 - exp((-b^2)/(40^2));
    uA = exp((-a^2)/(40^2));
    u = min(uA, uB);
end

function u = tao_function1(matrix)
    %B B A
    %B B A
    %B B A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(2,1));
    b = max(b, matrix(3,1));
    b = max(b, matrix(3,2));
    a = min(matrix(1,3), matrix(2,3));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function2(matrix)
    %B A A
    %B B A
    %B B B
    b = max(matrix(1,1), matrix(2,1));
    b = max(b, matrix(3,1));
    b = max(b, matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,2), matrix(1,3));
    a = min(a, matrix(2,3));
    u = getU(a, b);
end

function u = tao_function3(matrix)
    %A A B
    %A B B
    %B B B
    b = max(matrix(1,3), matrix(2,3));
    b = max(b, matrix(3,1));
    b = max(b, matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(2,1));
    u = getU(a, b);
end

function u = tao_function4(matrix)
    %B B B
    %B B B
    %A A A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(1,3));
    b = max(b, matrix(2,1));
    b = max(b, matrix(2,3));
    a = min(matrix(3,1), matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function5(matrix)
    %B A A
    %B B A
    %B B A
    b = max(matrix(1,1), matrix(2,1));
    b = max(b, matrix(3,1));
    b = max(b, matrix(3,2));
    a = min(matrix(1,2), matrix(1,3));
    a = min(a, matrix(2,3));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function6(matrix)
    %B B B
    %A B B
    %A A A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(1,3));
    b = max(b, matrix(2,3));
    a = min(matrix(2,1), matrix(3,1));
    a = min(a, matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function7(matrix)
    %A A B
    %A B B
    %A B B
    b = max(matrix(1,3), matrix(2,3));
    b = max(b, matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(2,1));
    a = min(a, matrix(3,1));
    u = getU(a, b);
end

function u = tao_function8(matrix)
    %A A A
    %A B B
    %B B B
    b = max(matrix(2,3), matrix(3,1));
    b = max(b, matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(1,3));
    a = min(a, matrix(2,1));
    u = getU(a, b);
end

function u = tao_function9(matrix)
    %A A A
    %B B A
    %B B B
    b = max(matrix(2,1), matrix(3,1));
    b = max(b, matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(1,3));
    a = min(a, matrix(2,3));
    u = getU(a, b);
end

function u = tao_function10(matrix)
    %B B B
    %B B A
    %A A A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(1,3));
    b = max(b, matrix(2,1));
    a = min(matrix(2,3), matrix(3,1));
    a = min(a, matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function11(matrix)
    %B B A
    %B B A
    %B A A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(2,1));
    b = max(b, matrix(3,1));
    a = min(matrix(1,1), matrix(2,3));
    a = min(a, matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function12(matrix)
    %A B B
    %A B B
    %A A B
    b = max(matrix(1,2), matrix(1,3));
    b = max(b, matrix(2,3));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(2,1));
    a = min(a, matrix(3,1));
    a = min(a, matrix(3,2));
    u = getU(a, b);
end

function u = tao_function13(matrix)
    %B B A
    %B B A
    %A A A
    b = max(matrix(1,1), matrix(1,2));
    b = max(b, matrix(2,1));
    a = min(matrix(1,3), matrix(2,3));
    a = min(a, matrix(3,1));
    a = min(a, matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function14(matrix)
    %A A A
    %B B A
    %B B A
    b = max(matrix(2,1), matrix(3,1));
    b = max(b, matrix(3,2));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(1,3));
    a = min(a, matrix(2,3));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function15(matrix)
    %A B B
    %A B B
    %A A A
    b = max(matrix(1,2), matrix(1,3));
    b = max(b, matrix(2,3));
    a = min(matrix(1,1), matrix(2,1));
    a = min(a, matrix(3,1));
    a = min(a, matrix(3,2));
    a = min(a, matrix(3,3));
    u = getU(a, b);
end

function u = tao_function16(matrix)
    %A A A
    %A B B
    %A B B
    b = max(matrix(2,3), matrix(3,2));
    b = max(b, matrix(3,3));
    a = min(matrix(1,1), matrix(1,2));
    a = min(a, matrix(1,3));
    a = min(a, matrix(2,1));
    a = min(a, matrix(3,1));
    u = getU(a, b);
end
