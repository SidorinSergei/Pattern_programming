require_relative 'students_list_base'

class StudentsListTxt< StudentsListBase

  public_class_method :new
  def initialize(path='C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/test.txt')
    super
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

  protected
  def set_value(path)
    begin
      count_obj = 1
      arr = IO.readlines(path)
      arr.map! { |str|str.chomp! }
      id_temp_arr = @id_range.sample(arr.length)
      general_arr = id_temp_arr.zip(arr)
      general_arr.each do |tuple|
        temp_obj = Student.parse(tuple[0], tuple[1])
        @arr.push(temp_obj)
        count_obj += 1
      end
    rescue SystemCallError
      puts 'Файла по такому пути не существует!'
    rescue => error
      puts "#{error}\n№ Объекта: #{count_obj}"
    end
  end
end
