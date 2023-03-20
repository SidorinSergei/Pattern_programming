#Создать класс Data_table.

class Data_table
  def initialize(table)
    @table = table
  end

  def get_element(row, col)
    @table[row][col]
  end

  def num_columns
    @table[0].size
  end

  def num_rows
    @table.size
  end
end
