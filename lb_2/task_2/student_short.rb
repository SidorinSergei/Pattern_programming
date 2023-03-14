require_relative 'super_student.rb'
class Student_short<SuperStudent
  attr_reader :id, :name, :git, :contact
  protected :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git,:last_name=, :first_name=, :patronymic=, :phone=, :telegram=, :email=, :git=
  def initialize(student)
    @id = student[:id]
    @name = "#{student[:last_name]} #{student[:first_name][0]}.#{student[:patronymic][0]}."
    @git = student[:git]
    @contact = "#{student[:phone]? student[:phone] : '-'}, #{student[:telegram]? student[:telegram] : '-'}, #{student[:email]? student[:email] : '-'}"
  end

  def self.parse_string(input_string)
    hash = parse(input_string)
    Student_short.new(hash)
  end
  def getInfo
    "#{@id}, #{@name}, #{@git}, #{@contact}"
  end

end
