require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/studen.rb'
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_3/Data_list_student_short.rb'
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_3/data_table.rb'

class StudentsListTxt
  def initialize(path='C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/test.txt')
    @arr = []
    @id_range =(100..999).to_a

    begin
      count_object = 1

      arr = IO.readlines(path)
      arr.map! { |str|str.chomp! }
      id_temp_arr = @id_range.sample(arr.length)

      general_arr = id_temp_arr.zip(arr)
      general_arr.each do |tuple|
        temp_object = Student.from_string(tuple[0], tuple[1])
        @arr.push(temp_object)
        count_object += 1
      end

    rescue SystemCallError
      puts 'Не найден файл по заданному пути!'

    rescue => error
      puts "#{error}\n№ Объекта: #{count_object}"
    end
  end

  def write_file_txt(path='C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/test.txt')
    begin
      File.open(path, 'w') do |file|
        @arr.each { |obj| file.write "#{obj.to_s}\n" }
      end

    rescue SystemCallError
      puts 'Файла по такому пути не существует!'

    rescue => error
      puts error
    end
  end

  
end
