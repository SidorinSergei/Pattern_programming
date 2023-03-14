require_relative 'student.rb'
require_relative 'student_short.rb'

str = '123,Ivanov, Ivan, Ivanovich, +79892270793, @ivan001, ivanov@mail.com, https://github.com/dzu'
obj=Student.parse_string(str)
puts obj.getInfo
student=Student_short.new({id:123,last_name:'Ivanov',first_name:'Ivan',patronymic:'Ivanovich',git:'https://github.com/dzu',phone:'+79892270793'})
student_short2 = Student_short.parse_string( '14,Ivanov, Ivan, Ivanovich, +79892270793, @ivan001, ivanov@mail.com, https://github.com/dzu')
puts student.getInfo
