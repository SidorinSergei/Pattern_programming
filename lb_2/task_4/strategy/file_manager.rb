require_relative 'txt_file_strategy'
require_relative 'json_file_strategy'
require_relative 'yaml_file_strategy'

class FileManager

  def read_the_file(source_path)
    choose_the_strategy(source_path)
    @current_strategy.read_the_file(source_path)
  end

  def write_to_file(source_path, data)
    choose_the_strategy(source_path)
    @current_strategy.write_to_file(source_path, data)
  end

  private

  def choose_the_strategy(source_path)
    case File.extname(source_path)
    when '.txt'
      @current_strategy = TxtFileStrategy.new
    when '.json'
      @current_strategy = JsonFileStrategy.new
    when '.yaml'
      @current_strategy = YamlFileStrategy.new
    else
      raise "Файла по такому пути не существует!"
    end
  end

end