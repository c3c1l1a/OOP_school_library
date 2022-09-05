require_relative './Person.rb'

class Student < Person
	attr_reader :classroom
	def initialize(age, name, parental_permission, classroom)
		super(age, name, parental_permission)
		@classroom = classroom
	end

	def play_hooky
		"¯\\(ツ)/¯"
	end
end


student = Student.new(10, 'Kate', false, '2b')
p student.age 
p student.name 
p student.classroom
p student.can_use_service?