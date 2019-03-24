local os = require "os"
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

function print_long_number(t)
    local s = ""
    for i = 1, #t do
        s = s .. tostring(t[i])
    end
    print(s)
end

math.randomseed(os.time(nil))
print_long_number(generate_long_number())
print_long_number(generate_long_number())
print_long_number(generate_long_number())
print_long_number(generate_long_number())
print()

local function long_number_to_str(t)
    local s = ""
    for i = 1, #t do
        s = s .. tostring(t[i])
    end
    return s
end

-- [[
-- Умножает число таблицу a на 10^n, возвращает новое число-таблицу.
-- ]]
local function mul10(a, n)
end

-- [[
-- Суммирует два неотрицательных числа-таблицы, возвращает новое число-таблицу.
-- ]]
local function sum(a, b)
end

-- [[
-- Умножение двух чисел-таблиц методом Карацубы. Функция возвращает новое число-таблицу. 
-- Длина чисел должна быть одинаковой и равной 2^n. 
-- В случае несоответствия длин чисел a и b функция mul() вызывает подпрограмму assert().
-- ]]
local function mul_karatsuba(a, b)
    return a
end

local t1 = os.time()
local a, b = generate_long_number(), generate_long_number()
print(string.format("a = %s\nb = %s", long_number_to_str(a), long_number_to_str(b)))
local c = mul_karatsuba(a, b)
print(string.format("a * b = %s", long_number_to_str(c)))
local t2 = os.time()
print(string.format("Execution time: %s sec.", t2 - t1))

