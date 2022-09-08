require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization, parental_permission)
    super(age, name, parental_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
