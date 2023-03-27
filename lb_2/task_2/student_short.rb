require_relative 'super_student.rb'
require_relative 'student.rb'
class Student_short<SuperStudent
  public_class_method :new
  attr_reader :fio, :contact
  def initialize(id,str)
    pars_str = str.split(',')
    self.id = id
    self.fio = pars_str[0]
    self.git = pars_str[1] == '-' ? nil : pars_str[1]
    self.contact = pars_str[2] == '-' ? nil : pars_str[2]
  end

  def self.parse_object(object)
    new(object.id,object.getInfo)
  end

end
