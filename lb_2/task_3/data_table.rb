class DataTable
  def initialize(source_array)
    @arr = source_array
  end

  def get_element(row, col)
    @arr[row][col]
  end

  def num_columns
    @arr[0].size
  end

  def num_rows
    @arr.size
  end
end
