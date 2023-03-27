class DataList
  def initialize(source_array)
    source_array.sort!
    @arr = source_array
    @selected = []
  end

  def select(number)
    begin
      numbers.is_a?(Array) ? @select += numbers.map! { |el| Integer(el - 1) } : @select += [Integer(numbers - 1)]
    rescue ArgumentError
      puts "Переданное(-ые) значение(-ия) должно(-ы) быть целочисленным(и)!"
    end
    nil
  end

  def get_selected
    res = @select.inject([]) { |acc, el| acc.push @arr[el].id  }
    @select = []
    res
  end

  def get_names

  end

  def get_data

  end
end
