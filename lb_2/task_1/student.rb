class Student
  attr_accessor :id, :last_name, :first_name, :patronymic, :phone, :telegram, :email, :git

  def initialize(last_name,first_name,patronymic,phone=nil,telegram=nil,email=nil,git=nil)
    @id=nil
    @last_name=last_name
    @first_name=first_name
    @patronymic=patronymic
    @phone=phone
    @telegram=telegram
    @email=email
    @git=git
  end
end