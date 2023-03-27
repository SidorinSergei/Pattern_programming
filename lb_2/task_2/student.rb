require_relative 'super_student.rb'
class Student<SuperStudent

  public_class_method :new

  NAME = /(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/

  public :id, :phone, :telegram, :email, :git
  def initialize(id,last_name,first_name,patronymic,git:nil ,phone:nil ,telegram:nil ,email:nil )
    raise(ArgumentError,'ФИО обязательно должно быть указано!') unless last_name && first_name && patronymic

    self.id=id
    self.last_name=last_name
    self.first_name=first_name
    self.patronymic=patronymic
    self.git=git
    self.phone=phone
    self.telegram=telegram
    self.email=email

  end

  def getInfo
    cont_arr = [@phone,@telegram,@email]
    contact = cont_arr.find_index {|cont| !cont.nil?}
    "#{@id}, #{get_name_info}, #{@git? @git : '-'}, #{contact ? cont_arr[contact] : '-'}"
  end

  def get_name_info
    "#{@last_name} #{@first_name[0]}.#{@patronymic[0]}"
  end

  def self.valid_name?(str)
    str.match?(NAME)
  end

  def last_name=(value)
    raise ArgumentError,'Неверный формат фамилии' unless !value.nil? && Student.valid_name?(value)
    @last_name=value
  end

  def first_name=(value)
    raise ArgumentError,'Неверный формат имени' unless !value.nil? && Student.valid_name?(value)
    @first_name=value
  end

  def patronymic=(value)
    raise ArgumentError,'Неверный формат отчества' unless !value.nil? && Student.valid_name?(value)
    @patronymic=value
  end
  def self.from_hash(hash)
    id = hash.delete(:id)
    last_name = hash.delete(:last_name)
    first_name = hash.delete(:first_name)
    patronymic = hash.delete(:patronymic)
    git = hash.delete(:git)
    phone = hash.delete(:phone)
    telegram = hash.delete(:telegram)
    email = hash.delete(:email)
    new(id,last_name,first_name,patronymic,git:git ,phone:phone ,telegram:telegram ,email:email )
  end

  def self.parse(id,str)
    class_fileds = [:id,:last_name,:first_name,:patronymic,:git,:phone,:telegram,:email]

    begin
      pars_str = str.split(',')
      pars_str.unshift(id)

      if pars_str.length < class_fileds.length
        raise ArgumentError,"Неверное количество аргументов в строке: #{str}"
      end

      pars_str.map! {|str| str == '-' ? nil : str}
      arg = class_fileds.zip(pars_str).to_h
      from_hash(arg)
    rescue NoMethodError
      puts "Данная строка не подлежит парсингу: #{str}"
    end
  end

  def self.read_from_txt(file_path)
    count_id=1
    students = []
    begin
      arr=IO.readlines(file_path)
      arr.map! {|str| str.chomp!}

      arr.each do |str_obj|
        temp = self.parse(count_id,str_obj)
        students.push(temp)
        count_id+=1
      end

      students

    rescue SystemCallError
      puts "File not found at the given address #{file_path}"
    rescue => error
      puts "{error}\nID Записи: #{count_id}"
    end
  end

  def Student.write_to_txt(arr,file_path)
    begin
      File.open(file_path,'w') do |file|
        arr.each {|obj| file.write "#{obj.getInfo}\n"}
      end
    rescue SystemCallError
      puts "File not found at the given address #{file_path}"
    rescue => error
      puts "{error}\nID Записи: #{count_id}"
    end
  end

end