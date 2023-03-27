require_relative 'student.rb'
require_relative 'student_short.rb'
require_relative 'super_student.rb'

#students = Student.read_from_txt('C:\Users\79892\Documents\GitHub\Pattern_programming\lb_2\task_2\test.txt')
#students.each {|student| puts student.getInfo}
students = [
  Student.new(1, "Иванов", "Иван", "Иванович", git: "https://github.com/Ivanov",telegram: "@ivanov", phone: "79001234567",email: "ivanjv@example.com"),
  Student.new(2, "Петров", "Петр", "Петрович", telegram: "@petrov", email: "petrov@example.com",git: "https://github.com/petrov", phone: "79001234567"),
]

Student.write_to_txt(students, "students.txt")

