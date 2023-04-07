require_relative 'students_list_base'
require 'json'

class StudentsListJSON < StudentsListBase

  public_class_method :new

  def initialize(path='C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_4/test_read_json.json')
    super
  end

  def write_to_file(path='C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_4/test_write_json.json')
    begin
      @arr.map! { |obj| obj.as_hash }
      File.open(path, 'w') do |file|
        file.write JSON.pretty_generate(@arr)
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
      str = IO.read(path).chomp
      hash_arr = JSON.parse(str,{symbolize_names: true})
      id_temp_arr = @id_range.sample(hash_arr.length)
      hash_arr.each { |hash| hash[:id] = id_temp_arr.shift }
      hash_arr.each do |hash|
        temp_obj = Student.from_hash(hash)
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