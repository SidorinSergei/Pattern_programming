require_relative 'super_student.rb'
class Student<SuperStudent
  def initialize(arg ={last_name:'',first_name:'',patronymic:''})
    @id=arg[:id]
    @last_name=arg[:last_name]
    @first_name=arg[:first_name]
    @patronymic=arg[:patronymic]

    raise ArgumentError,'ФИО - обязательные параметры' unless
      @last_name&&@first_name&&@patronymic

    set_contacts(arg[:phone],arg[:telegram],arg[:email],arg[:git])

    validate
  end

  def getInfo
    "#{get_name_info}.; Git: #{git}; #{get_cont_info}"
  end

  def get_cont_info
    return "Phone: #{phone}" if phone
    return "Telegram: #{telegram}" if telegram
    return "Email: #{email}" if email
  end
  def get_name_info
    "#{last_name} #{first_name[0]}.#{patronymic[0]}"
  end

  def self.parse_string(input_string)
    hash=parse(input_string)
    Student.new(hash)
  end

end