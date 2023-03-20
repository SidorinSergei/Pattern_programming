require_relative 'super_student.rb'
class Student<SuperStudent
  def initialize(arg ={})

    @id=arg[:id]
    @last_name=arg[:last_name]
    @first_name=arg[:first_name]
    @patronymic=arg[:patronymic]
    @git=arg[:git]
    @phone=arg[:phone]
    @telegram=arg[:telegram]
    @email=arg[:email]


    validate

    begin
      Integer(@id)
    rescue ArgumentError
      puts 'ID должен быть целым числом'
    end

    set_contacts(git: @git, phone: @phone, telegram: @telegram, email: @email)
  end

  def getInfo
    "#{get_name_info}.; Git: #{@git}; #{get_cont_info}"
  end

  def get_cont_info
    "#{@phone? @phone : '-'}, #{@telegram? @telegram : '-'}, #{@email? @email : '-'}}"
  end
  def get_name_info
    "#{@last_name} #{@first_name[0]}.#{@patronymic[0]}"
  end

  def Student.parse(id,str)
    hash=super(id,str)
    new(hash)
  end

  def self.read_from_txt(file_path)
    count_id=1
    students = []
    begin
      arr=IO.readlines(file_path)
      arr.map! {|str| str.chomp!}

      arr.each do |str_obj|
        temp = SuperStudent.parse(count_id,str_obj)
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