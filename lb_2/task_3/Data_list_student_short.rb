require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'data_list.rb'

class DataListStudentShort < DataList
  def initialize(source_array)
    super
    @names = set_names
  end

  def arr=(source_array)
    raise(ArgumentError, 'Массив может содержать только элементы StudentShort!') unless valid_array?(source_array)
    super
    self.data = DataTable.new(@arr)
    nil
  end

  protected

  def valid_array?(array)
    array.all? { |obj| obj.is_a?(Student_short)}
  end

  def set_names
    acc = []
    count_attr = 1
    %w[ФИО Git Контакт].each do |attr|
      acc.push [count_attr, attr]
      count_attr += 1
    end
    acc
  end
end

