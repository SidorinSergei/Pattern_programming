require_relative 'student.rb'

str = '123, Ivanov, Ivan, Ivanovich, +79892270793, @ivan001, ivanov@mail.com, https://github.com/dzu'
obj = Student.parse(str)
info = obj.getInfo.split('; ')
puts info