require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parental_permission, classroom=nil)
    super(age, name, parental_permission: parental_permission)
    @classroom = classroom

    if (classroom)
      assign_classroom
    end
  end

  def assign_classroom
    @classroom.students << self unless @classroom.students.include? self
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
