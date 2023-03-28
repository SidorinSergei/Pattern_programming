class DataTable
  def initialize(source_array)
    @arr = []
    count_attr= 1
    source_array.each do |obj|
      temp = [count_attr]
      fields = obj.instance_variables
      fields.map! { |sym| sym.to_s.gsub(/@/,'') }
      fields.select! { |el| el != 'id' }
      fields.each { |field| temp.push(obj.send(field)) }
      count_attr += 1
      @arr.push(temp)
    end
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
