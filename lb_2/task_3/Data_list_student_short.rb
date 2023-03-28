require_relative 'C:/Users/79892/Documents/GitHub/Pattern_programming/lb_2/task_2/student_short.rb'
require_relative 'data_list.rb'

class DataListStudentShort < DataList
  def get_names
    objects_attributes = []
    count_attr = 1
    @arr.each do |obj|
      temp = obj.instance_variables
      temp.map! { |sym| sym.to_s.gsub(/@/,'') }
      temp.select! { |el| el != 'id' }
      temp.unshift(count_attr)
      objects_attributes.push(temp)
      count_attr += 1
    end
    objects_attributes
  end

  def get_data
    DataTable.new(@arr)
  end
end

