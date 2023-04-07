require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student.rb'
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

  def get_student_by_id(id)
    @arr.find { |s| s.id == id }
  end

  def valid_data_list?(object)
    object.is_a?(DataListStudentShort) ? true : false
  end
  def valid_k_n?(k, n)
    k_lists_of_n_items = @arr.length / n
    k > k_lists_of_n_items ? false : true
  end

  def id_match(data_list_obj, matrix_only_data)
    matrix_only_data.map! { |arr| arr.shift }
    quan_objects = matrix_only_data.length
    (1..quan_objects).each { |number| data_list_obj.select(number) }
    id_arr = data_list_obj.get_selected
    [id_arr, matrix_only_data]
  end
  def convert_to_tuple(matrix_with_id)
    id_arr, matrix_only_data = matrix_with_id
    matrix_only_data.map! { |arr| "#{arr[0]}, #{arr[1]}, #{arr[2]}"}
    id_arr.zip(matrix_only_data)
  end

  def extract_data_table(data_list_obj)
    data_table_obj = data_list_obj.data
    rows = data_table_obj.num_rows
    columns = data_table_obj.num_columns
    matrix = []

    (0...rows).each do |i|
      temp_arr = []
      (0...columns).each { |j| temp_arr.push data_table_obj.get(i, j) }
      matrix.push(temp_arr)
    end
    matrix
  end
  def convert_to_student_short(data_list_obj)
    matrix_only_data = extract_data_table(data_list_obj)
    matrix_with_id = id_match(data_list_obj, matrix_only_data)
    tuple_arr = convert_to_tuple(matrix_with_id)
    tuple_arr.map { |id, str| Student_short.new(id, str)}
  end

  def get_k_n_student_short_list(k, n, exist_data_list = nil)
    message = "В текущем списке нет столько элементов, чтобы получить #{k} список из #{n} элементов!"
    raise(ArgumentError, message) unless valid_k_n?(k, n)

    student_short_arr = @arr.map { |obj| Student_short.parse_object(obj) }

    if exist_data_list
      message = "В качестве необязатального аргумента может использоваться только объект типа DataListStudentShort!"
      raise(ArgumentError, message) unless valid_data_list?(exist_data_list)
      additional_arr = convert_to_student_short(exist_data_list)
      student_short_arr += additional_arr
      student_short_arr.uniq! { |student_short| student_short.id }
    end

    student_short_arr = student_short_arr[(k - 1) * n...k * n]
    DataListStudentShort.new(student_short_arr)
  end

  def remove_student(id)
    @arr.reject! { |obj| obj.id == id }
  end

  def get_student_count
    @arr.length
  end

  def get_count_id
    @id_range.sample
  end

  def sort_by_fio
    @arr.sort_by! { |obj| [obj.last_name, obj.first_name, obj.patronymic]}
  end

  def valid_student?(object)
    object.is_a?(Student) ? true : false
  end

  def add_student(object)
    raise(ArgumentError,'Переданное значение должно быть типа Student!') unless valid_student?(object)
    object.id = get_count_id
    @arr.push(object)
  end

  def replace_student(id, object)
    raise(ArgumentError,'Переданное значение должно быть типа Student!') unless valid_student?(object)
    index = @arr.find_index { |obj|  obj.id == id}
    object.id = @arr[index].id
    @arr.fill(object, index, 1)
  end
end
