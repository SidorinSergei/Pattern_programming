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
    raise ArgumentError,'Git обязательно должен быть указан!' unless @git
  end

  def valid_contact
    raise ArgumentError,'Должен быть указан как минимум один контакт' unless @phone||@telegram||@email
  end

  def valid_id
    raise ArgumentError,'ID - обязательный параметр' unless @id
  end
  def valid_fio
    raise ArgumentError,'ФИО - обязательные параметры' unless
      @last_name&&@first_name&&@patronymic
  end

  protected
  def validate
    valid_contact
    valid_git
    valid_fio
    valid_id
  end
  def set_contacts(git: ,phone: , telegram: , email: )
    raise ArgumentError,'Неверный формат номера телефона' if phone&&!SuperStudent.correct_phone?(phone)
    raise ArgumentError,'Неверный формат имени пользователя в telegram' if telegram&&!SuperStudent.correct_telegram?(telegram)
    raise ArgumentError,'Неверный формат электронной почты' if email&&!SuperStudent.correct_email?(email)
    raise ArgumentError, 'Неверный формат ссылки на git' if git&&!SuperStudent.correct_git?(git)
    @phone=phone
    @telegram=telegram
    @email=email
    @git=git

  end

  def SuperStudent.parse(id,str)
    class_field=[:id,:last_name,:first_name,:patronymic,:git,:phone,:telegram,:email]

    begin
      data = str.split(', ')
      data.unshift(id)
      if data.size<class_field.size
        raise ArgumentError.new('Invalid string format')
      end

      data.map! {|val| val=='-' ? nil : val}
      arg=class_field.zip(data).to_h
    rescue NoMethodError
      raise ArgumentError, "Error parsing string "
    end
  end

  def to_string
    "ID: #{@id}, Name: #{@last_name} #{@first_name} #{@patronymic}, Phone: #{@phone}, Telegram: #{@telegram}, Email: #{@email}, Git: #{@git}"
  end

end