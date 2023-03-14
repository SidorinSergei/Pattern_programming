class SuperStudent

  attr_accessor :id, :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git

  #PHONE = /^@((8|\+7)[\-]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}&/
  PHONE= /\A\+?\d{11}\z/.freeze
  EMAIL= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  TELEGRAM=/^@[A-Za-z\d_]{5,32}$/
  GIT=/\Ahttps:\/\/github\.com\/\w+\z/

  def SuperStudent.correct_email?(value)
    value.match?(EMAIL)
  end

  def SuperStudent.correct_git?(value)
    value.match?(GIT)
  end

  def SuperStudent.correct_phone?(value)
    value.match?(PHONE)
  end

  def SuperStudent.correct_telegram?(value)
    value.match?(TELEGRAM)
  end
  def valid_git
    raise ArgumentError,'Git обязательно должен быть указан!' unless git
  end

  def valid_contact
    raise ArgumentError,'Должен быть указан как минимум один контакт' unless phone||telegram||email
  end

  def valid_id
    raise ArgumentError,'ID - обязательный параметр' unless @id
  end
  def valid_fio
    raise ArgumentError,'ФИО - обязательные параметры' unless
      last_name&&first_name&&patronymic
  end
  def validate
    valid_contact
    valid_git
    valid_fio
    valid_id
  end
  def set_contacts(phone,telegram,email,git)
    raise ArgumentError,'Неверный формат номера телефона' if phone&&!SuperStudent.correct_phone?(phone)
    raise ArgumentError,'Неверный формат имени пользователя в telegram' if telegram&&!SuperStudent.correct_telegram?(telegram)
    raise ArgumentError,'Неверный формат электронной почты' if email&&!SuperStudent.correct_email?(email)
    raise ArgumentError, 'Неверный формат ссылки на git' if git&&!SuperStudent.correct_git?(git)
    @phone=phone
    @telegram=telegram
    @email=email
    @git=git

  end

  def self.parse(input_string)
    data = input_string.strip.split(/\s*,\s*/)
    raise ArgumentError.new('Invalid string format') if data.size > 8

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
    rescue => e
      raise ArgumentError, "Error parsing string '#{input_string}': #{e.message}"
    end

    return student_hash
  end

  def to_string
    "ID: #{@id}, Name: #{@last_name} #{@first_name} #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

end