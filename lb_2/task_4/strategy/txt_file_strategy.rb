require_relative 'file_proc_strategy'

class TxtFileStrategy
  include FileProcStrategy

  def read_the_file(path)
    object_array = []
    begin
      count_obj = 1
      arr = IO.readlines(path)
      arr.map! { |str|str.chomp! }
      arr.each do |str|
        temp_obj = Student.parse(count_obj, str)
        object_array.push(temp_obj)
        count_obj += 1
      end
    rescue SystemCallError
      puts 'Файла по такому пути не существует!'
    rescue => error
      puts "#{error}\n№ Объекта: #{count_obj}"
    end
    object_array
  end

  def write_to_file(path, data)
    begin
      File.open(path, 'w') do |file|
        data.each { |obj| file.write "#{obj.to_s}\n" }
      end
    rescue SystemCallError
      puts 'Файла по такому пути не существует!'
    rescue => error
      puts error
    end
  end

end