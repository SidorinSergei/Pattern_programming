class DataList
  def initialize(source_array)
    source_array.sort!
    @arr = source_array
    @selected = []
  end

  def select(number)
    @selected << number
  end

  def get_selected
    @selected
  end

  def get_names

  end

  def get_data

  end
end
