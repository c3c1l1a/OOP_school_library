require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parental_permission, classroom)
    super(age, name, parental_permission: parental_permission)
    @classroom = classroom
  end

  def asign_classroom
    @classroom.students << self unless @classroom.students.include? self
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

# p student.age
# p student.name
# p student.classroom
# p student.can_use_service?
