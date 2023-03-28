require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student.rb'
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'data_list_student_short.rb'
require_relative 'data_table'

test1 = Student.parse(34, 'Иванов,Иван,Иванович,https://github.com/Ivanov,+79001234567,@ivanov,ivanov@gmail.com')
test2 = Student.parse(31, 'Петров,Петр,Петрович,https://github.com/Petrov,+79002345678,@petrov,petrov@gmail.com')
test3 = Student.parse(67, 'Алешина,Василиса,Денисовна,https://github.com/Popchik,+79242091611,@popik,popik@gmail.com')
test4 = Student_short.parse_object(test1)
test5 = Student_short.parse_object(test2)
test6 = Student_short.parse_object(test3)

student_arr = [test4, test5, test6]

data_list = DataListStudentShort.new(student_arr)

puts 'get_selected'
data_list.sel(3)
print "#{data_list.get_selected}\n"

data_list.sel([1, 2, 3])
print "#{data_list.get_selected}\n"

data_list.sel([3, 1, 2])
print "#{data_list.get_selected}\n"

puts 'get_names'
data_list.get_names.each { |arr| print(arr, "\n") }

data_table = data_list.get_data
print "class: #{data_table.class}\nrows: #{data_table.n_rows}\ncolumns: #{data_table.n_columns}\n"

rows = data_table.n_rows
columns = data_table.n_columns

(0...rows).each do |arr|
  puts
  (0...columns).each { |el| print(data_table.get(arr, el),' ')}
end