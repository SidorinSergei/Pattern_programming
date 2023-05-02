require 'D:/RubyProject/DoneApp/SourceManagement/Adapters/db_adapter.rb'
require 'D:/RubyProject/DoneApp/SourceManagement/Adapters/file_content_adapter.rb'

class StudentList

  def initialize(some_adapter)
    @adapter_obj = some_adapter
  end

  def get_by_id(id)
    @adapter_obj.get_by_id(id)
  end

  def get_k_n_student_short_list(list_number, quan_element, exist_data_list=nil)
    @adapter_obj.get_k_n_student_short_list(list_number, quan_element, exist_data_list)
  end

  def append(object)
    @adapter_obj.append(object)
  end

  def replace_by_id(id, object)
    @adapter_obj.replace_by_id(id, object)
  end

  def delete_by_id(id)
    @adapter_obj.delete_by_id(id)
  end

  def get_student_count
    @adapter_obj.get_student_count
  end

end