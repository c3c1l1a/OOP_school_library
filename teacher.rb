require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end

teacher = Teacher.new(30, 'Julia', 'Biology')
p teacher.age
p teacher.name
p teacher.specialization
p teacher.can_use_service?