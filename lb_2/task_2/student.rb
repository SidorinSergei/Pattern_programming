class Student
  attr_accessor :id, :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git

  #PHONE = /^@((8|\+7)[\-]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}&/
  PHONE= /\A\+?\d{11}\z/.freeze
  EMAIL= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  TELEGRAM=/^@[A-Za-z\d_]{5,32}$/
  GIT=/\Ahttps:\/\/github\.com\/\w+\z/

  def Student.correct_email?(value)
    value.match?(EMAIL)
  end

  def Student.correct_git?(value)
    value.match?(GIT)
  end

  def Student.correct_phone?(value)
    value.match?(PHONE)
  end

  def Student.correct_telegram?(value)
    value.match?(TELEGRAM)
  end

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


  def set_contacts(phone,telegram,email,git)
    raise ArgumentError,'Неверный формат номера телефона' if phone&&!Student.correct_phone?(phone)
    raise ArgumentError,'Неверный формат имени пользователя в telegram' if telegram&&!Student.correct_telegram?(telegram)
    raise ArgumentError,'Неверный формат электронной почты' if email&&!Student.correct_email?(email)
    raise ArgumentError, 'Неверный формат ссылки на git' if git&&!Student.correct_git?(git)
    @phone=phone
    @telegram=telegram
    @email=email
    @git=git

  end

  def valid_git
    raise ArgumentError,'Git обязательно должен быть указан!' unless git
  end

  def valid_contact
    raise ArgumentError,'Должен быть указан как минимум один контакт' unless phone||telegram||email
  end

  def validate
    valid_contact
    valid_git
  end

  def self.parse(input_string)
    data = input_string.strip.split(/\s*,\s*/)
    raise ArgumentError.new('Invalid string format') if data.size != 8

    begin
      student_hash = {
        id: data[0],
        last_name: data[1],
        first_name: data[2],
        patronymic: data[3],
        phone: data[4],
        telegram: data[5],
        email: data[6],
        git: data[7]
      }
      student = self.new(student_hash)
      if !student.valid?
        raise ArgumentError, "Invalid data in string '#{input_string}'"
      end
    rescue => e
      raise ArgumentError, "Error parsing string '#{input_string}': #{e.message}"
    end

    return student
  end

  def valid?
    true
  end
  def to_string
    "ID: #{@id}, Name: #{@last_name} #{@first_name} #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

end