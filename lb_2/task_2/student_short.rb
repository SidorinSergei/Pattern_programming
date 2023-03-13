class Student_short
  attr_reader :id, :name, :git, :contact

  def initialize(student)
    @id = student.id
    @name = "#{student.last_name} #{student.first_name[0]}.#{student.patronymic[0]}."
    @git = student.git
    @contact = "#{student.phone}, #{student.telegram}, #{student.email}"
  end

  def self.initialize_from_string(id, info_str)
    parts = info_str.strip.split(/\s*,\s*/)
    raise ArgumentError.new('Invalid string format') if parts.size != 7

    @id = id
    @name = "#{parts[0]} #{parts[1][0]}.#{parts[2][0]}."
    @git = parts[6]
    @contact = "#{parts[3]}, #{parts[4]}, #{parts[5]}"
  end
end
