# 2, 14, 26, 38, 50

#Дан целочисленный массив. Необходимо найти индекс минимального элемента.

def index_min(array)
  array.index(array.min)
end

# Дан целочисленный массив и интервал a..b. Необходимо найти количество элементов в этом интервале.

def count_in_range(array, range)
  array.count { |x| range.include? x }
end

# Дан целочисленный массив. Необходимо найти количество элементов между первым и последним минимальным.

def count_between_min(array)
  min = array.min
  array.rindex(min) - array.index(min) - 1
end

# Дан целочисленный массив и отрезок a..b. Необходимо найти количество элементов, значение которых принадлежит этому отрезку.

def count_in_interval(array, range)
  array.count { |x| range.include? x }
end

# Для двух введенных списков L1 и L2 построить новый список, состоящий из элементов,
# встречающихся только в одном из этих списков и не повторяющихся в них.

def diff(a, b)
  a | b - a & b
end

# Вывести все функции

def main
  puts "Введите размер массива: "
  n = gets.chomp.to_i
  a = Array.new(n)
  for i in 0..n-1
    puts "Введите элемент массива: "
    a[i] = gets.chomp.to_i
  end
  # сгенерировать случайный массив b
  b = Array.new(n) { rand(1..10) }
  puts "Индекс минимального элемента: #{index_min(a)}"
  puts "Количество элементов в интервале 5..10: #{count_in_range(a, 2..4)}"
  puts "Количество элементов между первым и последним минимальным: #{count_between_min(a)}"
  puts "Количество элементов в интервале 5..10: #{count_in_interval(a, 2..3)}"
  puts "Элементы, встречающиеся только в одном из списков: #{diff(b, [1, 2, 3, 4, 5])}"
end

main
