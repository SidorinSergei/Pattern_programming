class SuperStudent

  private_class_method :new

  attr_reader :id, :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git

  #PHONE = /^@((8|\+7)[\-]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}&/
  PHONE= /\A\+?\d{11}\z/.freeze
  EMAIL= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  TELEGRAM=/^@[A-Za-z\d_]{5,32}$/
  GIT=/\Ahttps:\/\/github\.com\/\w+\z/

  def SuperStudent.valid_email?(value)
    value.match?(EMAIL)
  end

  def SuperStudent.valid_git?(value)
    value.match?(GIT)
  end

  def SuperStudent.valid_phone?(value)
    value.match?(PHONE)
  end

  def SuperStudent.valid_telegram?(value)
    value.match?(TELEGRAM)
  end
  def valid_git
    raise ArgumentError,'Git обязательно должен быть указан!' unless @git
  end



  protected
  def id=(value)
    raise ArgumentError,'ID должен быть целым числом' unless value.is_a?(Integer)
    @id=value
  end

  def phone=(value)
    raise ArgumentError,'Неверный формат номера телефона' unless SuperStudent.valid_phone?(value)
    @phone=value
  end

  def telegram=(value)
    raise ArgumentError,'Неверный формат имени пользователя в telegram' unless SuperStudent.valid_telegram?(value)
    @telegram=value
  end

  def email=(value)
    raise ArgumentError,'Неверный формат электронной почты' unless SuperStudent.valid_email?(value)
    @email=value
  end

  def git=(value)
    raise ArgumentError, 'Неверный формат ссылки на git' unless SuperStudent.valid_git?(value)
    @git=value
  end

  def there_is_contact?
    @phone||@telegram||@email ? true : false
  end

  def there_is_git?
    @git ? true : false
  end
  def available?
    there_is_git?&&there_is_contact?
  end

  def set_contacts(phone: nil , telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end

  def to_s
    str_represent = []
    fields = self.instance_variables.map{|sym| sym.to_s.gsub('@','')}-['id']
    fields.each do |attr|
      temp = self.instance_eval(attr)
      srt_represent<<(temp || '-')
    end
    str_represent.join(';')
  end

end