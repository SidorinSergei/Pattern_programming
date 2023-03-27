#require_relative для student_short.rb из другой папки
require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'data_list.rb'

class DataListStudentShort < DataList
  def get_names
    @arr.map { |student| student.fio }
  end

  def get_data
    @arr.map { |student| [student.fio, student.git, student.contact] }
  end
end

