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
    value.match?(value)
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

end