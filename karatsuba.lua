local os = require "os"
local inspect = require "inspect"
local EXPONENT = 10

function generate_long_number()
    local len = math.pow(2, 3 + math.random(EXPONENT))
    local ret = {}
    ret[#ret + 1] = math.random(9)
    for i = 2, len do
        ret[#ret + 1] = math.random(10) - 1
    end
    return ret
end

local function long_number_to_str(t)
    local s = ""
    if t[1] < 0 then s = '-' end
    for i = 1, #t do
        s = s .. tostring(t[i])
    end
    return s
end

-- [[
-- Умножает число-таблицу a на 10^n, возвращает новое число-таблицу.
-- ]]
local function mul10(a, n)
    local value = math.power(10, n)
    for i = 1, value do
        a[#a + 1] = 0
    end
    return a
end

-- [[
-- Проверяет четное-ли количество аргументов в числе t. Если да, то возвращает два числа,
-- левую и правую половину t.
-- ]]
local function divide_table(t)
    assert(#t % 2 == 0)
    local left, right = {}, {}
    for i = 1, #t / 2 do left[#left + 1] = t[i] end
    for i = #t / 2 + 1, #t do right[#right + 1] = t[i] end
    return left, right
end

local function test_divide_table()
    local a = {1, 2, 3, 4, 5, 6, 7, 8}
    print(string.format("test_divide_table(%s)", long_number_to_str(a)))
    local l, r = divide_table(a)
    print(string.format("left %s right %s", long_number_to_str(l), long_number_to_str(r)))

    local a = {1, 2, 3, 4}
    print(string.format("test_divide_table(%s)", long_number_to_str(a)))
    local l, r =divide_table(a)
    print(string.format("left %s right %s", long_number_to_str(l), long_number_to_str(r)))
end

test_divide_table()

-- [[
-- Суммирует два неотрицательных числа-таблицы, возвращает новое число-таблицу.
-- ]]
local function sum(a, b)
    assert(#a == #b)
    local overflow = false
    local res = {}
    for i = #a, 1, -1 do
        local c = a[i] + b[i] + (overflow and 1 or 0)
        if c >= 10 then
            overflow = true
            res[i] = c % 10
        else
            res[i] = c
            overflow = false
        end
    end
    if overflow then
        -- right res shift
        for i = #a + 1, 2, -1 do
            res[i] = res[i - 1]
        end
        res[1] = 1
    end
    return res
end

local function test_sum()
    print("test_sum()")

    local a, b = {1, 0, 0, 0}, {2, 7, 7, 1}
    print(string.format("a %s b %s", long_number_to_str(a), long_number_to_str(b)))
    local c = sum(a, b)
    print(string.format("a + b = %s", long_number_to_str(c)))

    local a, b = {1, 2, 9, 0}, {8, 7, 7, 1}
    print(string.format("a %s b %s", long_number_to_str(a), long_number_to_str(b)))
    local c = sum(a, b)
    print(string.format("a + b = %s", long_number_to_str(c)))

    local a, b = {1, 0, 4, 9}, {2, 7, 7, 2}
    print(string.format("a %s b %s", long_number_to_str(a), long_number_to_str(b)))
    local c = sum(a, b)
    print(string.format("a + b = %s", long_number_to_str(c)))
end

test_sum()

-- [[
-- Вычитает a - b, возвращает новые число.
-- Знак числа хранится как знак первой цифры в таблице.
-- ]]
local function sub(a, b)
    assert(#a == #b)
end

-- [[
-- Умножение двух чисел-таблиц методом Карацубы. Функция возвращает новое число-таблицу. 
-- Длина чисел должна быть одинаковой и равной 2^n. 
-- В случае несоответствия длин чисел a и b функция mul() вызывает подпрограмму assert().
-- ]]
local function mul_karatsuba(a, b)
    return a
end

function print_long_number(t)
    print(string.format("%s", long_number_to_str(t)))
end

math.randomseed(os.time(nil))
local t1 = os.time()
local a, b = generate_long_number(), generate_long_number()
print(string.format("a = %s\nb = %s", long_number_to_str(a), long_number_to_str(b)))
local c = mul_karatsuba(a, b)
print(string.format("a * b = %s", long_number_to_str(c)))
local t2 = os.time()
print(string.format("Execution time: %s sec.", t2 - t1))

--print_long_number(generate_long_number())
--print_long_number(generate_long_number())
--print_long_number(generate_long_number())
--print_long_number(generate_long_number())

