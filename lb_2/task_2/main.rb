require_relative 'student.rb'
require_relative 'student_short.rb'

str = '123,Ivanov, Ivan, Ivanovich, +79892270793, @ivan001, ivanov@mail.com, https://github.com/dzu'
obj = Student.parse(str)
student_short2 = Student_short.initialize_from_string(123, 'Ivanov, Ivan, Ivanovich, +79892270793, @ivan001, ivanov@mail.com, https://github.com/dzu')
puts student_short2
info = obj.getInfo.split('; ')
student_short= Student_short.new(obj)
puts student_short.name