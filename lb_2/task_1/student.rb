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

  def get_info
    puts "\nФамилия - #{last_name}\nИмя - #{first_name}\nОтчество - #{patronymic}\nID - #{id}\nНомер - #{phone}\nTelegram - #{telegram}\nПочта - #{email}\nGit - #{git}"
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
    data = input_string.split(',')
    raise ArgumentError.new('Invalid string format') if data.size != 8

    id = data[0].strip.to_i
    last_name = data[1].strip
    first_name = data[2].strip
    patronymic = data[3].strip
    phone = data[4].strip
    telegram = data[5].strip
    email = data[6].strip
    git = data[7].strip

    raise ArgumentError.new('Invalid id format') if id <= 0
    raise ArgumentError.new('Invalid phone format') if !Student.correct_phone?(phone)

    Student.new({id: id, last_name: last_name, first_name: first_name, patronymic: patronymic, phone: phone, telegram: telegram, email: email, git: git})
  end
  def to_string
    "ID: #{@id}, Name: #{@last_name} #{@first_name} #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

end