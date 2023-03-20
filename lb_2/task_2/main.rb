require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'super_student.rb'

arr = Student.read_from_txt('C:\Users\79892\Documents\GitHub\Pattern_programming\lb_2\task_2\test.txt')
puts arr

st=Student.parse(1,'Петров, Петр, Петрович, https://github.com/petrov, +71234567890, @petrov, -')
puts st.getInfo