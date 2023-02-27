class Student
  attr_accessor :id, :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git

  PHONE = /^@((8|\+7)[\-]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}&/
  EMAIL= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  TELEGRAM=/^@[A-Za-z\d_]{5,32}$/
  GIT=/\Ahttps:\/\/github\.com\/\w+\z/

  def Student.correct_email?(value)
    value.match?(EMAIL)
  end

  def Student.correct_git(value)
    value.match?(GIT)
  end

  def Student.correct_phone(value)
    value.match?(PHONE)
  end

  def Student.correct_telegram(value)
    value.match?(value)
  end

  def initialize(arg ={last_name:'',first_name:'',patronymic:''})
    @id=arg[:id]
    @last_name=arg[:last_name]
    @first_name=arg[:first_name]
    @patronymic=arg[:patronymic]

    raise ArgumentError,'ФИО - обязательные параметры' unless
      @last_name&&@first_name&&@patronymic

    @phone=phone
    @telegram=telegram
    @email=email
    @git=git
  end
end